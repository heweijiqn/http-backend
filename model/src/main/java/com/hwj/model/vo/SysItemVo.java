package com.hwj.model.vo;

import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class SysItemVo {

    //    接口
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "接口实体类")
    private String[] sysApi;

    @ApiModelProperty(value = "项目实体类")
    private String info;




}