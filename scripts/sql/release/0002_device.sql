use iot_cloud_sys;
set names UTF8;

CREATE TABLE IF NOT EXISTS `device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `device_name` varchar(100) DEFAULT NULL COMMENT '设备名称',
  `device_crd` text COMMENT '设备影子crd',
  `edge_device_name` varchar(100) DEFAULT NULL COMMENT '边缘设备名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1057912559316776961 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `device_manage` (
  `id` bigint(20) NOT NULL,
  `version` bigint(255) DEFAULT NULL COMMENT '版本号',
  `device_name` varchar(255) DEFAULT NULL COMMENT '设备名称',
  `edge_device_name` varchar(255) DEFAULT NULL COMMENT '边缘设备名称',
  `description` varchar(255) DEFAULT NULL COMMENT '设备描述',
  `device_model_name` varchar(255) DEFAULT NULL COMMENT '设备模型',
  `state` int(5) DEFAULT NULL COMMENT '设备状态',
  `properties` varchar(255) DEFAULT NULL COMMENT '设备属性列表',
  `node_name` varchar(255) DEFAULT NULL COMMENT '设备所在节点',
  `device_id` varchar(255) NOT NULL,
  `device_twins` varchar(255) DEFAULT NULL COMMENT '设备属性列表',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `iot_cloud_device_model` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `model_name` varchar(100) DEFAULT NULL COMMENT '设备模型名称',
  `description` varchar(255) DEFAULT NULL COMMENT '设备描述',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `iot_cloud_device_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `property_name` varchar(100) DEFAULT NULL COMMENT '属性名称',
  `description` varchar(255) DEFAULT NULL COMMENT '设备描述',
  `type` varchar(100) DEFAULT NULL COMMENT '属性类型',
  `access_mode` varchar(100) DEFAULT NULL COMMENT '属性访问模式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;