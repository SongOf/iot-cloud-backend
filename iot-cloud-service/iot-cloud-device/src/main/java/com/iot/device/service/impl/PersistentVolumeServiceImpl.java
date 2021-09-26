package com.iot.device.service.impl;

import com.iot.common.exception.BusinessException;
import com.iot.device.constant.ExceptionMsg;
import com.iot.device.dto.PersistentVolumeDto;
import com.iot.device.service.PersistentVolumeService;
import io.fabric8.kubernetes.api.model.NodeSelectorRequirementBuilder;
import io.fabric8.kubernetes.api.model.PersistentVolume;
import io.fabric8.kubernetes.api.model.PersistentVolumeBuilder;
import io.fabric8.kubernetes.api.model.Quantity;
import io.fabric8.kubernetes.client.KubernetesClient;
import io.fabric8.kubernetes.client.KubernetesClientException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Collections;

@Service
public class PersistentVolumeServiceImpl implements PersistentVolumeService {
    private static final Logger logger = LoggerFactory.getLogger(PersistentVolumeServiceImpl.class);

    @Autowired
    private KubernetesClient k8sClient;

    @Override
    public PersistentVolume createPersistentVolume(PersistentVolumeDto persistentVolumeDto) {
        try {
            PersistentVolume pv = new PersistentVolumeBuilder()
                    .withNewMetadata().withName(persistentVolumeDto.getPvName()).withNamespace(persistentVolumeDto.getNamespace()).endMetadata()
                    .withNewSpec()
                    .addToCapacity(Collections.singletonMap("storage", new Quantity("1Gi")))
                    .withAccessModes(persistentVolumeDto.getAccessMode())
                    .withPersistentVolumeReclaimPolicy(persistentVolumeDto.getReclaimPolicy())
                    .withStorageClassName(persistentVolumeDto.getScName())
                    .withNewLocal()
                    .withPath(persistentVolumeDto.getPath())
                    .endLocal()
                    .withNewNodeAffinity()
                    .withNewRequired()
                    .addNewNodeSelectorTerm()
                    .withMatchExpressions(Collections.singletonList(new NodeSelectorRequirementBuilder()
                            .withKey("kubernetes.io/hostname")
                            .withOperator("In")
                            .withValues(persistentVolumeDto.getNodeName())
                            .build()
                    ))
                    .endNodeSelectorTerm()
                    .endRequired()
                    .endNodeAffinity()
                    .endSpec()
                    .build();
            return k8sClient.persistentVolumes().create(pv);
        } catch (KubernetesClientException e) {
            logger.error("Could not create resource: {}", e.getMessage(), e);
            throw new BusinessException(ExceptionMsg.RESOURCECREATEFAIL);
        }
    }
}
