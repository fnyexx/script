#!/usr/bin/env bash

UUID="f3c9cb27-746f-4e41-acf2-820bd3002676"
WSPATH="/yizhidahayu"
ARGO_AUTH='{"AccountTag":"cd62f4c3c19b613ae9c48857d94efadf","TunnelSecret":"4D5ia68gAQj75bCHBvdKtaMIwsrwamFa9tVj7ZyDz94=","TunnelID":"0ff804f8-001c-46b5-b9d2-e7eed66c0c86"}'
ARGO_DOMAIN="t1.oske.cn"
SSH_DOMAIN=""
FTP_DOMAIN=""
V_DOMAIN=""
WEB_USERNAME="admin"
WEB_PASSWORD="admin"
PROJECT_DOMAIN="oske-vvoo2"

WSPATH=${WSPATH:-'glitch'}
UUID=${UUID:-'f3c9cb27-746f-4e41-acf2-820bd3002676'}
WEB_USERNAME=${WEB_USERNAME:-'admin'}
WEB_PASSWORD=${WEB_PASSWORD:-'admin'}

generate_config() {
  cat > config.json << EOF
{
    "log":{
        "access":"/dev/null",
        "error":"/dev/null",
        "loglevel":"none"
    },
    "inbounds":[
        {
            "port":8080,
            "protocol":"vless",
            "settings":{
                "clients":[
                    {
                        "id":"${UUID}",
                        "flow":"xtls-rprx-vision"
                    }
                ],
                "decryption":"none",
                "fallbacks":[
                    {
                        "dest":3001
                    },
                    {
                        "path":"/${WSPATH}-vless",
                        "dest":3002
                    },
                    {
                        "path":"/${WSPATH}-vmess",
                        "dest":3003
                    },
                    {
                        "path":"/${WSPATH}-trojan",
                        "dest":3004
                    },
                    {
                        "path":"/${WSPATH}-shadowsocks",
                        "dest":3005
                    }
                ]
            },
            "streamSettings":{
                "network":"tcp"
            }
        },
        {
            "port":3001,
            "listen":"127.0.0.1",
            "protocol":"vless",
            "settings":{
                "clients":[
                    {
                        "id":"${UUID}"
                    }
                ],
                "decryption":"none"
            },
            "streamSettings":{
                "network":"ws",
                "security":"none"
            }
        },
        {
            "port":3002,
            "listen":"127.0.0.1",
            "protocol":"vless",
            "settings":{
                "clients":[
                    {
                        "id":"${UUID}",
                        "level":0
                    }
                ],
                "decryption":"none"
            },
            "streamSettings":{
                "network":"ws",
                "security":"none",
                "wsSettings":{
                    "path":"/${WSPATH}-vless"
                }
            },
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls",
                    "quic"
                ],
                "metadataOnly":false
            }
        },
        {
            "port":3003,
            "listen":"127.0.0.1",
            "protocol":"vmess",
            "settings":{
                "clients":[
                    {
                        "id":"${UUID}",
                        "alterId":0
                    }
                ]
            },
            "streamSettings":{
                "network":"ws",
                "wsSettings":{
                    "path":"/${WSPATH}-vmess"
                }
            },
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls",
                    "quic"
                ],
                "metadataOnly":false
            }
        },
        {
            "port":3004,
            "listen":"127.0.0.1",
            "protocol":"trojan",
            "settings":{
                "clients":[
                    {
                        "password":"${UUID}"
                    }
                ]
            },
            "streamSettings":{
                "network":"ws",
                "security":"none",
                "wsSettings":{
                    "path":"/${WSPATH}-trojan"
                }
            },
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls",
                    "quic"
                ],
                "metadataOnly":false
            }
        },
        {
            "port":3005,
            "listen":"127.0.0.1",
            "protocol":"shadowsocks",
            "settings":{
                "clients":[
                    {
                        "method":"chacha20-ietf-poly1305",
                        "password":"${UUID}"
                    }
                ],
                "decryption":"none"
            },
            "streamSettings":{
                "network":"ws",
                "wsSettings":{
                    "path":"/${WSPATH}-shadowsocks"
                }
            },
            "sniffing":{
                "enabled":true,
                "destOverride":[
                    "http",
                    "tls",
                    "quic"
                ],
                "metadataOnly":false
            }
        }
    ],
    "dns":{
        "servers":[
            "https+local://8.8.8.8/dns-query"
        ]
    },
    "outbounds":[
        {
            "protocol":"freedom"
        },
        {
            "tag":"WARP",
            "protocol":"wireguard",
            "settings":{
                "secretKey":"YFYOAdbw1bKTHlNNi+aEjBM3BO7unuFC5rOkMRAz9XY=",
                "address":[
                    "172.16.0.2/32",
                    "2606:4700:110:8a36:df92:102a:9602:fa18/128"
                ],
                "peers":[
                    {
                        "publicKey":"bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=",
                        "allowedIPs":[
                            "0.0.0.0/0",
                            "::/0"
                        ],
                        "endpoint":"162.159.193.10:2408"
                    }
                ],
                "reserved":[78, 135, 76],
                "mtu":1280
            }
        }
    ],
    "routing":{
        "domainStrategy":"AsIs",
        "rules":[
            {
                "type":"field",
                "domain":[
                    "domain:openai.com",
                    "domain:ai.com"
                ],
                "outboundTag":"WARP"
            }
        ]
    }
}
EOF
}

generate_argo() {
  cat > argo.sh << ABC
#!/usr/bin/env bash

ARGO_AUTH=${ARGO_AUTH}
ARGO_DOMAIN=${ARGO_DOMAIN}
SSH_DOMAIN=${SSH_DOMAIN}

# 下载并运行 Argo
check_file() {
  [ ! -e cloudflared ] && wget -O cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && chmod +x cloudflared
}

run() {
  if [[ -n "\${ARGO_AUTH}" && -n "\${ARGO_DOMAIN}" ]]; then
    if [[ "\$ARGO_AUTH" =~ TunnelSecret ]]; then
      echo "\$ARGO_AUTH" | sed 's@{@{"@g;s@[,:]@"\0"@g;s@}@"}@g' > tunnel.json
      cat > tunnel.yml << EOF
tunnel: \$(sed "s@.*TunnelID:\(.*\)}@\1@g" <<< "\$ARGO_AUTH")
credentials-file: /opt/webv2/tunnel.json
protocol: http2

ingress:
  - hostname: \$ARGO_DOMAIN
    service: http://localhost:8080
EOF
      [ -n "\${SSH_DOMAIN}" ] && cat >> tunnel.yml << EOF
  - hostname: \$SSH_DOMAIN
    service: http://localhost:2222
EOF
    [ -n "\${FTP_DOMAIN}" ] && cat >> tunnel.yml << EOF
  - hostname: \$FTP_DOMAIN
    service: http://localhost:3333
EOF
    [ -n "\${V_DOMAIN}" ] && cat >> tunnel.yml << EOF
  - hostname: \$V_DOMAIN
    service: http://localhost:3001

EOF
      cat >> tunnel.yml << EOF
    originRequest:
      noTLSVerify: true
  - service: http_status:404
EOF
      nohup ./cloudflared tunnel --edge-ip-version auto --config tunnel.yml run 2>/dev/null 2>&1 &
    elif [[ "\$ARGO_AUTH" =~ ^[A-Z0-9a-z=]{120,250}$ ]]; then
      nohup ./cloudflared tunnel --edge-ip-version auto --protocol http2 run --token ${ARGO_AUTH} 2>/dev/null 2>&1 &
    fi
  else
    nohup ./cloudflared tunnel --edge-ip-version auto --protocol http2 --no-autoupdate --url http://localhost:8080 2>/dev/null 2>&1 &
    sleep 5
    local LOCALHOST=\$(ss -nltp | grep '"cloudflared"' | awk '{print \$4}')
    ARGO_DOMAIN=\$(wget -qO- http://\$LOCALHOST/quicktunnel | cut -d\" -f4)
  fi
}


check_file
run

ABC
}

generate_nezha() {
  cat > nezha.sh << EOF
#!/usr/bin/env bash

NEZHA_SERVER=${NEZHA_SERVER}
NEZHA_PORT=${NEZHA_PORT}
NEZHA_KEY=${NEZHA_KEY}
TLS=${NEZHA_TLS:+'--tls'}

check_run() {
  [[ \$(pgrep -lafx nezha-agent) ]] && echo "lz客户端正在运行中" && exit
}

check_variable() {
  [[ -z "\${NEZHA_SERVER}" || -z "\${NEZHA_PORT}" || -z "\${NEZHA_KEY}" ]] && exit
}

download_agent() {
  if [ ! -e nezha-agent ]; then
    URL=\$(wget -qO- -4 "https://api.github.com/repos/naiba/nezha/releases/latest" | grep -o "https.*linux_amd64.zip")
    URL=\${URL:-https://github.com/naiba/nezha/releases/download/v0.14.11/nezha-agent_linux_amd64.zip}
    wget \${URL}
    unzip -qod ./ nezha-agent_linux_amd64.zip && rm -f nezha-agent_linux_amd64.zip
  fi
}

run() {
  [ -e nezha-agent ] && nohup ./nezha-agent -s \${NEZHA_SERVER}:\${NEZHA_PORT} -p \${NEZHA_KEY} \${TLS} >/dev/null 2>&1 &
}

check_run
check_variable
download_agent
run
EOF
}

generate_ttyd() {
  cat > ttyd.sh << EOF
#!/usr/bin/env bash

check_run() {
  [[ \$(pgrep -lafx ttyd) ]] && echo "ttyd 正在运行中" && exit
}

check_variable() {
  [ -z "\${SSH_DOMAIN}" ] && exit
}

download_ttyd() {
  if [ ! -e ttyd ]; then
    URL=\$(wget -qO- "https://api.github.com/repos/tsl0922/ttyd/releases/latest" | grep -o "https.*x86_64")
    URL=\${URL:-https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64}
    wget -O ttyd \${URL}
    chmod +x ttyd
  fi
}

run() {
  [ -e nezha-agent ] && nohup ./ttyd -c \${WEB_USERNAME}:\${WEB_PASSWORD} -p 2222 bash >/dev/null 2>&1 &
}

check_run
check_variable
download_ttyd
run
EOF
}

generate_filebrowser () {
  cat > filebrowser.sh << EOF
#!/usr/bin/env bash


check_run() {
  [[ \$(pgrep -lafx filebrowser) ]] && echo "filebrowser 正在运行中" && exit
}

check_variable() {
  [ -z "\${FTP_DOMAIN}" ] && exit
}


download_filebrowser() {
  if [ ! -e filebrowser ]; then
    URL=\$(wget -qO- "https://api.github.com/repos/filebrowser/filebrowser/releases/latest" | grep -o "https.*linux-amd64.*gz")
    URL=\${URL:-https://github.com/filebrowser/filebrowser/releases/download/v2.23.0/linux-amd64-filebrowser.tar.gz}
    wget -O filebrowser.tar.gz \${URL}
    tar xzvf filebrowser.tar.gz filebrowser
    rm -f filebrowser.tar.gz
    chmod +x filebrowser
  fi
}


run() {
  PASSWORD_HASH=\$(./filebrowser hash \$WEB_PASSWORD)
  [ -e filebrowser ] && nohup ./filebrowser --port 3333 --username \${WEB_USERNAME} --password "\${PASSWORD_HASH}" >/dev/null 2>&1 &
}

check_run
check_variable
download_filebrowser
run
EOF
}

generate_config
generate_argo
generate_nezha
generate_ttyd
generate_filebrowser

[ -e nezha.sh ] && bash nezha.sh
[ -e argo.sh ] && bash argo.sh
[ -e ttyd.sh ] && bash ttyd.sh
[ -e filebrowser.sh ] && bash filebrowser.sh