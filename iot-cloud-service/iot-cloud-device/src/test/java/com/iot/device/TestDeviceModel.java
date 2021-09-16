package com.iot.device;

import com.alibaba.fastjson.JSONArray;
import com.iot.common.json.JSON;
import com.iot.common.json.JSONObject;
import com.iot.device.dto.DeviceModelPropertyDto;
import com.iot.device.dto.EdgeDeviceModelDto;
import com.iot.device.service.DeviceModelService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.List;

public class TestDeviceModel extends AbstractTest {
    @Autowired
    private DeviceModelService deviceModelService;

    @Test
    public void testCreateDeviceModel() {
        EdgeDeviceModelDto deviceModelDto = new EdgeDeviceModelDto();
        deviceModelDto.setName("temperature - sensor");
        deviceModelDto.setDescription("temperature - sensor - model");
        List<DeviceModelPropertyDto> deviceModelPropertyDtoList = new ArrayList<>();
        DeviceModelPropertyDto deviceModelPropertyDto = new DeviceModelPropertyDto();
        deviceModelPropertyDto.setName("temperature");
        deviceModelPropertyDto.setDescription("temperature - model");
        deviceModelPropertyDto.setType("int");
        deviceModelPropertyDto.setValue("20");
        deviceModelPropertyDto.setAccessMode("ReadOnly");
        deviceModelPropertyDtoList.add(deviceModelPropertyDto);

        DeviceModelPropertyDto deviceModelPropertyDto1 = new DeviceModelPropertyDto();
        deviceModelPropertyDto1.setName("temperature - enable");
        deviceModelPropertyDto1.setDescription("temperature - enable - model");
        deviceModelPropertyDto1.setType("string");
        deviceModelPropertyDto1.setValue("ON");
        deviceModelPropertyDto1.setAccessMode("ReadWrite");
        deviceModelPropertyDtoList.add(deviceModelPropertyDto1);
        deviceModelService.createDeviceModel(deviceModelDto);
    }

    @Test
    public void testGetAllDeviceModel() {
        System.out.println(JSONArray.toJSON(deviceModelService.getAllDeviceModel()).toString());
    }
}
