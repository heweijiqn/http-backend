package com.hwj.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hwj.common.result.Result;
import com.hwj.model.system.SysApi;
import com.hwj.model.system.SysItem;
import com.hwj.model.system.SysItemApi;
import com.hwj.model.system.SysUserItem;
import com.hwj.model.vo.AssginApiVo;
import com.hwj.system.mapper.SysApiMapper;
import com.hwj.system.mapper.SysItemApiMapper;
import com.hwj.system.mapper.SysItemMapper;
import com.hwj.system.service.SysItemApiService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 项目接口 服务实现类
 * </p>
 *
 * @author hwj
 * @since 2023-08-22
 */
@Service
public class SysItemApiServiceImpl extends ServiceImpl<SysItemApiMapper, SysItemApi> implements SysItemApiService {

    @Autowired
    private SysApiMapper sysApiMapper;

    @Autowired
    private SysItemMapper sysItemMapper;

    @Override
    public Map<String, Object> getApisByItemId(String itemId) {
        //获取所有接口
        List<SysApi> sysApis = sysApiMapper.selectList(null);
        QueryWrapper<SysItemApi> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("item_id", itemId);
        //获取已经分配的接口
        List<SysItemApi> sysItemApis = baseMapper.selectList(queryWrapper);
        List<String> apiIds = new ArrayList<>();
        for (SysItemApi sysItemApi : sysItemApis) {
            String apiId = sysItemApi.getApiId();
            apiIds.add(apiId);
        }
        Map<String, Object> returnMap = new HashMap<>();
        returnMap.put("allApis", sysApis);
        returnMap.put("apiIds", apiIds);
        return returnMap;
    }


    @Override
    public void doAssign(AssginApiVo assginApiVo) {
        QueryWrapper<SysItemApi> wrapper = new QueryWrapper<>();
        wrapper.eq("item_id",assginApiVo.getItemId());
        baseMapper.delete(wrapper);
        //添加项目接口
        List<String> apiIdList = assginApiVo.getApiIdList();
        for (String apiId : apiIdList) {
            SysItemApi sysItemApi = new SysItemApi();
            sysItemApi.setItemId(assginApiVo.getItemId());
            sysItemApi.setApiId(apiId);
            baseMapper.insert(sysItemApi);
        }
    }


    @Override
    public String getItemsByApiId(String apiId) {
        //根据接口id获取项目接口表中的项目id
        QueryWrapper<SysItemApi> wrapper = new QueryWrapper<>();
        wrapper.eq("api_id",apiId);
        List<SysItemApi> sysItemApis = baseMapper.selectList(wrapper);
        List<String> itemIds = new ArrayList<>();
        for (SysItemApi sysItemApi : sysItemApis) {
            String itemId = sysItemApi.getItemId();
            itemIds.add(itemId);
        }
        if (itemIds.size() == 0) {
            return null;
        }

        List<SysItem> sysItems = sysItemMapper.selectBatchIds(itemIds);

        List<String> itemNames = new ArrayList<>();
        for (SysItem sysItem : sysItems) {
            String itemName = sysItem.getName();
            itemNames.add(itemName);
        }
        String join = String.join("|", itemNames);
        return join;
    }


}
