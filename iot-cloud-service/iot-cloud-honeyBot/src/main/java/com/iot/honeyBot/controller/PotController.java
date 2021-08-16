package com.iot.honeyBot.controller;


import com.iot.common.core.domain.R;
import com.iot.honeyBot.model.dto.CollectPotDto;
import com.iot.honeyBot.model.vo.Honeypot;
import com.iot.honeyBot.service.PotService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("honeypot")
@Api(value = "iot-cloud-honeypot",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
public class PotController {
    @Autowired
    private PotService potService;

    @GetMapping("listNodes")
    @ApiOperation("获取全部节点")
    public R getAllNodes() {
        return R.data(potService.GetAllEdgeNode());
    }

    @GetMapping("getPotByNodes/{node}")
    @ApiOperation("获取节点上的全部蜜罐")
    public R getPotByNodes(@PathVariable String node) {
        return R.data(potService.GetAllPotByNode(node));
    }

    @PostMapping("createPot")
    @ApiOperation("新建蜜罐")
    public R createPot(@RequestBody Honeypot honeypot) {
        potService.CreatePot(honeypot);
        return R.ok();
    }

    @PostMapping("updatePot")
    @ApiOperation("更新蜜罐")
    public R updatePot(@RequestBody Honeypot honeypot) {
        potService.UpdatePot(honeypot);
        return R.ok();
    }

    @PostMapping("collectNode/{node}")
    @ApiOperation("采集节点上的蜜罐数据")
    public R collectNode(@PathVariable String node) {
        potService.StartCollectNode(node);
        return R.ok();
    }

    @PostMapping("collectPot")
    @ApiOperation("采集节点上指定蜜罐的数据")
    public R collectPot(@RequestBody CollectPotDto collectPotDto) {
        potService.StartCollectPot(collectPotDto);
        return R.ok();
    }
}
