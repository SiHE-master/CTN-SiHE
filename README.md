# CTN-SiHE

conn.py：认证校园网的python脚本，用于被shell脚本调用
conn.sh：主要的shell脚本，一个永远在跑的while循环，每次循环都会检测守护脚本conn_guard.sh是否存在进程，不存在就会拉起；除此之外，主要功能是通过ping外网的方式判断校园网有没有断开，如果断开就会调用conn.py去认证。如果网关ping不通还会重启网络管理。如果python路径有变化，请自行更改python的绝对路径。
conn_guard.sh：守护脚本，和conn.sh互相检测对方有没有启动，没有就会拉起对方。
start.sh：用于开机自启使用，当conn.sh没有启动时，拉起。

开机自启说明：
在~/.profile文件最后增加以下命令：
cd CTN-SiHE的绝对路径
sh start.sh
cd -
