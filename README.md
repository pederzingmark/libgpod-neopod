# libgpod for Neopod

The libgpod source that [Neopod](https://github.com/pederzingmark/Neopod) ships as `Contents/Frameworks/libgpod.dylib`, with Neopod's changes.

- Upstream: libgpod from the gtkpod project, https://sourceforge.net/projects/gtkpod/
- License: GNU Lesser General Public License, see `COPYING.LGPL`. Copyright belongs to the libgpod authors; see the headers in each file.
- Changes for Neopod: a model guess from artwork file names in `itdb_device.c`, re-parsing the ArtworkDB once the device description is loaded, a flag in `itdb_itunesdb.c` that tells the writer when a cover was added, "internal" functions kept visible in the dylib (`itdb.h`), and a stripped-down build (`stubs.c`, no Python or GTK).

## Building
Needs GLib, gdk-pixbuf and gettext from Homebrew (`brew install glib gdk-pixbuf gettext`).

```
swift build -c release
```
produces `libgpod.dylib`. To use your own build in Neopod, replace `Neopod.app/Contents/Frameworks/libgpod.dylib` with it (the library keeps the same name and interface) and sign the app again.
