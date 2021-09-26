package com.iot.namespace;

import com.iot.AbstractTest;
import com.iot.device.dto.NamespaceDto;
import com.iot.device.service.NamespaceService;
import com.iot.device.util.JacksonUtil;
import org.apache.poi.ss.formula.functions.Na;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import java.io.IOException;

public class TestNamespace extends AbstractTest {
    @Autowired
    private NamespaceService namespaceService;

    @Test
    public void getAllNamespace() {
        try {
            System.out.println(JacksonUtil.toJson(namespaceService.getAllNamespace()));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void createNamespace() {
        NamespaceDto namespaceDto = new NamespaceDto();
        namespaceDto.setName("test-namespace");
        try {
            System.out.println(JacksonUtil.toJson(namespaceService.createNameSpace(namespaceDto)));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void getNamespace() {
        NamespaceDto namespaceDto = new NamespaceDto();
        namespaceDto.setName("test-namespace");
        try {
            System.out.println(JacksonUtil.toJson(namespaceService.getNamespaceByName(namespaceDto)));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Test
    public void deleteNamespace() {
        NamespaceDto namespaceDto = new NamespaceDto();
        namespaceDto.setName("test-namespace");
        try {
            System.out.println(JacksonUtil.toJson(namespaceService.deleteNameSpace(namespaceDto)));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
