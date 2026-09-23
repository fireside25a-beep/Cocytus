# Graphics and Studio

The graphical application is `apps/cocytus-studio.coc`; its interface is drawn
entirely through native `clear`, `rect`, `text` and `caina` instructions.

Headless rendering:

```sh
./bin/cocytus compile apps/cocytus-studio.coc /tmp/cocytus-studio.cob
./bin/cocytus run /tmp/cocytus-studio.cob --ppm /tmp/cocytus-studio.ppm --frames /tmp/cocytus-studio
```

Interactive editing:

```sh
./bin/cocytus studio apps/cocytus-studio.coc
```

The Studio uses the same deterministic canvas drawn by the Cocytus source and
overlays the live X11 editor on that surface. The visible Build and Run buttons
use the same bounds as their click handlers. Building `name.coc` writes the
sibling bytecode path `name.cob`.

The Studio accepts keyboard editing, Backspace and Enter. Build uses Ctrl-S or
the Build button; Run uses Ctrl-R or the Run button; Escape closes the window.
Its editor buffer is 32 KiB. X11 availability is a host presentation concern;
the deterministic raster path remains available without a display.
