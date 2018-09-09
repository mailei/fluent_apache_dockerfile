FROM ubuntu:18.04
MAINTAINER iwaiwa

RUN apt-get update && \
    apt-get install -y git \
      sudo \
      vim \
      bash-completion \
      byobu \
      net-tools \
      lsof \
      wget \
      curl \
      make \
      build-essential \
      libssl-dev \
      libxml2-dev \
      libxslt1-dev \
      apache2 \
      ruby-dev \
      ruby


RUN gem install fluentd-ui 
RUN fluentd-ui setup

CMD ["fluentd-ui", "start"]


EXPOSE 9292 24224 80
