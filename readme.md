# fibonacci-benchmark

## brew, cask, pip

    brew install ocaml crystal-lang luajit node elixir dmd pypy ponyc chapel # nimrod
    brew cask install go julia #rust
    pip install nuitka

## manual install

* nim (http://nim-lang.org/download.html)
* rust (https://www.rust-lang.org/downloads.html)

## felix

https://groups.google.com/forum/#!topic/felix-language/jQJOy_ovPFc

    brew install ocaml python3
    git clone https://github.com/felix-lang/felix.git
    cd felix
    git co 2b4c4a7
    export PATH=build/release/host/bin:$PATH
    export LD_LIBRARY_PATH=build/release/host/lib/rtl:$LD_LIBRARY_PATH
    export DYLD_LIBRARY_PATH=build/release/host/lib/rtl:$DYLD_LIBRARY_PATH
    make build && make install
