package com.hwj.system.service;

import com.hwj.model.system.SysItemApi;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hwj.model.vo.AssginApiVo;

import java.util.Map;

/**
 * <p>
 * 项目接口 服务类
 * </p>
 *
 * @author hwj
 * @since 2023-08-22
 */
public interface SysItemApiService extends IService<SysItemApi> {

    Map<String, Object> getApisByItemId(String itemId);


    void doAssign(AssginApiVo assginApiVo);


    String getItemsByApiId(String apiId);
}
