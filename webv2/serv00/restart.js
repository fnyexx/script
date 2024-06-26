
var exec = require("child_process").exec;

function keep_web_alive() {

  exec("pgrep -laf app.js", function (err, stdout, stderr) {

    if (stdout.includes("node /usr/home/fnyexx/webv2/app.js")) {
      //console.log("app runing!");
    } else {

      exec(
        "pm2 start /usr/home/fnyexx/webv2/app.js",
        function (err, stdout, stderr) {
          if (err) {
            console.log("error:" + err);
          } else {
            console.log("success!");
          }
        }
      );
    }
  });
  
  exec("pgrep -f cloudflared", function (err, stdout, stderr) {
    if (stdout) {
      //console.log("cf runing!");
    } else {

      exec("/usr/home/fnyexx/webv2/cloudflared tunnel --edge-ip-version auto --config /usr/home/fnyexx/webv2/tunnel.yml run", function (err, stdout, stderr) {
        if (err) {
          console.log("cf-error:" + err);
        } else {
          console.log("cf-success!");
        }
      });
    }
  });
  
}
setInterval(keep_web_alive, 20 * 1000);

