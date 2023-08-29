package com.hwj.system.controller;





import com.hwj.common.result.Result;

import com.hwj.model.vo.AssginApiVo;

import com.hwj.system.annotation.Log;

import com.hwj.system.enums.BusinessType;

import com.hwj.system.service.SysItemApiService;

import io.swagger.annotations.Api;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.*;



import java.util.Map;



/**

 * <p>

 * 项目接口 前端控制器

 * </p>

 *

 * @author hwj

 * @since 2023-08-22

 */



@Api(tags = "项目接口管理接口")

@RestController

@RequestMapping("/admin/system/sysItemApi")

public class SysItemApiController {



    @Autowired

    private SysItemApiService sysItemApiService;



    @ApiOperation(value = "根据项目获取接口数据")

    @GetMapping("/toAssign/{itemId}")

    public Result toAssign(@PathVariable String itemId) {

        if (itemId == null) {

            return Result.fail();

        }

        Map<String, Object> apisByItemId = sysItemApiService.getApisByItemId(itemId);

        return Result.ok(apisByItemId);

    }



    @Log(title = "项目接口管理",businessType = BusinessType.IMPORT)

    @PreAuthorize("hasAuthority('bnt.sysItem.assignapi')")

    @ApiOperation(value = "根据项目分配接口")

    @PostMapping("/doAssign")

    public Result doAssign(@RequestBody AssginApiVo assginApiVo) {

        if (assginApiVo == null) {

            return Result.fail();

        }

        sysItemApiService.doAssign(assginApiVo);

        return Result.ok();

    }



    /*

    获取接口所属项目

     */

    @ApiOperation(value = "获取接口所属项目")

    @GetMapping("/getItemsByApiId/{apiId}")

    public Result getItemsByApiId(@PathVariable String apiId) {

        if (apiId == null) {

            return Result.fail();

        }

        String itemsByApiId = sysItemApiService.getItemsByApiId(apiId);



        return Result.ok(itemsByApiId);

    }









}



