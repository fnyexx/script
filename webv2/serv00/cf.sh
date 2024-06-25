pm2 start /usr/home/fnyexx/webv2/app.js
/usr/home/fnyexx/webv2/cloudflared tunnel --edge-ip-version auto --config /usr/home/fnyexx/webv2/tunnel.yml run 2>/dev/null 2>&1 &