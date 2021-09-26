package com.iot.device.dto;

import lombok.Data;
import java.io.Serializable;

@Data
public class NamespaceDto implements Serializable {
    private static final long serialVersionUID = -4848973051712033957L;

    private String name;
}
