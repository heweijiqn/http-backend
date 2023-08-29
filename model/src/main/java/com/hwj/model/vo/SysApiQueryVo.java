/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 19:20
 */


package com.hwj.model.vo;

import lombok.Data;

import java.io.Serializable;



@Data
public class SysApiQueryVo implements Serializable {

    private static final long serialVersionUID = 1L;


    private String id;

    private String apiName;

    private String path;

    private String httpMethod;

    private String parameterName;

    private String parameterType;

    private String responseDataStructure;

    private Object requestParameters;

    private String createTime;

    private String updateTime;
}
