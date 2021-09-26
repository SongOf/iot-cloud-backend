package com.iot.device.service;

import com.iot.device.dto.NamespaceDto;
import io.fabric8.kubernetes.api.model.Namespace;
import io.fabric8.kubernetes.api.model.NamespaceList;

public interface NamespaceService {
    public Namespace createNameSpace(NamespaceDto namespaceDto);

    public Namespace deleteNameSpace(NamespaceDto namespaceDto);

    public Namespace getNamespaceByName(NamespaceDto namespaceDto);

    public NamespaceList getAllNamespace();
}
