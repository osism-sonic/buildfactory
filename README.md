# buildfactory

## preparations

```
suod snap install docker 
sudo apt-get install -y python3-pip make
sudo pip3 install j2cli
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker
```

## sources

* ``x86_64-accton_as7726_32x-r0`` overlay files: https://github.com/sonic-net/sonic-buildimage/commit/f5494d497fa326d83cde4bc5b07bfea294d4deb3
