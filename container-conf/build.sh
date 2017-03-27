build_image_base=fedora:latest
rszgoubi_dir="$HOME/src/rszgoubi"
zgoubi_dir="$HOME/src/zgoubi"
bin_dir="$HOME/bin"

build_zgoubi() {
    git clone -b rszgoubi --depth 1 https://github.com/radiasoft/zgoubi "$zgoubi_dir"
    cd "$zgoubi_dir"
    make FFLAGS="-O4 -Wall -fno-automatic -pedantic -cpp -gdwarf-2" zgoubi
    ln -s "$zgoubi_dir/zgoubi/zgoubi" "$bin_dir"
}

build_rszgoubi() {
    git clone --depth 1 https://github.com/radiasoft/rszgoubi "$rszgoubi_dir"
    cd "$rszgoubi_dir"
    pip install --user -r requirements.txt
    python setup.py test
}

build_as_root() {
    cp ./bin/rszgoubi-run.sh /rszgoubi-run.sh
    chmod ugo+rx /rszgoubi-run.sh
    mkdir /zgoubi_results
    chown vagrant: /zgoubi_results 
}

build_as_run_user() {
    (build_zgoubi)
    (build_rszgoubi)
    (install_runners)
}

install_runners() {
    cd bin
    chmod +x *.sh
    cp -v *.sh "$bin_dir"
}
