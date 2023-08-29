/**
 * @author 何伟健
 * @version 1.0
 * @date 2023/8/6 3:11
 */


package com.hwj.model.system;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.hwj.model.base.BaseEntity;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@ApiModel(description = "接口")
@TableName("sys_api")
public class SysApi extends BaseEntity {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "接口名称")
    @TableField("api_name")
    private String apiName;

    @ApiModelProperty(value = "访问地址")
    @TableField("path")
    private String path;

    @ApiModelProperty(value = "请求 http 方法")
    @TableField("http_method")
    private String httpMethod;

    @ApiModelProperty(value = "参数名称")
    @TableField("parameter_name")
    private String parameterName;

    @ApiModelProperty(value = "参数类型")
    @TableField("parameter_type")
    private String parameterType;

    @ApiModelProperty(value = "返回数据的结构")
    @TableField("response_data_structure")
    private String responseDataStructure;

    @ApiModelProperty(value = "请求参数")
    @TableField("request_parameters")
    private Object requestParameters;
}
