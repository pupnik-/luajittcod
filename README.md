Luajit binding for libtcod 1.5.1 by Pupnik

To use you will need to install luajit and get libtcod 1.5.1 and change the
dll loaded to whichever version of libtcod you build.  Functions are sorted by
section as found on the online documentation, the structs are all at the top
but largely unsorted.  Currently it is quite limited, mostly just the raw FFI 
binding into C which you can use, but it is a bit of a hassle handling the
structs and C types as you must sometimes do.  I will be writing wrappers for
functions as I go over the next few weeks up to and including the 7drl
challenge.

Some sections have been excluded as they duplicate functionality found in lua
while a couple of minor sections are not complete yet, as noted in
tcodwrap.lua.  Currently it does not have module information, to inlude it in
your lua code simply dofile("tcodwarp.lua") and all tcod functions will be
accessed by tcod.*.  The wraps will be in the global scope, and follow the
conventions of the python tcod wrapper code found on the libtcod docs.

http://doryen.eptalys.net/libtcod/
http://luajit.org/
http://doryen.eptalys.net/data/libtcod/doc/1.5.1/index2.html

Thanks to Jice and Mingos for making such a great roguelike library!