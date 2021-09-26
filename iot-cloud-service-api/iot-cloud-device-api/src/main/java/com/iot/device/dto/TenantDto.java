package com.iot.device.dto;

import lombok.Data;
import java.io.Serializable;

@Data
public class TenantDto implements Serializable {

    private static final long serialVersionUID = -7925351839307892052L;

    private String tenantName;
    private String namespace;

    private final String accessKey = "songof";
    private final String secretkey = "123456";

    private String image;
    private Integer dataBlocks;
    private Integer parityBlocks;
    private Long blockSize;
}
