package com.hwj.system.controller;


import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hwj.common.result.Result;
import com.hwj.common.untils.MD5;
import com.hwj.model.system.SysUser;
import com.hwj.model.vo.SysUserQueryVo;
import com.hwj.system.annotation.Log;
import com.hwj.system.enums.BusinessType;
import com.hwj.system.service.SysUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author hwj
 * @since 2023-06-14
 */
@Api(tags = "成员管理接口")
@RestController
@RequestMapping("/admin/system/sysUser")
public class SysUserController {

    @Autowired
    private SysUserService sysUserService;



    @PreAuthorize("hasAuthority('bnt.sysUser.list')")
    @ApiOperation("成员列表")
    @GetMapping("/{page}/{limit}")
    public Result list(@PathVariable Long page,
                       @PathVariable Long limit,
                       SysUserQueryVo sysUserQueryVo) {
        if (page < 0 || limit < 0) {
            return Result.fail();
        }else if (sysUserQueryVo == null){
            return Result.fail();
        }
        Page<SysUser> pageParam = new Page<>(page,limit);
        //调用service方法
        IPage<SysUser> pageModel = sysUserService.selectPage(pageParam,sysUserQueryVo);
        return Result.ok(pageModel);
    }

    @ApiOperation(value = "获取成员")
    @GetMapping("/getUser/{id}")
    public Result get(@PathVariable String id) {
        if (id == null) {
            return Result.fail();
        }
        SysUser user = sysUserService.getById(id);
        return Result.ok(user);
    }



    @ApiOperation(value = "保存成员")
    @PostMapping("/save")
    @PreAuthorize("hasAuthority('bnt.sysUser.save')")
    public Result save(@RequestBody SysUser user) {
        String encrypt = MD5.encrypt(user.getPassword());
        user.setPassword(encrypt);
        boolean save = sysUserService.save(user);
        if (save) {
            return Result.ok();
        }else {
            return Result.fail();
        }

    }


    @Log(title = "成员管理",businessType = BusinessType.UPDATE)
    @PreAuthorize("hasAuthority('bnt.sysUser.update')")
    @ApiOperation(value = "更新成员")
    @PutMapping("/update")
    public Result updateById(@RequestBody SysUser user) {
        if (user == null) {
            return Result.fail();
        }
        boolean update = sysUserService.updateById(user);
        if (update) {
            return Result.ok();
        }else {
            return Result.fail();
        }
    }


    @Log(title = "成员管理",businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysUser.remove')")
    @ApiOperation(value = "删除成员")
    @DeleteMapping("/remove/{id}")
    public Result remove(@PathVariable String id) {
         if (id == null) {
              return Result.fail();
            }
        boolean removeById = sysUserService.removeById(id);
       if (removeById) {
           return Result.ok();
         }else {
              return Result.fail();
       }
    }

    @Log(title = "成员管理",businessType = BusinessType.DELETE)
    @PreAuthorize("hasAuthority('bnt.sysUser.updateStatus')")
    @ApiOperation(value = "修改成员状态")
    @GetMapping("/updateStatus/{id}/{status}")
    public Result updateStatus(@PathVariable String id,
                               @PathVariable Integer status) {
        if (id == null || status == null) {
            return Result.fail();
        }
       sysUserService.updatesStatus(id,status);
       return Result.ok();
    }


}

