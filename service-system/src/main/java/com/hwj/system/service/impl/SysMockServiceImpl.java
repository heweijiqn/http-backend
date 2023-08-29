package com.hwj.system.service.impl;



import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hwj.model.system.SysMock;

import com.hwj.model.vo.SysMockQueryVo;

import com.hwj.system.mapper.SysMockMapper;

import com.hwj.system.service.SysMockService;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;

import org.springframework.stereotype.Service;



/**

 * <p>

 * 模拟数据表 服务实现类

 * </p>

 *

 * @author hwj

 * @since 2023-08-24

 */

@Service

public class SysMockServiceImpl extends ServiceImpl<SysMockMapper, SysMock> implements SysMockService {



    @Override

    public IPage<SysMock> selectPage(Page<SysMock> pageParam, SysMockQueryVo sysMockQueryVo) {

        return baseMapper.selectPage(pageParam,sysMockQueryVo);

    }

     @Override
    public SysMock selectMockDataByApiName(String apiName) {
        return baseMapper.selectMockDataByApiName(apiName);
    }

}

