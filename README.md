# Buildroot RPI 5

This is as BR2_EXTERNAL tree for building an image for Raspberry Pi 5 using buildroot. This repository also features a Dcoker image base on Debian 12.9 tha includes all necessary dependencies to build the image for the target device.

# Getting Started

### Prerequisites
Ensure you have the following installed on your system:
- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/)

### Building the Docker image
To build the Docker image, run:
```sh
make build_container
```
This will create a Docker image tagged with the latest Git commit hash.

### Running an Interactive Shell
To start an interactive shell within the container, use:
```sh
make run_container
```
This will launch a bash shell inside the container.

### Building the RPI5 Image
To run a clean build from inside the Docker container, run:
```sh
make image_clean_build
```

To run a dirty build in case you have to re-build your image and don't want to rebuild all packages and dependencies:
```sh
make image_dirty_build
```
 
## Makefile Commands
| Command | Description |
|---------|-------------|
| `make build_container` | Builds the Docker image and tags it with the latest commit hash and `latest` tag. |
| `make run_container` | Runs an interactive shell inside the container. |
| `make image_clean_build` | Clean build of RPI5 image|
| `make image_dirty_build` | Re-build of RPI5 image|

## License
This project is licensed under the MIT License.

## Author
pfs
