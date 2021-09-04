.PHONY: fm

clean:
	rm -rf build

fm: clean
	./scripts/build.sh fm

