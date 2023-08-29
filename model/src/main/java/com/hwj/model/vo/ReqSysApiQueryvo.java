/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/10 19:09
 */


package com.hwj.model.vo;

import lombok.Data;

import java.io.Serializable;
import java.util.List;


@Data
public class ReqSysApiQueryvo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String id;
    private String url;
    private String method;
    private Object requestParameter;
    private List<String> requestValue;
    private List<String> requestKey;
    private Object pathParameter;


}
