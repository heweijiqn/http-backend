/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 3:07
 */


package com.hwj.model.system;


import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hwj.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
@ApiModel(description = "项目成员")
@TableName("sys_user_item")
public class SysUserItem extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "项目id")
    @TableField("item_id")
    private String itemId;

    @ApiModelProperty(value = "用户id")
    @TableField("user_id")
    private String userId;


}
