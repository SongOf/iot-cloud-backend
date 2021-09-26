package com.iot.device.controller;

import com.iot.common.core.controller.BaseController;
import com.iot.common.core.domain.R;
import com.iot.device.dto.NamespaceDto;
import com.iot.device.service.NamespaceService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("namespace")
@Api(value = "iot-cloud-namespace",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class NamespaceController extends BaseController {

    @Autowired
    private NamespaceService namespaceService;

    @PostMapping("addNamespace")
    @ApiOperation("创建名称空间")
    public R addEdgeNamespace(@RequestBody NamespaceDto namespaceDto) {
        return R.data(namespaceService.createNameSpace(namespaceDto));
    }

    @PostMapping("deleteNamespace")
    @ApiOperation("删除名称空间")
    public R delEdgeNamespace(@RequestBody NamespaceDto namespaceDto) {
        return R.data(namespaceService.deleteNameSpace(namespaceDto));
    }

    @GetMapping("getNamespaceByName/{name}")
    @ApiOperation("查询名称空间")
    public R getEdgeNamespaceByName(@PathVariable("name") String name) {
        NamespaceDto namespaceDto = new NamespaceDto();
        namespaceDto.setName(name);
        return R.data(namespaceService.getNamespaceByName(namespaceDto));
    }

    @GetMapping("getAllNamespace")
    @ApiOperation("查询全部名称空间")
    public R getAllEdgeNamespace() {
        return R.data(namespaceService.getAllNamespace());
    }
}
