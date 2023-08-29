/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/19 7:06
 */


package com.hwj.model.vo;

import lombok.Data;

import java.io.Serializable;


@Data
public class FormatVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String data;
    private String updateFormat;
}
