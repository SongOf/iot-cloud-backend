package com.iot.device.service;

import com.iot.device.dto.StorageClassDto;
import io.fabric8.kubernetes.api.model.storage.StorageClass;

public interface StorageClassService {
    public StorageClass createStorageClass(StorageClassDto storageClassDto);
}
