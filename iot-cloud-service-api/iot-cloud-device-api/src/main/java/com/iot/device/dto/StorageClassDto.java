package com.iot.device.dto;

import lombok.Data;

import java.io.Serializable;

@Data
public class StorageClassDto implements Serializable {
    private String scName;
    private String namespace;

    private String provisioner;
}
