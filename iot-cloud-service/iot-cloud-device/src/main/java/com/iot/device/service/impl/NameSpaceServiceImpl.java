package com.iot.device.service.impl;

import com.iot.common.exception.BusinessException;
import com.iot.device.constant.ExceptionMsg;
import com.iot.device.dto.NamespaceDto;
import com.iot.device.service.NamespaceService;
import io.fabric8.kubernetes.api.model.Namespace;
import io.fabric8.kubernetes.api.model.NamespaceBuilder;
import io.fabric8.kubernetes.api.model.NamespaceList;
import io.fabric8.kubernetes.client.KubernetesClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NameSpaceServiceImpl implements NamespaceService {
    @Autowired
    private KubernetesClient k8sClient;

    @Override
    public Namespace createNameSpace(NamespaceDto namespaceDto) {
        Namespace ns = null;
        try {
            ns = k8sClient.namespaces().create(new NamespaceBuilder()
                    .withNewMetadata()
                    .withName(namespaceDto.getName())
                    .addToLabels("app", "edge-storage")
                    .endMetadata()
                    .build());
        }catch (Exception e) {
            throw new BusinessException(ExceptionMsg.RESOURCECREATEFAIL, e);
        }
        return ns;
    }

    @Override
    public Namespace deleteNameSpace(NamespaceDto namespaceDto) {
        Namespace ns = k8sClient.namespaces().withName(namespaceDto.getName()).get();
        if(ns == null) {
            throw new BusinessException(ExceptionMsg.RESOURCENOTFOUND);
        }
        try {
            k8sClient.namespaces().withName(namespaceDto.getName()).delete();
        }catch (Exception e) {
            throw new BusinessException(ExceptionMsg.RESOURCEDELETEERROR, e);
        }
        return ns;
    }

    @Override
    public Namespace getNamespaceByName(NamespaceDto namespaceDto) {
        Namespace ns = k8sClient.namespaces().withName(namespaceDto.getName()).get();
        if(ns == null) {
            throw new BusinessException(ExceptionMsg.RESOURCENOTFOUND);
        }
        return ns;
    }

    @Override
    public NamespaceList getAllNamespace() {
        return k8sClient.namespaces().list();
    }
}
