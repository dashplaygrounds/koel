# Spacebook docker compose deployment


## Part A
Instruction: Add the local subdomains for testing

```
sudo tee -a /etc/hosts > /dev/null <<EOT
127.0.0.1 koel.dashmark.me
EOT

cat /etc/hosts
ping -c 5 koel.dashmark.me
```

## Part B
Instruction: Install mkcert for linux
```
// MKCERT
sudo systemctl stop nginx

sudo apt install nginx libnss3-tools -y

cd; wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64

sudo mv mkcert-v1.4.4-linux-amd64 /usr/local/bin/mkcert

sudo chmod +x /usr/local/bin/mkcert

mkcert -uninstall

rm -rf ~/.local/share/mkcert
ls -l ~/.local/share/
mkdir -p ~/.local/share/mkcert/dashmark
echo "export CAROOT=/home/kubeadmin/.local/share/mkcert/dashmark" >> ~/.bashrc; cat ~/.bashrc
source ~/.bashrc

mkcert -install
# You can find the root CA path by running the command below
echo $(mkcert -CAROOT)

ls -l ~/.local/share/mkcert
ls -l ~/.local/share/mkcert/dashmark

cd ~/.local/share/mkcert/dashmark
# Reference: https://serverfault.com/questions/104160/wildcard-ssl-certificate-for-second-level-subdomain
mkcert "*.dashmark.me" localhost 127.0.0.1 ::1

ls -l ~/.local/share/mkcert/dashmark

sudo systemctl restart nginx; sudo systemctl status nginx

```

## Part C
Instruction: Register the local subdomains to nginx to be able to expose to port 80
```
# Reference: 
1. https://psujit775.medium.com/create-ssl-certificate-for-localhost-fe55c413682c
2. https://stackoverflow.com/questions/38346847/nginx-docker-container-502-bad-gateway-response

sudo apt install -y nginx
sudo systemctl enable --now nginx
sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
# sudo rm /etc/nginx/nginx.conf
ls -l ~/.local/share/mkcert/dashmark
sudo nano /etc/nginx/nginx.conf # copy code block below lines 75-97
sudo nginx -t
sudo nginx -s reload
sudo systemctl restart nginx; sudo systemctl status nginx
```

## Unified
```
events { worker_connections 1024; }

http {
    upstream app-koel {
        server localhost:8080;
    }

    server {
        listen 80; 
        listen [::]:80; 
        listen 443 ssl; 
        listen [::]:443 ssl; 
        server_name koel.dashmark.me;
        ssl_certificate /home/kubeadmin/.local/share/mkcert/dashmark/_wildcard.dashmark.me+3.pem;
        ssl_certificate_key /home/kubeadmin/.local/share/mkcert/dashmark/_wildcard.dashmark.me+3-key.pem;
    
        location / {
          proxy_pass    http://app-koel;
        }

    }

}
```

## Part D

Instruction: Run local koel app and db
```
// Follow README.md
```

# Test the local websites

## PROD-like Local Test Websites

`curl https://koel.dashmark.me`  

## Part E

Instruction: Visit the local websites. Ctrl-Click and paste into incognito tab using Ctrl + Shift + N


### PROD-like Local Website

`https://koel.dashmark.me`  