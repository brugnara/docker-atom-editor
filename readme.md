Docker Headless Atom.io
==================

## Why?

There are many reasons for starting an app headless. You may think that
having an editor headless is almost useless and I couldn't agree more.

But, check [go-live](https://github.com/brugnara/go-live) and you'll better
understand what's behind.

## How to use

You'll need [video-dummy](https://github.com/brugnara/video-dummy) or
[Xvfb](https://github.com/kcollins/xvfb).

```bash
docker volume create --name x11tmp

docker rm -f video-dummy

docker run -d \
	--name video-dummy \
	-v x11tmp:/tmp/.X11-unix \
	brugnara/video-dummy

# OR

docker run -d \
	--name video-dummy \
	-v x11tmp:/tmp/.X11-unix \
	kcollins/xvfb:latest :1 -screen 0 1920x1080x24

# then:

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
