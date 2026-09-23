# Start here

Build Cocytus from the repository root:

```sh
./BUILD.sh
```

Inspect the executable contract:

```sh
./bin/cocytus about
```

Compile and execute a native program:

```sh
./bin/cocytus compile examples/surreal-demo.coc /tmp/surreal-demo.cob
./bin/cocytus run /tmp/surreal-demo.cob
```

Rebuild the native compiler fixed point:

```sh
./SELFHOST.sh
```

Start the interactive editor when an X11 display is available:

```sh
./bin/cocytus studio apps/cocytus-studio.coc
```

Read the [language reference](docs/LANGUAGE.md) and the
[Frozen Lake contract](docs/FROZEN_LAKE.md) before writing memory-using code.
