package com.iot.device.mapper;

import com.iot.common.core.dao.BaseMapper;
import com.iot.device.model.domain.Property;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PropertyMapper extends BaseMapper<Property> {
}
