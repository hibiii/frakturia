.PHONY: deps apply clean
SHELL=/bin/bash -o pipefail

files = src/*.txt src/punct/*.txt

frakturia.psf: $(files)
	cpp src/index.txt -P | txt2psf > frakturia.psf

apply: frakturia.psf
	test "${TERM}" = "linux"
	setfont frakturia.psf
	@cat cp437.txt
	@echo the quick brown fox jumps over the lazy dog

deps:
	@which cpp > /dev/null
	@which txt2psf > /dev/null
	@echo all ok!

clean:
	rm frakturia.psf
