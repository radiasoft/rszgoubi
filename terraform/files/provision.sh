#!/bin/bash

set -eu -o pipefail

do_reboot() {
    sudo shutdown -r +1
}

main() {
    run_as_root
    run_as_user
    do_reboot
}

run_as_root() {
sudo -s -- <<EOF
    dnf upgrade -y
    dnf install -y htop tmux vim-enhanced docker git
    systemctl enable docker.service
    systemctl start docker.service 
    docker pull radiasoft/rszgoubi:latest
EOF
}

run_as_user() {
    git clone https://github.com/radiasoft/rszgoubi.git "$HOME/rszgoubi"
    (
    cd "HOME/rszgoubi"
    git remote add radiasoft git@github.com:radiasoft/rszgoubi.git
    )
}

main "$@"
