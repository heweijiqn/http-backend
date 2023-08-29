/**

 * @author 何伟健

 * @version 1.0

 * @date 2023/8/26 0:21

 */





package com.hwj.model.vo;




import lombok.Data;

import java.io.Serializable;


@Data
public class SysMockQueryVo implements Serializable {

    private static final long serialVersionUID = 1L;

    private String name;

    private Object mockData;

}

