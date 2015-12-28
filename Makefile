.PHONY: run-src clean dist run-dist

run-src:
	/Applications/love.app/Contents/MacOS/love /Users/jdias/Work/letras/src

clean:
	@rm -rf dist
  
dist:
	@mkdir -p dist
	@cd src && zip -9 -q -r ../dist/letras.love . && cd ..

run-dist:
	open dist/letras.love
	#/Applications/love.app/Contents/MacOS/love /Users/jdias/Work/letras/dist/letras.love


