#安装
```
wget https://github.com/prometheus/prometheus/releases/download/v2.28.1/prometheus-2.28.1.darwin-amd64.tar.gz
tar -zxvf prometheus-2.28.1.darwin-amd64.tar.gz
cd
```
#修改prometheus.yml文件
```
global:
  scrape_interval: 15s

scrape_configs:
- job_name: node #边缘节点集群名称
  static_configs:
  - targets: ['localhost:9100'] #边缘节点地址
```
#启动
```
./prometheus --config.file=./prometheus.yml
```
#验证
```
localhost:9090/graph
执行查询语句node_filesystem_avail_bytes
```