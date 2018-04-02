# docker-mbuild
Docker container with mbuild, jupyter notebook, and miniconda with python3.6
get image:
`docker pull cmelab/mbuild`
run:
`docker run -itp 8888:8888 cmelab/mbuild:latest jupyter notebook --notebook-dir=/home/ --ip='*' --port=8888 --no-browser --allow-root`
