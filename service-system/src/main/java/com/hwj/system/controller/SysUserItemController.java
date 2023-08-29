package com.hwj.system.controller;


import com.hwj.common.result.Result;
import com.hwj.model.vo.AssginUserVo;
import com.hwj.system.annotation.Log;
import com.hwj.system.enums.BusinessType;
import com.hwj.system.service.SysUserItemService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * <p>
 * 项目成员 前端控制器
 * </p>
 *
 * @author hwj
 * @since 2023-08-08
 */

@Api(tags = "项目成员管理接口")
@RestController
@RequestMapping("/admin/system/sysUserItem")
public class SysUserItemController {

    @Autowired
    private SysUserItemService sysUserItemService;

    @ApiOperation(value = "根据项目获取成员数据")
    @GetMapping("/toAssign/{itemId}")
    public Result toAssign(@PathVariable String itemId) {
        if (itemId == null) {
            return Result.fail();
        }
        Map<String, Object> userMap = sysUserItemService.getUsersByItemId(itemId);
        return Result.ok(userMap);
    }

    @Log(title = "项目成员管理",businessType = BusinessType.IMPORT)
    @PreAuthorize("hasAuthority('bnt.sysItem.assignItem')")
    @ApiOperation(value = "根据项目分配成员")
    @PostMapping("/doAssign")
    public Result doAssign(@RequestBody AssginUserVo assginUserVo) {
        if (assginUserVo == null) {
            return Result.fail();
        }
        sysUserItemService.doAssign(assginUserVo);
        return Result.ok();
    }

}

