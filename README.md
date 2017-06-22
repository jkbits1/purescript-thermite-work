<h1>Purescript counter plus additions app</h1>

## Dockerfile Hub Location
<!--https://hub.docker.com/r/gyeh/purescript/-->

## Create Development environment

### Build Image
```
cd .../GitHub/purescript-thermite-work/docker/node

docker build -t purescript-svr-690 .
```

### Generate Env
```
cd .../GitHub/purescript-thermite-work/counter-plus

docker run -it -v $(pwd):/usr/src/app -v counter_app_node_modules:/usr/src/app/node_modules purescript-svr-690 /bin/bash

cd .../GitHub/purescript-thermite-work/task-list-blog

docker run -it -v $(pwd):/usr/src/app -v task_list_app_node_modules:/usr/src/app/node_modules purescript-svr-690 /bin/bash

cd .../GitHub/purescript-thermite-work/counter-plus-blog

docker run -it -v $(pwd):/usr/src/app -v counter_task_app_node_modules:/usr/src/app/node_modules purescript-svr-690 /bin/bash

```

### Enter Existing Env
Start stopped container and exec into it.
```
docker start $(docker ps -a | grep purescript-svr-690 | cut -c 1-4)
docker exec -it $(docker ps | grep purescript-svr-690 | cut -c 1-4) /bin/bash
```



## Initial Setup
It's necessary to log in as root then ```npm install```. To do that, find the id for the purescript container and then use that id to `exec` into the machine.
```
docker ps 

docker exec -it -u 0 **container-id** /bin/bash

docker exec -it -u 0 $(docker ps | grep pure | cut -c 1-4) /bin/bash
```

## repl
```
docker run -it purescript-svr-690
docker run -it purescript-svr-690 /bin/bash
```

## Build Application
```
cd /usr/src/app
pulp browserify --to html/index.js
```

## Electron version
```
docker run -it -p 1337:1337 -v $(pwd):/usr/src/app/ -v pure_app_node_modules:/usr/src/app/electron-quick-start/node_modules purescript-svr-690 /bin/bash
```
