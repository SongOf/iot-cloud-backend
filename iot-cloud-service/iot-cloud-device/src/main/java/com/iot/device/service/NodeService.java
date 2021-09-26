package com.iot.device.service;

import io.fabric8.kubernetes.api.model.Node;
import io.fabric8.kubernetes.api.model.NodeList;

public interface NodeService {

    public Node getNodeByName(String nodeName);

    public NodeList getAllNodes();
}
