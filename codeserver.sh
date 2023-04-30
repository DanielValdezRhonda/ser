#!/bin/bash
sleep 10
mydir=$(pwd)
curl -fsSL https://code-server.dev/install.sh | sh -s -- --dry-run >/dev/null 2>&1
curl -fsSL https://code-server.dev/install.sh | sh >/dev/null 2>&1
timeout 2s code-server
cd $mydir/.config/code-server
cat > config.yaml <<END
bind-addr: 0.0.0.0:8080
auth: password
password: kunemuse
cert: false
END
npm install -g localtunnel
code-server --bind-addr 127.0.0.1:8040  & lt --port 8040
