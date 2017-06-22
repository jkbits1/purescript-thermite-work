FROM node:6.9.0

EXPOSE 1337

RUN npm install -g purescript bower pulp

RUN useradd -m -s /bin/bash pureuser

WORKDIR /home/pureuser

USER pureuser

ENTRYPOINT ["/bin/bash"]


# CMD ["/bin/bash"]
