#!/bin/bash

sudo -i -u ubuntu bash <<EOF
  # Install NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

  # Load NVM into shell
  export NVM_DIR="/home/ubuntu/.nvm"
  source "\$NVM_DIR/nvm.sh"

  # Install Node.js
  nvm install 22
  nvm use 22
  nvm alias default 22

  # Install dependencies and build project
  cd /home/ubuntu/
  git clone https://github.com/danielzairin/no-db-build.git
  cd no-db-build/
  npm install
  npm run build

  export CLOUDFLARE_API_TOKEN=${CLOUDFLARE_API_TOKEN}

  # Start the app in the background
  nohup npm start -- -H 0.0.0.0 -p 8080 > /home/ubuntu/app.log 2>&1 &
EOF
