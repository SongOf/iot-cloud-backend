package com.iot.tenant;

import com.iot.AbstractTest;
import com.iot.device.dto.TenantDto;
import com.iot.device.service.TenantService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class TestTenant extends AbstractTest {
    @Autowired
    private TenantService tenantService;
    @Test
    public void createTenant() {
        TenantDto tenantDto = new TenantDto();
        tenantDto.setTenantName("my-tenant");
        tenantDto.setNamespace("cloud-storage-namespace");
        tenantDto.setImage("");
        tenantDto.setDataBlocks(2);
        tenantDto.setParityBlocks(2);
        tenantDto.setBlockSize(Long.valueOf(1024*1024));
        tenantService.createTenant(tenantDto);
    }
}
