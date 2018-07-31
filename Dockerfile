# How to build? (optional) (version is docker container related, not mbuild version)
# docker build . -f Dockerfile  -t cmelab/mbuild

# How to run?
# docker run --rm -itp 8888:8888 cmelab/mbuild:latest jupyter notebook --notebook-dir=/home/ --ip='*' --port=8888 --no-browser --allow-root

FROM mmh42/docker-alpine-miniconda3

# Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/mikemhenry/docker-mbuild" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

ADD ./spec-file.txt spec-file.txt
RUN apk update && \
    apk add libxrender libxext cairo git && \
    #conda install -c cmelab -c mosdef -c bioconda -c glotzer -c omnia -c openbabel -y mbuild notebook gsd openbabel  && \
    conda install --file spec-file.txt -y && \ 
    conda clean -tipsy && \
    nglview install && nglview enable && \
    jupyter nbextension enable --py --sys-prefix widgetsnbextension && \
    pip install --no-cache-dir --upgrade git+https://github.com/mikemhenry/foyer.git@mike/docker git+https://github.com/mikemhenry/mbuild.git@mike/docker


CMD jupyter notebook --port=8888 --ip='*' --no-browser --notebook-dir=/home/ --allow-root --NotebookApp.iopub_data_rate_limit=100000000
