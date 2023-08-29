package com.hwj.system.controller;





import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hwj.common.result.Result;

import com.hwj.model.system.SysItem;

import com.hwj.model.vo.SysItemQueryVo;

import com.hwj.system.annotation.Log;

import com.hwj.system.enums.BusinessType;

import com.hwj.system.service.SysItemService;

import io.swagger.annotations.Api;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.*;

import com.hwj.model.vo.SysItemVo;

/**

 * <p>

 * 项目表 前端控制器

 * </p>

 *

 * @author hwj

 * @since 2023-08-06

 */



@Api(tags = "项目管理接口")

@RestController

@RequestMapping("/admin/system/sysItem")

public class SysItemController {



    @Autowired

    private SysItemService sysItemService;





    @PreAuthorize("hasAuthority('bnt.sysItem.list')")

    @ApiOperation("项目列表")

    @GetMapping("/{page}/{limit}")

    public Result list(@PathVariable Long page,

                       @PathVariable Long limit,

                       SysItemQueryVo sysItemQueryVo) {

        if (page < 0 || limit < 0) {

            return Result.fail();

        }else if (sysItemQueryVo == null){

            return Result.fail();

        }

        Page<SysItem> pageParam = new Page<>(page,limit);

        IPage<SysItem> pageModel = sysItemService.selectPage(pageParam,sysItemQueryVo);

        return Result.ok(pageModel);









    }



    @ApiOperation(value = "获取项目")

    @GetMapping("/getItem/{id}")

    public Result get(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        SysItem sysItem = sysItemService.getById(id);

        return Result.ok(sysItem);

    }







    @ApiOperation(value = "保存项目")

    @PostMapping("/save")

    @PreAuthorize("hasAuthority('bnt.sysItem.save')")

    @Log(title = "项目管理",businessType = BusinessType.INSERT)

    public Result save(@RequestBody SysItem sysItem) {

        if (sysItem == null) {

            return Result.fail();

        }

        boolean save = sysItemService.save(sysItem);

        if (save) {

            return Result.ok();

        }else {

            return Result.fail();

        }



    }





    @Log(title = "项目管理",businessType = BusinessType.UPDATE)

    @PreAuthorize("hasAuthority('bnt.sysItem.update')")

    @ApiOperation(value = "更新项目")

    @PutMapping("/update")

    public Result updateById(@RequestBody SysItem sysItem) {

        if (sysItem == null) {

            return Result.fail();

        }

        boolean update = sysItemService.updateById(sysItem);

        if (update) {

            return Result.ok();

        }else {

            return Result.fail();

        }

    }





    @Log(title = "项目管理",businessType = BusinessType.DELETE)

    @PreAuthorize("hasAuthority('bnt.sysItem.remove')")

    @ApiOperation(value = "删除项目")

    @DeleteMapping("/remove/{id}")

    public Result remove(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        boolean removeById = sysItemService.removeById(id);

        if (removeById) {

            return Result.ok();

        }else {

            return Result.fail();

        }

    }

  // swagger
    @ApiOperation(value = "调用请求方式为get的接口")
    @PostMapping(value = "/import")
    @Log(title = "接口管理",businessType = BusinessType.OTHER)
    public Result importSwagger(@RequestBody SysItemVo sysItemVo) {

        sysItemService.importSwagger(sysItemVo);

//
//        JSONObject sysInfo = JSONObject.parseObject(sysItemVo.getInfo());
//        SysItem sysInfo1 = JSON.toJavaObject(sysInfo, SysItem.class);
//        System.out.println(sysInfo1);
        return Result.ok();
    }



}



