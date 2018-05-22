# docker-mbuild

[![](https://images.microbadger.com/badges/image/cmelab/mbuild.svg)](https://microbadger.com/images/cmelab/mbuild "Get your own image badge on microbadger.com")

Docker container with mbuild, jupyter notebook, and miniconda with python3.6

Image is 1.1gb, but has the full mbuild stack and `.visualize()` works.

get image:

`docker pull cmelab/mbuild`

run:
`docker run -itp 8888:8888 --mount type=bind,source=(pwd),target=/home/ cmelab/mbuild:latest`

This will expose the folder you run the command in to the notebook.
The permissions of things saved will be a bit weird but there will be a fix for that.
