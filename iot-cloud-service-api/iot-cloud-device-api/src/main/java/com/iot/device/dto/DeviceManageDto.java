package com.iot.device.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

@Data
@ApiModel
public class DeviceManageDto implements Serializable {

    private static final long serialVersionUID = 4955736378773008640L;

    @ApiModelProperty("版本号")
    private Long version;

    @ApiModelProperty("设备ID")
    private Long deviceId;

    @ApiModelProperty("设备名称")
    private String deviceName;

    @ApiModelProperty("边缘设备名称")
    private String edgeDeviceName;

    @ApiModelProperty("设备描述")
    private String description;

    @ApiModelProperty("设备模型")
    private String deviceModelName;

    @ApiModelProperty("设备状态")
    private String state;

    @ApiModelProperty("设备属性列表")
    private String deviceTwins;

    @ApiModelProperty("设备所在节点")
    private String nodeName;

}
