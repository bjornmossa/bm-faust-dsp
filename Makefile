.PHONY: fm build

clean:
	rm -rf build
	rm -rf faust.*

fm:
	./scripts/build.sh fm

build: clean
	mkdir build
	make fm
