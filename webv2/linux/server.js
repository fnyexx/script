const username = "admin";
const password = "admin";
const url = `https://v.oske.cn`;
const port = 3000;
const express = require("express");
const app = express();
var exec = require("child_process").exec;
const os = require("os");
const { createProxyMiddleware } = require("http-proxy-middleware");
var request = require("request");
var fs = require("fs");
var path = require("path");
const auth = require("basic-auth");

app.get("/", function (req, res) {
  res.send("hello world");
});

app.use((req, res, next) => {
  const user = auth(req);
  if (user && user.name === username && user.pass === password) {
    return next();
  }
  res.set("WWW-Authenticate", 'Basic realm="Node"');
  return res.status(401).send();
});

app.get("/status", function (req, res) {
  let cmdStr =
    "ps -ef";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.type("html").send("<pre>e：\n" + err + "</pre>");
    } else {
      res.type("html").send("<pre>e：\n" + stdout + "</pre>");
    }
  });
});

app.get("/listen", function (req, res) {
  let cmdStr = "ss -nltp";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.type("html").send("<pre>e：\n" + err + "</pre>");
    } else {
      res.type("html").send("<pre>e：\n" + stdout + "</pre>");
    }
  });
});


app.get("/list", function (req, res) {
  let cmdStr = "cat list";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.type("html").send("<pre>e：\n" + err + "</pre>");
    } else {
      res.type("html").send("<pre>e：\n\n" + stdout + "</pre>");
    }
  });
});


app.get("/info", function (req, res) {
  let cmdStr = "cat /etc/*release | grep -E ^NAME";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.send("e：" + err);
    } else {
      res.send(
        "e：\n" +
          "Linux System:" +
          stdout +
          "\nRAM:" +
          os.totalmem() / 1000 / 1000 +
          "MB"
      );
    }
  });
});


app.get("/test", function (req, res) {
    let cmdStr = 'mount | grep " / " | grep "(ro," >/dev/null';
    exec(cmdStr, function (error, stdout, stderr) {
      if (error !== null) {
        res.send("e---非只读");
      } else {
        res.send("e---只读");
      }
    });
  });


app.get("/root", function (req, res) {
  let cmdStr = "bash root.sh >/dev/null 2>&1 &";
  exec(cmdStr, function (err, stdout, stderr) {
    if (err) {
      res.send("e：" + err);
    } else {
      res.send("e：" + "success!");
    }
  });
});


function keep_web_alive() {
  


  exec("curl -m5 " + url, function (err, stdout, stderr) {
    if (err) {
      console.log("bh：" + err);
    } else {
      console.log("hbbw:" + stdout);
    }
  });


  exec("pgrep -laf web.js", function (err, stdout, stderr) {

    if (stdout.includes("./web.js -c ./config.json")) {
      console.log("web xx");
    } else {

      exec(
        "chmod +x web.js && ./web.js -c ./config.json >/dev/null 2>&1 &",
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
}
setInterval(keep_web_alive, 60 * 1000);


function keep_argo_alive() {
  exec("pgrep -laf cloudflared", function (err, stdout, stderr) {

    if (stdout.includes("./cloudflared tunnel")) {
      console.log("run!");
    } else {

      exec("bash argo.sh 2>&1 &", function (err, stdout, stderr) {
        if (err) {
          console.log("bh-error:" + err);
        } else {
          console.log("bh-success!");
        }
      });
    }
  });
}
setInterval(keep_argo_alive, 70 * 1000);


function keep_nezha_alive() {
  exec("pgrep -laf nezha-agent", function (err, stdout, stderr) {
    if (stdout.includes("./nezha-agent")) {
      console.log("lz run");
    } else {
      exec("bash nezha.sh 2>&1 &", function (err, stdout, stderr) {
        if (err) {
          console.log("error:" + err);
        } else {
          console.log("success!");
        }
      });
    }
  });
}

app.get("/download", function (req, res) {
  download_web((err) => {
    if (err) {
      res.send("error");
    } else {
      res.send("success");
    }
  });
});

app.use(
  "/",
  createProxyMiddleware({
    changeOrigin: true,
    onProxyReq: function onProxyReq(proxyReq, req, res) {},
    pathRewrite: {
      "^/": "/",
    },
    target: "http://127.0.0.1:8080/",
    ws: true, 
  })
);


function download_web(callback) {
  let fileName = "web.js";
  let web_url =
    "https://raw.githubusercontent.com/fnyexx/v2ooo/master/web.js";
  let stream = fs.createWriteStream(path.join("./", fileName));
  request(web_url)
    .pipe(stream)
    .on("close", function (err) {
      if (err) {
        callback("error");
      } else {
        callback(null);
      }
    });
}

download_web((err) => {
  if (err) {
    console.log("init error");
  } else {
    console.log("init-success");
  }
});


exec("bash entrypoint.sh", function (err, stdout, stderr) {
  if (err) {
    console.error(err);
    return;
  }
  console.log(stdout);
});

app.listen(port, () => console.log(`on port ${port}!`));