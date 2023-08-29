/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 2:52
 */


package com.hwj.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hwj.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@ApiModel(description = "项目")
@TableName("sys_item")
public class SysItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "项目名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "项目描述")
    @TableField("description")
    private String description;

}
