CREATE DATABASE IF NOT EXISTS iot_cloud_sys DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin;

use iot_cloud_sys;
set names UTF8;

CREATE TABLE IF NOT EXISTS `an_mq_message_data` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `message_key` varchar(200) DEFAULT NULL COMMENT '消息key',
  `message_topic` varchar(50) DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) DEFAULT '' COMMENT 'tag',
  `message_body` longtext COMMENT '消息内容',
  `message_type` int(11) DEFAULT '10' COMMENT '消息类型: 10 - 生产者 ; 20 - 消费者',
  `delay_level` int(11) DEFAULT '0' COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) DEFAULT '0' COMMENT '顺序类型 0有序 1无序',
  `status` int(11) DEFAULT '10' COMMENT '消息状态',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `yn` int(11) DEFAULT '0' COMMENT '是否删除 -0 未删除 -1 已删除',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `an_tpc_mq_confirm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `message_id` bigint(20) DEFAULT NULL COMMENT '任务ID',
  `message_key` varchar(200) CHARACTER SET utf8 DEFAULT '' COMMENT '消息唯一标识',
  `consumer_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '消费者组编码',
  `consume_count` int(11) DEFAULT '0' COMMENT '消费的数次',
  `status` int(255) DEFAULT '10' COMMENT '状态, 10 - 未确认 ; 20 - 已确认; 30 已消费',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_message_key` (`message_key`) USING BTREE,
  KEY `idx_update_time` (`update_time`) USING BTREE,
  KEY `idx_task_id` (`message_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订阅者状态确认表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_consumer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `application_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '微服务名称',
  `consumer_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '消费者编码',
  `consumer_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '消费者名称',
  `status` int(255) DEFAULT '10' COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消费者表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `message_key` varchar(200) CHARACTER SET utf8 DEFAULT '' COMMENT '消息key',
  `message_topic` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT 'topic',
  `message_tag` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT 'tag',
  `message_body` longtext CHARACTER SET utf8 COMMENT '消息内容',
  `message_type` int(11) DEFAULT '10' COMMENT '消息类型: 10 - 有序消息 ; 20 - 无序消息',
  `producer_group` varchar(20) CHARACTER SET utf8 DEFAULT '' COMMENT '生产者PID',
  `delay_level` int(11) DEFAULT '0' COMMENT '延时级别 1s 5s 10s 30s 1m 2m 3m 4m 5m 6m 7m 8m 9m 10m 20m 30m 1h 2h',
  `order_type` int(11) DEFAULT '0' COMMENT '顺序类型 0有序 1无序',
  `message_status` int(11) DEFAULT '10' COMMENT '消息状态',
  `task_status` int(11) DEFAULT '0' COMMENT '状态',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `resend_times` int(11) DEFAULT '0' COMMENT '重发次数',
  `dead` int(11) DEFAULT '0' COMMENT '是否死亡 0 - 活着; 1-死亡',
  `next_exe_time` int(11) DEFAULT NULL COMMENT '执行时间',
  `yn` int(11) DEFAULT '0' COMMENT '是否删除 -0 未删除 -1 已删除',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_message_key` (`message_key`) USING BTREE,
  KEY `idx_created_time` (`create_time`) USING BTREE,
  KEY `idx_update_time` (`update_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='可靠消息表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_producer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `application_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '微服务名称',
  `producer_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '城市编码',
  `producer_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '区域编码',
  `query_message_url` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '提供查询对账的地址',
  `status` int(255) DEFAULT '10' COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='生产者表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_publish` (
  `producer_id` bigint(20) NOT NULL COMMENT '生产者ID',
  `topic_id` bigint(20) NOT NULL COMMENT 'TOPIC_ID',
  PRIMARY KEY (`producer_id`,`topic_id`) USING BTREE,
  KEY `FKfe9od4909llybiub42s3ifvcl` (`topic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='发布关系表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_subscribe` (
  `id` bigint(20) NOT NULL COMMENT 'ID',
  `consumer_id` bigint(20) NOT NULL COMMENT '消费者ID',
  `consumer_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '消费者组',
  `topic_id` bigint(20) NOT NULL COMMENT 'TOPIC_ID',
  `topic_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '主题编码',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FKfe9od4909llybiub42s3ifvcl` (`topic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='订阅关系表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_subscribe_tag` (
  `subscribe_id` bigint(20) NOT NULL COMMENT '消费者ID',
  `tag_id` bigint(20) NOT NULL COMMENT 'TAG_ID',
  PRIMARY KEY (`subscribe_id`,`tag_id`) USING BTREE,
  KEY `FKfe9od4909llybiub42s3ifvcl` (`tag_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='消费者和TAG中间表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `topic_id` bigint(20) DEFAULT NULL COMMENT '主题ID',
  `tag_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '城市编码',
  `tag_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '区域编码',
  `status` int(255) DEFAULT '10' COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='MQ主题的标签表';

CREATE TABLE IF NOT EXISTS `an_tpc_mq_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT '0' COMMENT '版本号',
  `producer_id` bigint(20) DEFAULT NULL COMMENT '生产者ID',
  `topic_code` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '城市编码',
  `topic_name` varchar(50) CHARACTER SET utf8 DEFAULT '' COMMENT '区域编码',
  `mq_type` int(11) NOT NULL DEFAULT '10' COMMENT 'MQ类型, 10 rocketmq 20 kafka',
  `msg_type` int(11) NOT NULL DEFAULT '10' COMMENT '消息类型, 10 无序消息, 20 无序消息',
  `status` int(255) DEFAULT '10' COMMENT '状态, 10生效,20,失效',
  `remark` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注',
  `create_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_by` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='MQ主题表';

CREATE TABLE IF NOT EXISTS `an_websocket_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `version` int(11) DEFAULT NULL COMMENT '版本号',
  `create_by` varchar(20) DEFAULT NULL COMMENT '创建人',
  `creator_id` bigint(20) DEFAULT NULL COMMENT '创建人ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(20) DEFAULT NULL COMMENT '最近操作人',
  `last_operator_id` bigint(20) DEFAULT NULL COMMENT '最后操作人ID',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `company_id` bigint(20) DEFAULT NULL COMMENT '公司Id',
  `company_name` varchar(100) DEFAULT NULL COMMENT '公司名称',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `msg_type` varchar(255) DEFAULT NULL COMMENT '消息类型',
  `msg` varchar(255) DEFAULT NULL COMMENT '消息体',
  `status` int(1) DEFAULT NULL COMMENT '消息状态：0未消费，1已消费',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `databasechangelog` (
     `ID` varchar(255) NOT NULL,
     `AUTHOR` varchar(255) NOT NULL,
     `FILENAME` varchar(255) NOT NULL,
     `DATEEXECUTED` datetime NOT NULL,
     `ORDEREXECUTED` int(11) NOT NULL,
     `EXECTYPE` varchar(10) NOT NULL,
     `MD5SUM` varchar(35) DEFAULT NULL,
     `DESCRIPTION` varchar(255) DEFAULT NULL,
     `COMMENTS` varchar(255) DEFAULT NULL,
     `TAG` varchar(255) DEFAULT NULL,
     `LIQUIBASE` varchar(20) DEFAULT NULL,
     `CONTEXTS` varchar(255) DEFAULT NULL,
     `LABELS` varchar(255) DEFAULT NULL,
     `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `databasechangeloglock` (
     `ID` int(11) NOT NULL,
     `LOCKED` bit(1) NOT NULL,
     `LOCKGRANTED` datetime DEFAULT NULL,
     `LOCKEDBY` varchar(255) DEFAULT NULL,
     PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE IF NOT EXISTS `districts` (
     `id` int(6) unsigned NOT NULL COMMENT '编号',
     `pid` int(6) NOT NULL DEFAULT '0' COMMENT '上级编号',
     `deep` tinyint(1) NOT NULL DEFAULT '0' COMMENT '层级',
     `name` varchar(32) NOT NULL DEFAULT '' COMMENT '名称',
     `pinyin` varchar(64) DEFAULT NULL COMMENT '拼音',
     `pinyin_shor` varchar(64) DEFAULT '' COMMENT '拼音缩写',
     `ext_name` varchar(64) DEFAULT '' COMMENT '扩展名',
     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
     `update_time` datetime DEFAULT NULL COMMENT '更新时间',
     `operator` varchar(32) DEFAULT '' COMMENT '操作人',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='地区';

CREATE TABLE IF NOT EXISTS `gen_table` (
     `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
     `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
     `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
     `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
     `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
     `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
     `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
     `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
     `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
     `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
     `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
     `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
     `create_time` datetime DEFAULT NULL COMMENT '创建时间',
     `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
     `update_time` datetime DEFAULT NULL COMMENT '更新时间',
     `remark` varchar(500) DEFAULT NULL COMMENT '备注',
     PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

CREATE TABLE IF NOT EXISTS `gen_table_column` (
    `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
    `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
    `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
    `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
    `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
    `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
    `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
    `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
    `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
    `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
    `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
    `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
    `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
    `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
    `query_type` varchar(200) DEFAULT '=' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
    `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
    `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
    `sort` int(11) DEFAULT NULL COMMENT '排序',
    `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
    `create_time` datetime DEFAULT NULL COMMENT '创建时间',
    `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
    `update_time` datetime DEFAULT NULL COMMENT '更新时间',
    PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

CREATE TABLE IF NOT EXISTS `JOB_EXECUTION_LOG` (
     `id` varchar(40) NOT NULL,
     `job_name` varchar(100) NOT NULL,
     `task_id` varchar(255) NOT NULL,
     `hostname` varchar(255) NOT NULL,
     `ip` varchar(50) NOT NULL,
     `sharding_item` int(11) NOT NULL,
     `execution_source` varchar(20) NOT NULL,
     `failure_cause` varchar(4000) DEFAULT NULL,
     `is_success` int(11) NOT NULL,
     `start_time` timestamp NULL DEFAULT NULL,
     `complete_time` timestamp NULL DEFAULT NULL,
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `JOB_STATUS_TRACE_LOG` (
    `id` varchar(40) NOT NULL,
    `job_name` varchar(100) NOT NULL,
    `original_task_id` varchar(255) NOT NULL,
    `task_id` varchar(255) NOT NULL,
    `slave_id` varchar(50) NOT NULL,
    `source` varchar(50) NOT NULL,
    `execution_type` varchar(20) NOT NULL,
    `sharding_item` varchar(100) NOT NULL,
    `state` varchar(20) NOT NULL,
    `message` varchar(4000) DEFAULT NULL,
    `creation_time` timestamp NULL DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `TASK_ID_STATE_INDEX` (`task_id`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `mail_send_log` (
     `msgId` varchar(255) DEFAULT NULL,
     `empId` int(11) DEFAULT NULL,
     `status` int(11) DEFAULT '0' COMMENT '0发送中，1发送成功，2发送失败',
     `routeKey` varchar(255) DEFAULT NULL,
     `exchange` varchar(255) DEFAULT NULL,
     `count` int(11) DEFAULT '0' COMMENT '重试次数',
     `tryTime` datetime DEFAULT NULL COMMENT '第一次重试时间',
     `createTime` datetime DEFAULT NULL,
     `updateTime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
