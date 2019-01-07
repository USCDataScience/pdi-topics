# Polar Deep Insights Topics (pdi-topics) <img align="right" width="60" height="60" src="https://nsidc.org/images/nsidc_logo-footer.svg">

### Topic modeling Jupyter notebooks for Polar Deep Insights data and scientific text.

Run these notebooks in a browser by clicking on one of the buttons below.

> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/USCDataScience/pdi-topics/master?filepath=notebooks%2Fpdi%2Fpdi-topics-egu-sessions.ipynb)  __to launch EGU sessions analysis__
>
> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/USCDataScience/pdi-topics/master?filepath=notebooks%2Fpdi%2Fpdi-topics-egu-all-corpus.ipynb)  __to launch EGU complete corpus topic modeling__
>
> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/USCDataScience/pdi-topics/master?filepath=notebooks%2Fpdi%2Fpdi-topics-scattertext.ipynb)  __to launch ScatterText visualization on EGU abstracts__
>
> [![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/USCDataScience/pdi-topics/master?filepath=notebooks%2Fpdi%2FASSW%20Testbed%20.ipynb)  __to launch ASSW abstract modeling

The notebooks can also be executed on your own machine by using docker or in a Conda environment. See below for instructions

### Build and start a docker image

Copy the Dockerfile to the project folder and run the following commands.

```sh
docker build -t pdi-topics .
```

To run a container we use the following command.

```sh
docker run -d -t -p 8888:8888 --name pdi-topics pdi-topics
```

or if we want to run notebooks from a particular location we can just mount a volume

```
docker run -d -t -p 8888:8888 -v $MY_LOCAL_PATH:/opt/pdi-topics/notebooks --name pdi-topics pdi-topics
```

You'll need the jupyter token in order to access the notebooks, you can get it by inspecting the logs in the docker container

```sh
docker logs pdi-topics
```

### Using Conda environments

If we want to avoid using Docker we can also run the topic notebooks by creating an environment using conda3 or miniconda3

```sh
conda env create -f environment.yml
```
now to use the notebooks we need to activate the environment and run jupyter

```sh
source activate pdi-topics
jupyter notebook --allow-root --notebook-dir=$MY_DIR --ip='0.0.0.0' --port=8888 --no-browser
```

### Running pdi-topics on a local Solr index with Sparkler data

1. Follow steps on https://github.com/USCDataScience/sparkler to run Sparkler on a seed url or file.
2. After execution completes, you can find the data indexed on http://localhost:8983/solr/#/crawldb/query
3. Build the docker image and run it using the following command. You need to replace HOST-IP with your system’s IP address
```
docker run -d -t --add-host=docker:{HOST-IP} -p 8888:8888 --name pdi-topics pdi-topics
```
4. Run sparkler-pdi-topics.ipynb and sparkler-pdi-scikit-topics.ipynb notebooks to view results for Sparkler data.


### LICENSE
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

