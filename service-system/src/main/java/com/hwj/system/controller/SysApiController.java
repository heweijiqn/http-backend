package com.hwj.system.controller;





import com.alibaba.fastjson.JSON;

import com.alibaba.fastjson.JSONObject;

import com.baomidou.mybatisplus.core.metadata.IPage;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;

import com.hwj.common.result.Result;

import com.hwj.model.system.SysApi;

import com.hwj.model.system.SysMock;

import com.hwj.model.vo.ReqSysApiQueryvo;

import com.hwj.model.vo.SysApiQueryVo;

import com.hwj.system.annotation.Log;

import com.hwj.system.enums.BusinessType;

import com.hwj.system.service.SysApiService;

import com.hwj.system.service.SysMockService;

import io.swagger.annotations.Api;

import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.access.prepost.PreAuthorize;

import org.springframework.web.bind.annotation.*;



import java.util.ArrayList;

import java.util.List;



/**

 * <p>

 * 接口表 前端控制器

 * </p>

 *

 * @author hwj

 * @since 2023-08-09

 */

@Api(tags = "接口管理接口")

@RestController

@RequestMapping("/admin/system/sysApi")

public class SysApiController {



    @Autowired

    private SysApiService sysApiService;



    @Autowired

    private SysMockService sysMockService;





    @PreAuthorize("hasAuthority('bnt.sysApi.list')")

    @ApiOperation("接口列表")

    @GetMapping("/{page}/{limit}")

    public Result list(@PathVariable Long page,

                       @PathVariable Long limit,

                       SysApiQueryVo sysApiQueryVo) {

        if (page < 0 || limit < 0) {

            return Result.fail();

        }else if (sysApiQueryVo == null){

            return Result.fail();

        }

        Page<SysApi> pageParam = new Page<>(page,limit);

        IPage<SysApi> pageModel = sysApiService.selectPage(pageParam,sysApiQueryVo);

        return Result.ok(pageModel);

    }



    @ApiOperation(value = "获取接口")

    @GetMapping("/getItem/{id}")

    public Result get(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        SysApi byId = sysApiService.getById(id);

        return Result.ok(byId);

    }







    @ApiOperation(value = "保存接口")

    @PostMapping("/save")

    @PreAuthorize("hasAuthority('bnt.sysApi.save')")

    @Log(title = "接口管理",businessType = BusinessType.INSERT)

    public Result save(@RequestBody SysApi sysApi) {

        if (sysApi == null) {

            return Result.fail();

        }

        boolean save = sysApiService.save(sysApi);

        if (save) {

            return Result.ok();

        }

            return Result.fail();



    }





    @Log(title = "接口管理",businessType = BusinessType.UPDATE)

    @PreAuthorize("hasAuthority('bnt.sysApi.update')")

    @ApiOperation(value = "更新接口")

    @PutMapping("/update")

    public Result updateById(@RequestBody SysApi sysApi) {

        if (sysApi == null) {

            return Result.fail();

        }

        boolean update = sysApiService.updateById(sysApi);

        if (!update) {

            return Result.fail();

        }

        return Result.ok();



    }





    @Log(title = "接口管理",businessType = BusinessType.DELETE)

    @PreAuthorize("hasAuthority('bnt.sysApi.remove')")

    @ApiOperation(value = "删除接口")

    @DeleteMapping("/remove/{id}")

    public Result remove(@PathVariable String id) {

        if (id == null) {

            return Result.fail();

        }

        boolean removeById = sysApiService.removeById(id);

        if (!removeById) {

            return Result.fail();

        }

        return Result.ok();

    }



    @PreAuthorize("hasAuthority('bnt.sysApi.invokePost')")

    @ApiOperation(value = "调用请求方式为post的接口")

    @PostMapping(value = "/invoke")

    @Log(title = "接口管理",businessType = BusinessType.OTHER)

    public Result invokeAdd(@RequestBody ReqSysApiQueryvo reqApiQueryvo) {

        if (reqApiQueryvo == null || reqApiQueryvo.getId() == null) {

            return Result.fail().message("接口不存在");

        }

        String id = reqApiQueryvo.getId();

        SysApi byId = sysApiService.getById(id);

        if (byId == null) {

            return Result.fail().message("接口不存在");

        }

        SysApi sysApi = sysApiService.selectApiById(id);

        Object requestParameter = reqApiQueryvo.getRequestParameter();

        if(requestParameter==null){

            return Result.fail().message("请求参数为null或者为空");

        }

        String apiName = sysApi.getApiName();

        List<String> requestValue = reqApiQueryvo.getRequestValue();

        String value = requestValue.get(0);

        JSONObject resp = new JSONObject();

        resp.put("message", value+ "    "+apiName + "成功");

        resp.put("success", true);

        return Result.ok(resp);

    }



    @PreAuthorize("hasAuthority('bnt.sysApi.invokePut')")

    @ApiOperation(value = "调用请求方式为put的接口")

    @PutMapping(value = "/invoke")

    @Log(title = "接口管理",businessType = BusinessType.OTHER)

    public Result invokeUpdate(@RequestBody ReqSysApiQueryvo reqApiQueryvo) {

        if (reqApiQueryvo == null || reqApiQueryvo.getId() == null) {

            return Result.fail().message("不存在");

        }

        String id = reqApiQueryvo.getId();

        SysApi byId = sysApiService.getById(id);

        if (byId == null) {

            return Result.fail().message("接口不存在");

        }



        Object requestParameter = reqApiQueryvo.getRequestParameter();

        if(requestParameter==null){

            return Result.fail().message("请求参数为null或者为空");

        }



        List<String> requestKey = reqApiQueryvo.getRequestKey();

        List<String> requestValue = reqApiQueryvo.getRequestValue();

        JSONObject resp = new JSONObject();

        if (requestKey.size() == requestValue.size()) {

            JSONObject messagesObject = new JSONObject();

            for (int i = 0; i < requestKey.size(); i++) {

                String key = requestKey.get(i);

                String value = requestValue.get(i);



                messagesObject.put("UPDATED_" + i, key + ":" + "修改成" + value);

            }

            resp.put("messages", messagesObject);

        }

        Object pathParameter = reqApiQueryvo.getPathParameter();



        resp.put("success", true);

        resp.put("PathParameter", pathParameter);



        return Result.ok(resp);

    }





    @ApiOperation(value = "调用请求方式为delete的接口")

    @DeleteMapping(value = "/invoke")

    @Log(title = "接口管理",businessType = BusinessType.OTHER)

    public Result invokeDelete(@RequestBody ReqSysApiQueryvo reqApiQueryvo) {

        if (reqApiQueryvo == null || reqApiQueryvo.getId() == null) {

            return Result.fail().message("查询id不存在");

        }

        String id = reqApiQueryvo.getId();

        SysApi byId = sysApiService.getById(id);

        if (byId == null) {

            return Result.fail().message("接口不存在");

        }



        SysApi sysApi = sysApiService.selectApiById(id);

        String apiName = sysApi.getApiName();



        JSONObject resp = new JSONObject();



        String path = sysApi.getPath();

        Object pathParameter = reqApiQueryvo.getPathParameter();

        Object requestParameter = reqApiQueryvo.getRequestParameter();



        String parameterName = sysApi.getParameterName();





        List<Object> requestParameterList = new ArrayList<>();

        if (requestParameter != null) {

            requestParameterList.add(requestParameter);

        }



        List<Object> pathParameterList = new ArrayList<>();

        if (pathParameter != null) {

            pathParameterList.add(pathParameter);

        }



        if (!pathParameterList.isEmpty() && requestParameterList.isEmpty()) {

            resp.put("DELETE", pathParameter);



        } else {

            if (!requestParameterList.isEmpty()) {

                resp.put("WHERE", parameterName);

                }

            if(path.contains("{") && path.contains("}")) {

                resp.put("PATH", pathParameter);

            }

        }

        resp.put("message", apiName + " 成功");

        resp.put("success", true);

        return Result.ok(resp);

    }



    @ApiOperation(value = "调用请求方式为get的接口")

    @GetMapping(value = "/invoke")

    @Log(title = "接口管理",businessType = BusinessType.OTHER)

    public Result invokeGet( ReqSysApiQueryvo reqApiQueryvo) {

        if (reqApiQueryvo == null || reqApiQueryvo.getId() == null) {

            return Result.fail().message("id不存在");

        }

        String id = reqApiQueryvo.getId();

        SysApi byId = sysApiService.getById(id);

        if (byId == null) {

            return Result.fail().message("接口不存在");

        }



        SysApi sysApi = sysApiService.selectApiById(id);

        String apiName = sysApi.getApiName();



        SysMock sysMock = sysMockService.selectMockDataByApiName(apiName);

        Object mockData = sysMock.getMockData();

        JSONObject mockDataObject = JSON.parseObject(mockData.toString());


        JSONObject resp = new JSONObject();

        resp.put("data", mockDataObject);


        resp.put("success", true);



        return Result.ok(resp);

    }







}

