/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 3:21
 */


package com.hwj.model.vo;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.List;

@Data
@ApiModel(description = "分配接口")
public class AssginApiVo {

    @ApiModelProperty(value = "项目id")
    private String itemId;

    @ApiModelProperty(value = "接口id列表")
    private List<String> apiIdList;
}
