# How to build? (version is docker container related, not mbuild version)
# docker build . -f Dockerfile  -t cmelab/mbuild:0.4.0

# How to run?
# docker run --rm -itp 8888:8888 cmelab/mbuild:0.4.0 jupyter notebook --notebook-dir=/home/ --ip='*' --port=8888 --no-browser --allow-root

FROM mmh42/docker-alpine-miniconda3

RUN conda install -c cmelab -c mosdef -c bioconda mbuild notebook -c glotzer -c omnia -y
RUN nglview install
RUN nglview enable
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension
RUN conda clean -itp -y

CMD jupyter notebook --ip=* --port=8888 --no-browser --notebook-dir=/opt/app/data --allow-root --NotebookApp.iopub_data_rate_limit=100000000
