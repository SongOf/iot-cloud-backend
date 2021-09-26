package com.iot.device.mapper;

import com.iot.common.core.dao.BaseMapper;
import com.iot.device.model.domain.Device;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeviceMapper extends BaseMapper<Device> {
}
