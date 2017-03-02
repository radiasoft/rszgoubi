build_image_base=fedora:latest
src_dir=/src
zgoubi_dir=/src/zgoubi

build_zgoubi() {
    svn co https://svn.code.sf.net/p/zgoubi/code/trunk "$zgoubi_dir"
    cd "$zgoubi_dir"
    make -f Makefile_zgoubi_gfortran 
}

build_as_run_user() {
    (build_zgoubi)
}

build_as_root() {
    mkdir "$src_dir"
    chown -R vagrant: "$src_dir"
}
