package com.iot.sc;

import com.iot.AbstractTest;
import com.iot.device.dto.StorageClassDto;
import com.iot.device.service.StorageClassService;
import com.iot.device.util.JacksonUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.IOException;

public class StorageClass extends AbstractTest {

    @Autowired
    private StorageClassService storageClassService;

    @Test
    public void createSC() {
        StorageClassDto storageClassDto = new StorageClassDto();
        storageClassDto.setScName("test-sc");
        storageClassDto.setNamespace("default");
        storageClassDto.setProvisioner("k8s.io/minikube-hostpath");
        try {
            System.out.println(JacksonUtil.toJson(storageClassService.createStorageClass(storageClassDto)));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
