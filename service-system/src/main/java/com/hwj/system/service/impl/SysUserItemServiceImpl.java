package com.hwj.system.service.impl;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwj.model.system.SysUser;
import com.hwj.model.system.SysUserItem;
import com.hwj.model.vo.AssginUserVo;
import com.hwj.system.mapper.SysUserItemMapper;
import com.hwj.system.mapper.SysUserMapper;
import com.hwj.system.service.SysUserItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目成员 服务实现类
 * </p>
 *
 * @author hwj
 * @since 2023-08-08
 */
@Service
@Transactional
public class SysUserItemServiceImpl extends ServiceImpl<SysUserItemMapper, SysUserItem> implements SysUserItemService {



    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public Map<String, Object> getUsersByItemId(String itemId) {
        //获取所有用户
        List<SysUser> sysUsers = sysUserMapper.selectList(null);
        //根据项目id查询，已经分配用户
        QueryWrapper<SysUserItem> wrapper= new QueryWrapper<>();
        wrapper.eq("item_id",itemId);
        List<SysUserItem> sysUserItems = baseMapper.selectList(wrapper);
        List<String> userIds = new ArrayList<>();
        for (SysUserItem sysUserItem:sysUserItems) {
            String userId = sysUserItem.getUserId();
            userIds.add(userId);
        }
        //封装到map集合
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("allUsers",sysUsers);//所有用户
        returnMap.put("userIds",userIds);//项目分配用户id集合
        return returnMap;


    }

    @Override
    public void doAssign(AssginUserVo assginUserVo) {
        //根据项目id删除之前分配用户
        QueryWrapper<SysUserItem> wrapper = new QueryWrapper<>();
        wrapper.eq("item_id",assginUserVo.getItemId());
        baseMapper.delete(wrapper);
        //添加新的分配用户
        List<String> userIdList = assginUserVo.getUserIdList();
        for (String userId:userIdList) {
            SysUserItem sysUserItem = new SysUserItem();
            sysUserItem.setItemId(assginUserVo.getItemId());
            sysUserItem.setUserId(userId);
            baseMapper.insert(sysUserItem);
        }
    }


}
