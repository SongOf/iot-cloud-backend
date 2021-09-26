package com.iot.device;

import com.alibaba.fastjson.JSONArray;
import com.iot.AbstractTest;
import com.iot.device.dto.EdgeDeviceDto;
import com.iot.device.dto.EdgeDeviceTwinDto;
import com.iot.device.service.DeviceService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TestDevice extends AbstractTest {
    @Autowired
    private DeviceService deviceService;

    @Test
    public void testCreateDevice() {
        EdgeDeviceDto devicedto = new EdgeDeviceDto();
        devicedto.setDeviceName("B1 - 815 - temperature - sensor - 01");
        devicedto.setDescription("temperature - sensor - device");
        devicedto.setDeviceModelRefName("temperature - sensor");
        devicedto.setModel("model");
        devicedto.setNodeName("kube-edge01");

        List<EdgeDeviceTwinDto> edgeDeviceTwinDtoList = new ArrayList<>();
        EdgeDeviceTwinDto edgeDeviceTwinDto = new EdgeDeviceTwinDto();
        edgeDeviceTwinDto.setPropertyName("temperature");
        edgeDeviceTwinDto.setRequireType("int");
        edgeDeviceTwinDto.setRequireValue("29");
        edgeDeviceTwinDto.setReportedType("int");
        edgeDeviceTwinDto.setReportedValue("28");
        edgeDeviceTwinDto.setReportedTime(new Date().toString());
        edgeDeviceTwinDtoList.add(edgeDeviceTwinDto);
        edgeDeviceTwinDto.setPropertyName("temperature - enable");
        edgeDeviceTwinDto.setRequireType("string");
        edgeDeviceTwinDto.setRequireValue("ON");
        edgeDeviceTwinDto.setReportedType("string");
        edgeDeviceTwinDto.setReportedValue("OFF");
        edgeDeviceTwinDto.setReportedTime(new Date().toString());
        edgeDeviceTwinDtoList.add(edgeDeviceTwinDto);
        devicedto.setDeviceTwinDtoList(edgeDeviceTwinDtoList);
        deviceService.createDevice(devicedto);
    }

    @Test
    public void testGetAllDevice() {
        System.out.println(JSONArray.toJSON(deviceService.getAllDevice()).toString());
    }
}
