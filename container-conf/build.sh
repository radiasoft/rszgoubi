build_image_base=fedora:latest
zgoubi_dir="$HOME/src/zgoubi"
bin_dir="$HOME/bin"

build_zgoubi() {
    git clone -b rszgoubi --depth 1 https://github.com/radiasoft/zgoubi "$zgoubi_dir"
    cd "$zgoubi_dir"
    make FFLAGS="-O4 -Wall -fno-automatic -pedantic -cpp -gdwarf-2" zgoubi
    ln -s "$zgoubi_dir/zgoubi/zgoubi" "$bin_dir"
}

build_as_run_user() {
    (build_zgoubi)
    (install_runners)
}

install_runners() {
    cd bin
    chmod +x *.sh
    cp -v *.sh "$bin_dir"
}
