/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/17 2:55
 */


package com.hwj.system.utils;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.dom4j.*;

import java.util.Iterator;
import java.util.List;
import java.util.Map;



public class JSONtoXMLConverterUtils {

    /**
     * json转xml
     * 	自动添加一个根元素 <info></info>
     *
     * @param jo JSONObject对象
     * @param root 转换的xml根元素 默认info   传入 null  or String 字符串
     *
     * @return xml Str字符串
     */
    public  String jsonObjToXml(JSONObject jo, String root){
        JSONObject jo0 = new JSONObject();
        jo0.put(root==null ? "info" : root, jo);
        String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n"+ jsontoxml(jo0, "");
        return xml;
    }

    /**
     * json对象转xml
     *
     * @param jo JSONObject
     * @param gt "\n" 位移符
     *
     * @return XML Str字符串
     *
     */
    @SuppressWarnings("rawtypes")
    public String jsontoxml(JSONObject jo, String gt) {
        StringBuffer xmlStr = new StringBuffer();
        try {
            Iterator iter = jo.entrySet().iterator();
            while (iter.hasNext()) {
                Map.Entry entry = (Map.Entry) iter.next();
                String key = entry.getKey().toString();
                String val = entry.getValue().toString();
                if (val.substring(0, 1).equals("{")) {
                    xmlStr.append(gt);
                    xmlStr.append("<");
                    xmlStr.append(key);
                    xmlStr.append(">\n");
                    xmlStr.append(jsontoxml(JSONObject.parseObject(val), gt + "\t"));
                    xmlStr.append(gt);
                    xmlStr.append("</");
                    xmlStr.append(key);
                    xmlStr.append(">\n");
                } else if (val.substring(0, 1).equals("[")) {
                    xmlStr.append(gt);
                    xmlStr.append("<");
                    xmlStr.append(key);
                    xmlStr.append(">\n");
                    JSONArray ja = JSONArray.parseArray(val);
                    for (int i = 0; i < ja.size(); i++) {
                        JSONObject jo2 = new JSONObject();
                        jo2.put("object", ja.getJSONObject(i));
                        xmlStr.append(jsontoxml(jo2, gt + "\t"));
                    }
                    xmlStr.append(gt);
                    xmlStr.append("</");
                    xmlStr.append(key);
                    xmlStr.append(">\n");
                } else {
                    xmlStr.append(gt);
                    xmlStr.append("<");
                    xmlStr.append(key);
                    xmlStr.append(">");
                    xmlStr.append(val);
                    xmlStr.append("</");
                    xmlStr.append(key);
                    xmlStr.append(">\n");
                }
            }
        } catch (Exception e) {
            return "<error>1</error>";
        }

        return xmlStr.toString();
    }
    /**
     * xml字符串转json字符串
     *   xml的根元素是不会遍历出来，而是直接作为对象的
     *	 如<info><ab>ss</ab></info> = {"ab":"ss"}  如果带上根元素即为{"info":{"ab":"ss"}}}
     *
     * @param xmlStr xml字符串
     * @param root 根元素  默认为info 传入 null  or String 字符串
     *
     * @return
     *
     *
     */
    public  String xmlStrToJsonStr(String xmlStr,String root) {
        String st = "";
        try {
            Document doc = DocumentHelper.parseText(xmlStr);
            JSONObject json = new JSONObject();
            dom4jJson(doc.getRootElement(), json);
            JSONObject jo = new JSONObject();
            jo.put(root==null ? "info" : root, json);
            st = jo.toJSONString();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        return st;
    }

    /**
     * xml文档对象转json对象
     *
     * @param element
     *
     * @param json
     *
     */
    public  void dom4jJson(Element element, JSONObject json) {
        // 如果是属性
        for (Object o : element.attributes()) {
            Attribute attr = (Attribute) o;
            if (!isEmpty(attr.getValue())) {
                json.put("@" + attr.getName(), attr.getValue());
            }
        }
        @SuppressWarnings("unchecked")
        List<Element> chdEl = element.elements();
        if (chdEl.isEmpty() && !isEmpty(element.getText())) {// 如果没有子元素,只有一个值
            json.put(element.getName(), element.getText());
        }
        for (Element e : chdEl) {// 有子元素
            if (!e.elements().isEmpty()) {// 子元素也有子元素
                JSONObject chdjson = new JSONObject();
                dom4jJson(e, chdjson);
                Object o = json.get(e.getName());
                if (o != null) {
                    JSONArray jsona = null;
                    if (o instanceof JSONObject) {// 如果此元素已存在,则转为jsonArray
                        JSONObject jsono = (JSONObject) o;
                        json.remove(e.getName());
                        jsona = new JSONArray();
                        jsona.add(jsono);
                        jsona.add(chdjson);
                    }
                    if (o instanceof JSONArray) {
                        jsona = (JSONArray) o;
                        jsona.add(chdjson);
                    }
                    json.put(e.getName(), jsona);
                } else {
                    if (!chdjson.isEmpty()) {
                        json.put(e.getName(), chdjson);
                    }
                }
            } else {// 子元素没有子元素
                for (Object o : element.attributes()) {
                    Attribute attr = (Attribute) o;
                    if (!isEmpty(attr.getValue())) {
                        json.put("@" + attr.getName(), attr.getValue());
                    }
                }
                if (!e.getText().isEmpty()) {
                    json.put(e.getName(), e.getText());
                }
            }
        }
    }

    public static boolean isEmpty(String str) {
        if (str == null || str.trim().isEmpty() || "null".equals(str)) {
            return true;
        }
        return false;
    }




}
