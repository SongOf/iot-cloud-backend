package com.iot.node;

import com.iot.AbstractTest;
import com.iot.device.service.NodeService;
import com.iot.device.util.JacksonUtil;
import io.fabric8.kubernetes.api.model.NodeList;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;

public class node extends AbstractTest {
    @Autowired
    private NodeService nodeService;

    @Test
    public void getAllNodes() {
        try {
            System.out.println(JacksonUtil.toJson(nodeService.getAllNodes()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getNodeByName() {
        try {
            System.out.println(JacksonUtil.toJson(nodeService.getNodeByName("raspberrypi-edge-01")));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
