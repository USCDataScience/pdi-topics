## pdi-topics

LDA topic modeling for Polar Deep Insights.

[![Binder](https://mybinder.org/badge.svg)](https://mybinder.org/v2/gh/USCDataScience/pdi-topics/binder?filepath=notebooks%2Fpdi%2Fpdi-topics-egu.ipynb)

### Build and start a docker image

Copy the Dockerfile to the project foolder and run the following commands.

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

### Running pdi-topics on a local Solr index with Sparkler data

1. Follow steps on https://github.com/USCDataScience/sparkler to run Sparkler on a seed url or file.
2. After execution completes, you can find the data indexed on http://localhost:8983/solr/#/crawldb/query
3. Build the docker image and run it using the following command. You need to replace HOST-IP with your system’s IP address. 
```
docker run -d -t --add-host=docker:{HOST-IP} -p 8888:8888 --name pdi-topics pdi-topics
```
4. Run sparkler-pdi-topics.ipynb and sparkler-pdi-scikit-topics.ipynb notebooks to view results for Sparkler data.

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

