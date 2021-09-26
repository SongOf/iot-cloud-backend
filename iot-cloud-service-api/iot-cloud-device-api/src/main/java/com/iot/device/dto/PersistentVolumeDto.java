package com.iot.device.dto;

import lombok.Data;
import java.io.Serializable;

@Data
public class PersistentVolumeDto implements Serializable {

    private static final long serialVersionUID = -7808474824535827305L;

    private String pvName;
    private String namespace;
    private Long capacity;
    private String accessMode;
    private String reclaimPolicy;
    private String scName;
    private String path;
    private String nodeName;
}
