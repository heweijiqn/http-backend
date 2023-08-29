package com.hwj.system.service;



import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hwj.model.system.SysMock;

import com.baomidou.mybatisplus.extension.service.IService;

import com.hwj.model.vo.SysMockQueryVo;



/**

 * <p>

 * 模拟数据表 服务类

 * </p>

 *

 * @author hwj

 * @since 2023-08-24

 */

public interface SysMockService extends IService<SysMock> {



    IPage<SysMock> selectPage(Page<SysMock> pageParam, SysMockQueryVo sysMockQueryVo);

    SysMock selectMockDataByApiName(String apiName);

}

