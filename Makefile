
execs = fib-c fib-c++ fib-chapel fib-d fib-d-ldc fib-crystal fib-go fib-felix fib-nim fib-rust fib-swift fib-ocaml fib-pony fib-nuitka

all: $(execs)

binary: $(execs)
	file $(execs)
	otool -L $(execs)
	ls -l $(execs) | awk '{print $$5, $$9}' | sort -n
#	lipo -info $(execs)

low  = `seq 42`
mid  = `seq 45`
high = `seq 45`
check_num = 35

bench: $(execs)
	for i in $(low); do 2>&1 time python ./fib.py      $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(low); do 2>&1 time ruby ./fib.rb        $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(low); do 2>&1 time perl ./fib.pl        $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(low); do 2>&1 time php  ./fib.php       $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(low); do 2>&1 time ./fib-nuitka         $$i | tail -n 1 | awk '{print $$1}'; done

	for i in $(mid); do 2>&1 time elixir ./fib.exs     $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(mid); do 2>&1 time pypy --jit function_threshold=5000 ./fib.py $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(mid); do 2>&1 time luajit -O3 ./fib.lua $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(mid); do 2>&1 time node ./fib.js        $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(mid); do 2>&1 time julia -O ./fib.jl    $$i | tail -n 1 | awk '{print $$1}'; done

	for i in $(high); do 2>&1 time ./fib-c             $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-c++           $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-chapel    --n=$$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-d             $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-d-ldc         $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-crystal       $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-go            $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-felix         $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-ocaml         $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-pony          $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-rust          $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-nim           $$i | tail -n 1 | awk '{print $$1}'; done
	for i in $(high); do 2>&1 time ./fib-swift         $$i | tail -n 1 | awk '{print $$1}'; done

check: $(execs)
	python ./fib.py      $(check_num)
	ruby ./fib.rb        $(check_num)
	perl ./fib.pl        $(check_num)
	php  ./fib.php       $(check_num)
	./fib-nuitka         $(check_num)
	elixir ./fib.exs     $(check_num)

	pypy ./fib.py        $(check_num)
	luajit ./fib.lua     $(check_num)
	node ./fib.js        $(check_num)
	julia ./fib.jl       $(check_num)

	./fib-c              $(check_num)
	./fib-c++            $(check_num)
	./fib-chapel     --n=$(check_num)
	./fib-d              $(check_num)
	./fib-d-ldc          $(check_num)
	./fib-crystal        $(check_num)
	./fib-go             $(check_num)
	./fib-felix          $(check_num)
	./fib-ocaml          $(check_num)
	./fib-pony           $(check_num)
	./fib-rust           $(check_num)
	./fib-nim            $(check_num)
	./fib-swift          $(check_num)

memory: $(execs)
	2>&1 /usr/bin/time -l python ./fib.py      $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ruby ./fib.rb        $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l perl ./fib.pl        $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l php  ./fib.php       $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-nuitka         $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l elixir ./fib.exs     $(check_num) | awk '/maximum resident set size/{ print $$1 }'

	2>&1 /usr/bin/time -l pypy ./fib.py        $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l luajit ./fib.lua     $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l node ./fib.js        $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l julia ./fib.jl       $(check_num) | awk '/maximum resident set size/{ print $$1 }'

	2>&1 /usr/bin/time -l ./fib-c              $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-c++            $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-chapel     --n=$(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-d              $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-d-ldc          $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-crystal        $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-go             $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-felix          $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-ocaml          $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-pony           $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-rust           $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-nim            $(check_num) | awk '/maximum resident set size/{ print $$1 }'
	2>&1 /usr/bin/time -l ./fib-swift          $(check_num) | awk '/maximum resident set size/{ print $$1 }'

version:
	sw_vers
	clang --version | head -n 1
	chpl --version | head -n 1
	crystal --version
	go version
	flx --version
	elixir --version
	2>&1 nim --version | head -n 1
	julia --version
	rustc --version
	swiftc --version | head -n 1
	luajit -v
	2>&1 pypy --version | tail -n 1
	python --version
	perl -v | head -n 2 | tail -n 1
	php --version | head -n 1
	ocaml -version
	nuitka --version
	node --version
	ruby --version
	ponyc --version
	dmd --version | head -n 1
	ldc2 --version | head -n 1

fib-c: fib.c
	time clang -Ofast -o fib-c $<

fib-c++: fib.cc
	time clang++ -Ofast -o fib-c++ $<

fib-chapel: fib.chpl
	time chpl -O -o fib-chapel $<

fib-d: fib.d
	time dmd -m64 -release -O -offib-d $<

fib-d-ldc: fib.d
	time ldc2 -L=-w -O5 -m64 -offib-d-ldc $<

fib-crystal: fib.rb
	time crystal build --link-flags -L/usr/local/lib --release -o fib-crystal $<

fib-go: fib.go
	time go build -o fib-go $<

fib-felix: fib.flx
	time flx --static -c -O3 -o fib-felix $<

fib-nim: fib.nim
	time nim c --verbosity:0 -d:release --app:console --opt:speed --out:fib-nim $<

fib-ocaml: fib.ml
	time ocamlopt -o fib-ocaml $<

fib-pony: fib.pony
	time ponyc -o fib-pony.tmp
	mv fib-pony.tmp/fib fib-pony

fib-rust: fib.rs
	time rustc -O -o fib-rust $<

fib-swift: fib.swift
	time swiftc -O -o fib-swift $<

fib-nuitka: fib.py
	time nuitka --clang fib.py
	mv fib.exe fib-nuitka

clean:
	rm -f $(execs) *.o *~ flxg_stats.txt
	rm -fr nimcache
	rm -fr fib.build
	rm -fr .crystal
	rm -fr fib.cm[ix]
	rm -fr fib-pony.tmp
