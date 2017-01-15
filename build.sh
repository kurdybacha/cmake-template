#/bin/bash

command_exists() {
    type "$1" &> /dev/null;
}

pushd . > /dev/null

ROOT_DIR=`dirname $(readlink -m "$0")`
cd $ROOT_DIR
git submodule update --init --recursive
mkdir -p build && \
cd build && \
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 .. && \
make -j6 && \
cd ..

#  rtags reindex
if command_exists rc; then
    find . -name compile_commands.json | while IFS= read -r filename; do rc -J "$filename"; done
fi

popd > /dev/null
