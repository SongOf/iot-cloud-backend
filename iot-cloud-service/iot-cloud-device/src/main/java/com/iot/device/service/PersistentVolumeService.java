package com.iot.device.service;

import com.iot.device.dto.PersistentVolumeDto;
import io.fabric8.kubernetes.api.model.PersistentVolume;

public interface PersistentVolumeService {
    public PersistentVolume createPersistentVolume(PersistentVolumeDto persistentVolumeDto);
}
