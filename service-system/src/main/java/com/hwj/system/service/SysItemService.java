package com.hwj.system.service;





import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.baomidou.mybatisplus.extension.service.IService;

import com.hwj.model.system.SysItem;

import com.hwj.model.vo.SysItemQueryVo;
import com.hwj.model.vo.SysItemVo;


/**

 * <p>

 * 项目表 服务类

 * </p>

 *

 * @author hwj

 * @since 2023-08-06

 */

public interface SysItemService extends IService<SysItem> {



    IPage<SysItem> selectPage(Page<SysItem> pageParam, SysItemQueryVo sysItemQueryVo);

  // swagger
   void importSwagger(SysItemVo sysItemVo);

}

