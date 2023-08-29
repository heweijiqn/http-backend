/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/17 22:34
 */


package com.hwj.system.utils;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.yaml.snakeyaml.Yaml;
import org.yaml.snakeyaml.error.MarkedYAMLException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;


public class IsUtlis {
    public static boolean isJSON(String jsonString) {
        try {
            ObjectMapper objectMapper = new ObjectMapper();
            objectMapper.readTree(jsonString);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isXML(String xmlString) {
        try {
            DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
            DocumentBuilder builder = factory.newDocumentBuilder();
            Document document = builder.parse(new InputSource(new java.io.StringReader(xmlString)));
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public static boolean isYaml(String data) {
        try {
            Yaml yaml = new Yaml();
            yaml.load(data);
            return true;
        } catch (Exception e) {
            return e instanceof MarkedYAMLException;
        }
    }







}
