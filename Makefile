.PHONY: fm

clean:
	rm -rf build
	rm -rf faust.*

fm: clean
	./scripts/build.sh fm

