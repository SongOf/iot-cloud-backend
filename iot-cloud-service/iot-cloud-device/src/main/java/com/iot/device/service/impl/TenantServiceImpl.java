package com.iot.device.service.impl;

import com.iot.device.dto.TenantDto;
import com.iot.device.service.NodeService;
import com.iot.device.service.TenantService;
import com.iot.device.util.JacksonUtil;
import io.fabric8.kubernetes.api.model.NodeList;
import io.fabric8.kubernetes.client.CustomResource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class TenantServiceImpl implements TenantService {

    @Autowired
    private NodeService nodeService;

    @Override
    public CustomResource createTenant(TenantDto tenantDto) {
        //选举节点
        NodeList nodes = nodeService.getAllNodes();

        nodes.getItems().forEach(node -> {
            System.out.println(node.getMetadata().getName());
        });
        try {
            System.out.println(JacksonUtil.toJson(nodes));
        } catch (IOException e) {
            e.printStackTrace();
        }
        //bind PV
        //启动纠删组
        return null;
    }
}
