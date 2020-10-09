FROM land007/ubuntu-build:latest

MAINTAINER Jia Yiqiu <yiqiujia@hotmail.com>

RUN cd / \
 && apt-get update \
 && apt-get install -y openssl libssl-dev \
 && git clone https://github.com/meyerd/n2n.git \
 && cd /n2n/n2n_v2 \
 && cmake . \
 && make \
 && make install \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /n2n

RUN echo $(date "+%Y-%m-%d_%H:%M:%S") >> /.image_times && \
	echo $(date "+%Y-%m-%d_%H:%M:%S") > /.image_time && \
	echo "land007/n2n" >> /.image_names && \
	echo "land007/n2n" > /.image_name

#docker build -t land007/n2n:latest .
#> docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t land007/n2n:latest --push .
