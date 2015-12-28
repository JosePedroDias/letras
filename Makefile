.PHONY: run-src symbolics clean dist run-dist

run-src:
	/Applications/love.app/Contents/MacOS/love /Users/jdias/Work/letras/src

symbolics:
	@cd src && ln -s ../assets/images images && cd ..

clean:
	@rm -rf dist src/images
  
dist:
	@mkdir -p dist
	@cd src && zip -9 -q -r ../dist/letras.love . && cd ..
	@cd assets && zip -9 -q -r ../dist/letras.love . && cd ..

run-dist:
	open dist/letras.love
	#/Applications/love.app/Contents/MacOS/love /Users/jdias/Work/letras/dist/letras.love
