账号

Congratulations, Shadowsocks-Python server install completed!

Your Server IP        :  23.105.197.135

Your Server Port      :  12983

Your Password         :  xiaolong

2.3.3 ssh公钥生成和配置

命令行执行:
ssh-keygen -t rsa -C "邮箱地址"  //中间会要求你输入密码，不管它。一路回车，不用输入任何东西
cat ~/.ssh/id_rsa.pub
将打印出来的公钥信息复制下来，然后去gitlab.bl.com，登陆自己的账号，然后进入Profiles，点击屏幕上方SSH Keys，将复制下来的SSH公钥填入即可。