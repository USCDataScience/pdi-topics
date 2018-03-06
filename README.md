## pdi-topics

LDA topic modeling for Polar Deep Insights.

### Build and start a docker image

```sh
docker build -t pdi-topics .
```

Now to run it we can do

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
jupyter notebook --allow-root --notebook-dir=$MY_DIR --ip='*' --port=8888 --no-browser
```
