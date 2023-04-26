### 自动脚本
### gclone安装
```
bash <(curl -sL raw.githubusercontent.com/lulexyz/somescript/main/gclone.sh)
``` 

### gclone多盘自动挂载
```
bash <(curl -sL raw.githubusercontent.com/lulexyz/somescript/main/gclone-mount.sh)
```
**手动操作**
```
重启挂载服务：systemctl restart gclone-{云盘名称}
停止挂载服务：systemctl stop gclone-{云盘名称}  
删除挂载服务：systemctl disable gclone-{云盘名称} 
```


### 配置swap
建议低内存机子安装
```
wget https://raw.githubusercontent.com/lulexyz/somescript/main/swap.sh && bash swap.sh
```
