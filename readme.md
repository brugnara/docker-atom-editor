Docker Atom.io
==================

## How to use

You'll need [video-dummy](https://github.com/brugnara/video-dummy).

```bash
docker volume create --name x11tmp

docker rm -f video-dummy

docker run -d \
	--name video-dummy \
	-v x11tmp:/tmp/.X11-unix \
	brugnara/video-dummy

docker volume create --name atom-home

docker rm -f atom

docker run -d \
	--name atom \
	-v x11tmp:/tmp/.X11-unix/ \
  -v atom-home:/home/atom/.atom \
	-e DISPLAY=:1 \
  brugnara/atom
```

## Credits

This is a "fork" of the [jamesnetherton/docker-atom-editor](https://github.com/jamesnetherton/docker-atom-editor) version. This one just solves the permission denied error when mounting external volume.
