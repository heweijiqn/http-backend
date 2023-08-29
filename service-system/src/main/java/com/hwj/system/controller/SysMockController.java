package com.hwj.system.controller;





import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hwj.common.result.Result;

import com.hwj.model.system.SysMock;

import com.hwj.model.vo.SysMockQueryVo;

import com.hwj.system.annotation.Log;

import com.hwj.system.enums.BusinessType;

import com.hwj.system.service.SysMockService;

import io.swagger.annotations.Api;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.*;



/**

 * <p>

 * 模拟数据表 前端控制器

 * </p>

 *

 * @author hwj

 * @since 2023-08-24

 */

@Api(tags = "模拟数据接口")

@RestController

@RequestMapping("/admin/system/sysMock")

public class SysMockController {



    @Autowired

    private SysMockService sysMockService;







    @ApiOperation("模拟数据列表")

    @GetMapping("/{page}/{limit}")

    public Result list(@PathVariable Long page,

                       @PathVariable Long limit,

                       SysMockQueryVo sysMockQueryVo) {

        if (page < 0 || limit < 0) {

            return Result.fail();

        }else if (sysMockQueryVo == null){

            return Result.fail();

        }

        Page<SysMock> pageParam = new Page<>(page,limit);

        //调用service方法

        IPage<SysMock> pageModel = sysMockService.selectPage(pageParam,sysMockQueryVo);

        return Result.ok(pageModel);

    }





    @GetMapping("/getMock/{id}")

    public Result get(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        SysMock mock = sysMockService.getById(id);

        return Result.ok(mock);

    }







    @PostMapping("/save")

    @PreAuthorize("hasAuthority('bnt.sysMock.save')")

    @Log(title = "模拟数据管理",businessType = BusinessType.INSERT)

    public Result save(@RequestBody SysMock mock) {

        boolean save = sysMockService.save(mock);

        if (save) {

            return Result.ok();

        }else {

            return Result.fail();

        }



    }





    @Log(title = "模拟数据管理",businessType = BusinessType.UPDATE)

    @ApiOperation(value = "更新数据")

    @PutMapping("/update")

    public Result updateById(@RequestBody SysMock mock) {

        if (mock == null) {

            return Result.fail();

        }

        boolean update = sysMockService.updateById(mock);

        if (update) {

            return Result.ok();

        }else {

            return Result.fail();

        }

    }





    @Log(title = "模拟数据管理",businessType = BusinessType.DELETE)

    @ApiOperation(value = "删除数据")

    @DeleteMapping("/remove/{id}")

    public Result remove(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        boolean removeById = sysMockService.removeById(id);

        if (removeById) {

            return Result.ok();

        }else {

            return Result.fail();

        }

    }



}



