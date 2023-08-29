package com.hwj.system.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hwj.model.system.SysApi;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hwj.model.vo.SysApiQueryVo;

/**
 * <p>
 * 接口表 服务类
 * </p>
 *
 * @author hwj
 * @since 2023-08-09
 */
public interface SysApiService extends IService<SysApi> {

    IPage<SysApi> selectPage(Page<SysApi> pageParam, SysApiQueryVo sysApiQueryVo);


    SysApi selectApiById(String id);

}
