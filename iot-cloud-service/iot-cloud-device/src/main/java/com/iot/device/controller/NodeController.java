package com.iot.device.controller;

import com.iot.common.core.controller.BaseController;
import com.iot.common.core.domain.R;
import com.iot.device.service.NodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("node")
@Api(value = "iot-cloud-node",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class NodeController extends BaseController {
    @Autowired
    private NodeService nodeService;

    @GetMapping("getNodeByName/{nodeName}")
    @ApiOperation("查询node")
    public R getNodeByName(@PathVariable("nodeName") String nodeName) {
        return R.data(nodeService.getNodeByName(nodeName));
    }

    @GetMapping("getAllNode")
    @ApiOperation("查询全部nodes")
    public R getAllNodes() {
        return R.data(nodeService.getAllNodes());
    }
}
