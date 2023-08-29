/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/17 19:27
 */


package com.hwj.system.controller;


import com.alibaba.fastjson.JSONObject;
import com.hwj.common.result.Result;
import com.hwj.model.vo.FormatVo;
import com.hwj.system.annotation.Log;
import com.hwj.system.enums.BusinessType;
import com.hwj.system.utils.IsUtlis;
import com.hwj.system.utils.JSONtoXMLConverterUtils;
import com.hwj.system.utils.JSONtoYAMLConverterUtlis;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Api(tags = "格式转化接口")
@RestController
@RequestMapping("/admin/system/format")
public class FormatController {


    @PreAuthorize("hasAuthority('bnt.sysApi.format')")
    @ApiOperation(value = "格式转化")
    @GetMapping("/toFormat")
    @Log(title = "格式转化", businessType = BusinessType.OTHER)
    public Result jsonToXml(FormatVo formatVo) {
        if (formatVo == null) {
            return Result.fail().message("传入参数为空");
        }

        final JSONtoXMLConverterUtils jsoNtoXMLConverterUtils = new JSONtoXMLConverterUtils();
        final JSONtoYAMLConverterUtlis jsoNtoYAMLConverterUtlis = new JSONtoYAMLConverterUtlis();
        final String data = formatVo.getData();

        final String updateFormat = formatVo.getUpdateFormat();
        if (IsUtlis.isJSON(data)) {
            if (updateFormat.equals("xml")) {
                final String jsonObjToXml = jsoNtoXMLConverterUtils.jsonObjToXml(JSONObject.parseObject(data), null);
                return Result.ok(jsonObjToXml);
            }else if(updateFormat.equals("yaml")){
                final String jsonToYaml = jsoNtoYAMLConverterUtlis.jsonToYaml(data);
                return Result.ok(jsonToYaml);
            }else if(updateFormat.equals("json")){
                return Result.ok(data);
            }
        }
        else if (IsUtlis.isXML(data)) {
            if (updateFormat.equals("json")) {
                final String xmlStrToJsonStr = jsoNtoXMLConverterUtils.xmlStrToJsonStr(data, "RESULT");
                return Result.ok(xmlStrToJsonStr);
            }else if(updateFormat.equals("yaml")){
                final String result = jsoNtoXMLConverterUtils.xmlStrToJsonStr(data, "RESULT");
                final String jsonToYaml = jsoNtoYAMLConverterUtlis.jsonToYaml(result);
                return Result.ok(jsonToYaml);
            }else if(updateFormat.equals("xml")){
                return Result.ok(data);
            }
        }
        else if (IsUtlis.isYaml(data)) {
            if (updateFormat.equals("json")) {
                final String yamlToJson = jsoNtoYAMLConverterUtlis.yamlToJson(data);
                return Result.ok(yamlToJson);
            }else if(updateFormat.equals("xml")){
                final String result = jsoNtoYAMLConverterUtlis.yamlToJson(data);
                final String jsonObjToXml = jsoNtoXMLConverterUtils.jsonObjToXml(JSONObject.parseObject(result), null);
                return Result.ok(jsonObjToXml);
            }else if(updateFormat.equals("yaml")){
                return Result.ok(data);
            }
        }
       return Result.fail().message("格式转化失败");
    }
}

