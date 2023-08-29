/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/24 23:33
 */


package com.hwj.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hwj.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@ApiModel(description = "SysMock")
@TableName("sys_mock")
public class SysMock extends BaseEntity {
    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "名称")
    @TableField("name")
    private String name;

    @ApiModelProperty(value = "模拟数据")
    @TableField("mock_data")
    private Object mockData;

}
