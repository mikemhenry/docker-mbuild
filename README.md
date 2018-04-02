# docker-mbuild

[![](https://images.microbadger.com/badges/image/cmelab/mbuild.svg)](https://microbadger.com/images/cmelab/mbuild "Get your own image badge on microbadger.com")

Docker container with mbuild, jupyter notebook, and miniconda with python3.6

get image:

`docker pull cmelab/mbuild`

run:

`docker run -itp 8888:8888 cmelab/mbuild:latest jupyter notebook --notebook-dir=/home/ --ip='*' --port=8888 --no-browser --allow-root`
