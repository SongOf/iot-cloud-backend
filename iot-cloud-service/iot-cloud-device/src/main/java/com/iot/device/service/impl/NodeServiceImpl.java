package com.iot.device.service.impl;

import com.iot.common.exception.BusinessException;
import com.iot.device.constant.ExceptionMsg;
import com.iot.device.service.NodeService;
import io.fabric8.kubernetes.api.model.Node;
import io.fabric8.kubernetes.api.model.NodeList;
import io.fabric8.kubernetes.client.KubernetesClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NodeServiceImpl implements NodeService {
    @Autowired
    private KubernetesClient k8sClient;

    @Override
    public Node getNodeByName(String nodeName) {
        Node node = k8sClient.nodes().withName(nodeName).get();
        if(node == null) {
            throw new BusinessException(ExceptionMsg.RESOURCENOTFOUND);
        }
        return node;
    }

    @Override
    public NodeList getAllNodes() {
        return k8sClient.nodes().list();
    }
}
