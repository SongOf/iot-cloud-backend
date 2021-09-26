package com.iot.device.service.impl;

import com.iot.common.exception.BusinessException;
import com.iot.device.constant.ExceptionMsg;
import com.iot.device.dto.StorageClassDto;
import com.iot.device.service.StorageClassService;
import io.fabric8.kubernetes.api.model.storage.StorageClass;
import io.fabric8.kubernetes.api.model.storage.StorageClassBuilder;
import io.fabric8.kubernetes.client.KubernetesClient;
import io.fabric8.kubernetes.client.KubernetesClientException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StorageClassServiceImpl implements StorageClassService {
    private static final Logger logger = LoggerFactory.getLogger(PersistentVolumeServiceImpl.class);

    @Autowired
    private KubernetesClient k8sClient;

    @Override
    public StorageClass createStorageClass(StorageClassDto storageClassDto) {
        StorageClass storageClass = null;
        try {
            storageClass = k8sClient.storage().storageClasses().create(
                    new StorageClassBuilder()
                            .withNewMetadata().withName(storageClassDto.getScName()).endMetadata()
                            .withProvisioner(storageClassDto.getProvisioner())
                            .build()
            );
        } catch (KubernetesClientException e) {
            logger.error("Could not create resource: {}", e.getMessage(), e);
            throw new BusinessException(ExceptionMsg.RESOURCECREATEFAIL);
        }
        return storageClass;
    }
}
