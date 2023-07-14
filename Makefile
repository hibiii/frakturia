.PHONY: deps apply clean

files = src/index.txt src/alpha_lower.txt src/punct/2x.txt

frakturia.psf: $(files)
	cpp src/index.txt -P | txt2psf > frakturia.psf

apply: frakturia.psf
	test "${TERM}" = "linux"
	setfont frakturia.psf
	@cat cp437.txt
	@echo the quick brown fox jumps over the lazy dog

deps:
	@which txt2psf > /dev/null
	@echo all ok!

clean:
	rm frakturia.psf
