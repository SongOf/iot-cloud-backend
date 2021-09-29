#安装
```
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.0/node_exporter-1.0.0.linux-armv7.tar.gz

tar -zxvf node_exporter-1.0.0.linux-armv7.tar.gz

mv node_exporter-1.0.0.linux-armv7/node_exporter /usr/local/bin
```
#启动
```
vi /usr/lib/systemd/node_exporter.service
[Unit]
Description=node_exporter
After=network.target
[Service]
Type=simple
User=root
ExecStart=/usr/local/bin/node_exporter
Restart=on-failure
[Install]
WantedBy=multi-user.target

systemctl enable node_exporter
systemctl start node_exporter
systemctl status node_exporter
```
#查看指标
```
curl http://localhost:9100/metrics
```