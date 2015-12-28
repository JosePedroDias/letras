# letras

testing [love2d](https://love2d.org/) and [lua](http://www.lua.org/) for the simplest educational game...


## How


### bundling

run `make dist` on mac/linux


### running

to run it on Mac OS X, install [LOVE for Mac OS X](https://bitbucket.org/rude/love/downloads/love-0.10.0-macosx-x64.zip)

to run it on android, install [LOVE for Android](https://play.google.com/store/apps/details?id=org.love2d.android) 
and then open the `letras.love` game


## Roadmap

* gamedev 101
    * ~~basic bundling and assets rendering~~
    * ~~off-screen rendering (commented out currently)~~
    * optimize for full screen (keep AR, scale up and center, remap mouse/touch events)
    * create and use bitmap font
    
* lua
    * modular design

* game design
    * stroke the letter
        * display letter steps
        * draw stroke with completion hints
        * read letter beforehand


## Reference


### Love2D
* [getting started](https://love2d.org/wiki/Getting_Started)
* [cb funcs](https://love2d.org/wiki/Tutorial:Callback_Functions)
* [API](https://love2d.org/wiki/love)


### Lua

* [Programming in Lua](http://www.lua.org/pil/contents.html)
* [Lua 5.3 Manual](http://www.lua.org/manual/5.3/)
