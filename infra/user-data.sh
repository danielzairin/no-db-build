#!/bin/bash

# cat > index.xhtml <<EOF
# <h1>${server_text}</h1>
# EOF

# nohup busybox httpd -f -p ${server_port} &
sudo -i -u ubuntu bash <<EOF
  # Install NVM
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

  \. "$HOME/.nvm/nvm.sh"

  nvm install 22

  cd /home/ubuntu/
  git clone https://github.com/danielzairin/no-db-build.git
  cd no-db-build/
  npm install
  npm run build

  npm start -- -H 0.0.0.0 -p 3000
EOF
