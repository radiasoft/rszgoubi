build_image_base=fedora:latest
zgoubi_dir="$HOME/src/zgoubi"

build_zgoubi() {
    git clone -b rszgoubi --depth 1 https://github.com/radiasoft/zgoubi "$zgoubi_dir"
    cd "$zgoubi_dir"
    make FFLAGS="-O4 -Wall -fno-automatic -pedantic -cpp -gdwarf-2" zgoubi
    ln -s "$zgoubi_dir/zgoubi/zgoubi" "$HOME/bin"
}

build_as_run_user() {
    (build_zgoubi)
}
