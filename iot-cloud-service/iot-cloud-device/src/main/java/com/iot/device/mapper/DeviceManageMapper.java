package com.iot.device.mapper;

import com.iot.device.model.domain.DeviceManage;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DeviceManageMapper {

    int saveDevice(DeviceManage deviceManage);

    List<DeviceManage> selectAll();

    DeviceManage selectByName(String deviceName);
}
