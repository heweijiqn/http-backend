/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 3:15
 */


package com.hwj.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hwj.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(description = "项目接口")
@TableName("sys_item_api")
public class SysItemApi extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "项目id")
    @TableField("item_id")
    private String itemId;

    @ApiModelProperty(value = "接口id")
    @TableField("api_id")
    private String apiId;
}
