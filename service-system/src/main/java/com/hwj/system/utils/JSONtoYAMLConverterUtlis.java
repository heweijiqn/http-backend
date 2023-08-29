/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/18 1:12
 */


package com.hwj.system.utils;

import com.alibaba.fastjson.JSONObject;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.error.MarkedYAMLException;

import java.io.Serializable;
import java.util.Map;


public class JSONtoYAMLConverterUtlis implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * json转yaml
     * @param data
     * @return
     */
    public String jsonToYaml(String data){
        Yaml yaml = new Yaml();
        Map<String,Object> map =  yaml.load(data);
        String yamlStr = yaml.dumpAsMap(map);
        return yamlStr;
    }

    /**
     * yaml转json
     * @param yamlData
     * @return
     */
    public  String yamlToJson(String yamlData) {
        try {
            Yaml yaml = new Yaml();
            Object yamlObject = yaml.load(yamlData);
            JSONObject jsonObject = new JSONObject((Map<String, Object>) yamlObject);
            return jsonObject.toString();
        } catch (Exception e) {
            boolean isYaml = e instanceof MarkedYAMLException;
            if (isYaml) {
                return yamlData;
            } else {
                return "转化失败";
            }
        }
    }






}
