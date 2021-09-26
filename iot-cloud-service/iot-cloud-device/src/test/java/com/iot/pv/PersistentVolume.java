package com.iot.pv;

import com.iot.AbstractTest;
import com.iot.device.dto.PersistentVolumeDto;
import com.iot.device.service.PersistentVolumeService;
import com.iot.device.util.JacksonUtil;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class PersistentVolume extends AbstractTest {

    @Autowired
    private PersistentVolumeService persistentVolumeService;

    @Test
    public void createPV() {
        PersistentVolumeDto persistentVolumeDto = new PersistentVolumeDto();
        persistentVolumeDto.setPvName("test-pv");
        persistentVolumeDto.setNamespace("default");
        persistentVolumeDto.setAccessMode("ReadWriteOnce");
        persistentVolumeDto.setReclaimPolicy("Retain");
        persistentVolumeDto.setScName("local-storage");
        persistentVolumeDto.setPath("/export");
        persistentVolumeDto.setNodeName("k8s-worker");
        try {
            System.out.println(JacksonUtil.toJson(persistentVolumeService.createPersistentVolume(persistentVolumeDto)));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
