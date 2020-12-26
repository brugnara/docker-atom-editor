FROM jamesnetherton/docker-atom-editor

RUN mkdir /home/atom/.atom && chown atom:atom /home/atom/.atom
