package com.hwj.system.service.impl;


import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hwj.model.system.SysApi;
import com.hwj.model.system.SysItem;
import com.hwj.model.vo.SysItemQueryVo;
import com.hwj.model.vo.SysItemVo;
import com.hwj.system.mapper.SysApiMapper;
import com.hwj.system.mapper.SysItemMapper;
import com.hwj.system.service.SysItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
// import sun.dc.pr.PRError;

import java.util.ArrayList;



/**

 * <p>

 * 项目表 服务实现类

 * </p>

 *

 * @author hwj

 * @since 2023-08-06

 */

@Service

@Transactional

public class SysItemServiceImpl extends ServiceImpl<SysItemMapper, SysItem> implements SysItemService {

      @Autowired
    private SysItemMapper sysItemMapper;

    @Autowired
    private SysApiMapper sysApiMapper;

    @Override

    public IPage<SysItem> selectPage(Page<SysItem> pageParam, SysItemQueryVo sysItemQueryVo) {

       return baseMapper.selectPage(pageParam,sysItemQueryVo);

    }

  @Override
    public void importSwagger(SysItemVo sysItemVo) {
        ArrayList<SysApi> apiList = new ArrayList<SysApi>();
        String[] sysApis = sysItemVo.getSysApi();
        System.out.println("=============================================================111");
        for (String api: sysApis) {
            SysApi sysApi = (SysApi) JSON.parseObject(api, SysApi.class);
            System.out.println("=============================================================222");
            sysApiMapper.insert(sysApi);
        }
        System.out.println("=============================================================333");
        SysItem sysItem = (SysItem)JSON.parseObject(sysItemVo.getInfo(), SysItem.class);
        sysItemMapper.insert(sysItem);
    }

}

