<h1>Purescript counter plus additions app</h1>

## Dockerfile Hub Location
<!--https://hub.docker.com/r/gyeh/purescript/-->

## Build Image
```
docker build -t purescript-svr-690 .
```

## Initial Setup
Log in as root for ```npm install```
```
docker run -it -u 0 purescript-svr /bin/bash
```

## repl
```
docker run -it purescript-svr
docker run -it purescript-svr /bin/bash
```

## Development environment
```
cd .../GitHub/purescript-thermite-work/counter-plus
docker run -it -v $(pwd):/usr/src/app -v counter_app_node_modules:/usr/src/app/node_modules purescript-svr-690 /bin/bash
```

## Electron version
```
docker run -it -p 1337:1337 -v $(pwd):/usr/src/app/ -v pure_app_node_modules:/usr/src/app/electron-quick-start/node_modules purescript-svr /bin/bash
```
