# Docker Image for OpenTTD

[![Docker Image Version (latest semver)](https://img.shields.io/docker/v/hhexx/docker-openttd-patches?sort=semver)](https://hub.docker.com/r/hhexx/docker-openttd-patches/tags)
[![license](https://img.shields.io/github/license/h-exx/docker-openttd-patches)](https://github.com/rogerrum/docker-openttd/blob/main/LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/h-exx/docker-openttd-patches.svg)](https://github.com/h-exx/docker-openttd-patches)
[![Contributors](https://img.shields.io/github/contributors/h-exx/docker-openttd-patches.svg)](https://github.com/h-exx/docker-openttd-patches/graphs/contributors)


A Docker image for **[OpenTTD Patches](https://github.com/JGRennison/OpenTTD-patche)** to run inside Docker container and access it remotely using web browser.

Repository name in ghcr.io: **[ghcr.io/h-exx/docker-openttd-patches](https://ghcr.io/rogerrum/docker-openttd)**  
Repository name in Docker Hub: **[rogerrum/docker-openttd-patches](https://hub.docker.com/r/rogerrum/docker-openttd/)**  
Published via **automated build** mechanism  

## Docker Run
To simply do a quick and dirty run of the OpenTTD container:
```
docker run \
    -d --rm \
    --name openttd-patches \
    -v=${pwd}/config:/config \
    --publish=3000:3000 \
     ghcr.io/h-exx/docker-openttd-patches:latest
  
```
Access the game in browser using the url
```
http://localhost:3000
```
To stop the container simply run:
```
$ docker stop openttd-patches
```
To remove the container simply run:
```
$ docker rm openttd-patches
```

## Docker Compose
If you don't want to type out these long **Docker** commands, you could
optionally use [docker-compose](https://docs.docker.com/compose/) to set up your
image. Just download the repo and run it like so:

```yaml
version: '3.8'
services:
  openttd:
    image: ghcr.io/h-exx/docker-openttd-patches:latest
    container_name: openttd-patches
    restart: unless-stopped
    ports:
      - 3000:3000
    volumes:
      - ./config:/config:rw
```

## Issues
https://github.com/h-exx/docker-openttd-patches/issues

## Forked from rogerrum's docker-openttd
If you couldn't tell already, this is a fork from [rogerrum's Docker container of his docker-openttd.](https://github.com/rogerrum/docker-openttd)

I am unfortunately not as talented in making Docker containers *(yet)* as him, so all credit goes to him for this.

Changes made:
- Swapped out OpenTTD for [JGRennison's OpenTTD-Patches](https://github.com/JGRennison/OpenTTD-patches) *This is covered by a GNU General Public License. Please read more about [here](https://github.com/JGRennison/OpenTTD-patches?tab=License-1-ov-file#:~:text=readme%20for%20details-,GNU%20General%20Public%20License,-Version%202%2C%20June)*
- Updated this documentation to have my OpenTTD Patches Docker container
- Edited the Github Workflow code stuff to auto-update from OpenTTD-Patches rather than OpenTTD

## Contribute
* I am happy for any feedback! Create issues, discussions, ... feel free and involve!
* Send me a PR
