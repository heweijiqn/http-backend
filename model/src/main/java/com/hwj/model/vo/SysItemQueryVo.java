/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 19:15
 */


package com.hwj.model.vo;


import lombok.Data;

import java.io.Serializable;

@Data
public class SysItemQueryVo implements Serializable {

    private static final long serialVersionUID = 1L;


    private String name;

    private String description;

    private String createTime;

    private String updateTime;

}
