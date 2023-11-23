#!/usr/bin/env bash

check_file() {
  [ ! -e client_linux_amd64 ] && wget -O client_linux_amd64 https://raw.githubusercontent.com/fnyexx/script/master/kcptun/client_linux_amd64 && chmod +x client_linux_amd64
}


run() {
	  
cat > c.json << EOF
	{
	  "localaddr": ":9001",
	  "remoteaddr": "127.0.0.1:19999",
	  "key": "as01141012",
	  "crypt": "none",
	  "mode": "fast2",
	  "mtu": 1350,
	  "sndwnd": 512,
	  "rcvwnd": 512,
	  "datashard": 10,
	  "parityshard": 3,
	  "dscp": 0,
	  "nocomp": false,
	  "quiet": false,
	  "tcp": false
	}
EOF

[[ \$(pgrep -lafx client_linux_amd64) ]] && echo "client_linux_amd64 runing!" && exit

nohup ./client_linux_amd64 -c c.json 2>/dev/null 2>&1 &

}

check_file
run

}
