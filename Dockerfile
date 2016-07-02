FROM gbalaraman/alpine-base:3.3
MAINTAINER Goutham Balaraman <gouthaman.balaraman@gmail.com>
LABEL Description="An environment for python based data analysis"

ADD repositories /etc/apk/repositories
RUN apk update && apk add --no-cache python python-dev gfortran cython py-pip py-scipy@testing py-scipy-dev@testing py-matplotlib@testing \
	&& pip install --no-cache-dir --upgrade pip \
	&& pip install --no-cache-dir seaborn pandas sklearn jupyter statsmodels

EXPOSE 8888

RUN mkdir /home/notebooks
VOLUME /home/notebooks

CMD /bin/bash && jupyter notebook --no-browser --ip=0.0.0.0 --port=8888 --notebook-dir=/home/notebooks


