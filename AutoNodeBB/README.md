# AutoInstallNodeBB
在全新的Ubuntu服务器上自动安装NodeBB  
第一次写Shell脚本 所以谨慎使用(似乎也不会造成什么严重后果)  
测试环境为Ubuntu 18.04 LTS  
其他版本自行测试(逃) 

``  
`bash NodeBB.sh`  
完成后需要手动改一下`config.json`  
`vim ~/nodebb/config.json`  
把`localhost:4567`改成你的域名  

添加一下Nginx的配置  
`vim /etc/nginx/conf.d/domain.conf`(domain改为你的域名)  

粘贴如下内容(HTTPS、重定向就自己研究吧)  

``` 
server {
    listen 80;

    server_name domain;

    location / {
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
        proxy_set_header Host $http_host;
        proxy_set_header X-NginX-Proxy true;

        proxy_pass http://127.0.0.1:4567;
        proxy_redirect off;

        # Socket.IO Support
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
    }
}
```
`:wq`  
`service nginx restart`  
