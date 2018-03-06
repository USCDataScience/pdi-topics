FROM continuumio/miniconda3:4.4.10

WORKDIR /opt/pdi-topics
COPY ./environment.yml /opt/pdi-topics
RUN conda config --add channels vida-nyu && \
    conda config --add channels conda-forge
RUN conda env create -f environment.yml && \
    apt-get clean && apt-get autoremove && rm -rf /var/lib/apt/lists/* && \
    conda remove -n pdi-topics --quiet --yes --force qt pyqt && \
    conda clean -tipsy && conda clean --yes --all
RUN mkdir -p /opt/pdi-topics/notebooks
COPY ./notebooks /opt/pdi-topics/notebooks

CMD bash -c "source activate pdi-topics; jupyter notebook --allow-root --notebook-dir=/opt/pdi-topics/notebooks --ip='*' --port=8888 --no-browser"
