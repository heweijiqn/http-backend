package com.hwj.system.service;


import com.baomidou.mybatisplus.extension.service.IService;
import com.hwj.model.system.SysUserItem;
import com.hwj.model.vo.AssginUserVo;

import java.util.Map;

/**
 * <p>
 * 项目成员 服务类
 * </p>
 *
 * @author hwj
 * @since 2023-08-08
 */
public interface SysUserItemService extends IService<SysUserItem> {

    Map<String, Object> getUsersByItemId(String itemId);


    void doAssign(AssginUserVo assginUserVo);
}
