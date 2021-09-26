package com.iot.device.service;

import com.iot.device.dto.EdgeDeviceModelDto;
import io.fabric8.kubernetes.client.CustomResource;

import java.util.List;

/**
 * Created by huqiaoqian on 2020/10/16
 */
public interface DeviceModelService {
    public CustomResource createDeviceModel(EdgeDeviceModelDto deviceModelDto);

    public List<EdgeDeviceModelDto> getAllDeviceModel();
}
