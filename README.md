<h1>Purescript counter plus additions app</h1>

## Dockerfile Hub Location
<!--https://hub.docker.com/r/gyeh/purescript/-->

## Build Image
```
docker build -t purescript-svr-690 .
```

## Development environment
```
cd .../GitHub/purescript-thermite-work/counter-plus

docker run -it -v $(pwd):/usr/src/app -v counter_app_node_modules:/usr/src/app/node_modules purescript-svr-690 /bin/bash

docker run -it -v $(pwd):/usr/src/app -v task_list_app_node_modules:/usr/s
rc/app/node_modules purescript-svr-690 /bin/bash
```

## Initial Setup
It's necessary to log in as root then ```npm install```. To do that, find the id for the purescript container and then use that id to `exec` into the machine.
```
docker ps 

docker exec -it -u 0 **container-id** /bin/bash
```

## repl
```
docker run -it purescript-svr-690
docker run -it purescript-svr-690 /bin/bash
```

## Electron version
```
docker run -it -p 1337:1337 -v $(pwd):/usr/src/app/ -v pure_app_node_modules:/usr/src/app/electron-quick-start/node_modules purescript-svr-690 /bin/bash
```
