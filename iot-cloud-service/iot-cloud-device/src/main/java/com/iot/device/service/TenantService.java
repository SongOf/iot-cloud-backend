package com.iot.device.service;

import com.iot.device.dto.TenantDto;
import io.fabric8.kubernetes.client.CustomResource;

public interface TenantService {
    public CustomResource createTenant(TenantDto tenantDto);
}
