## Build with
# docker build -t isaackwon/o2docker:base-latest --file Dockerfile-base .
#
## Upload with
# docker push isaackwon/o2docker:base-latest
# docker tag isaackwon/o2docker:base-latest isaackwon/o2docker:base-$(date '+%Y-%m-%d')
# docker push isaackwon/o2docker:base-$(date '+%Y-%m-%d')

FROM cern/cc7-base:latest

WORKDIR /data/alice

RUN yum -y install epel-release && yum clean all;\
    yum install -y centos-release-scl;

RUN yum install -y python-pip texinfo gcc gcc-c++ gcc-gfortran make patch sed \
  libX11-devel libXft-devel libXpm-devel libXext-devel \
  libXmu-devel mesa-libGLU-devel mesa-libGL-devel ncurses-devel \
  curl curl-devel bzip2 bzip2-devel gzip unzip tar \
  expat-devel subversion git flex bison imake redhat-lsb-core python-devel \
  libxml2-devel wget openssl-devel krb5-devel \
  automake autoconf libtool which perl-ExtUtils-Embed.noarch \
  mariadb.x86_64 mariadb-devel.x86_64 mariadb-server.x86_64 \
  environment-modules && yum clean all

RUN pip install --upgrade pip
RUN pip install matplotlib==2.0.2 numpy certifi ipython==5.1.0 ipywidgets ipykernel notebook metakernel pyyaml requests

RUN mkdir -p /data/workdir

ENV PATH $PATH:/data/alice/alibuild/
ENV USER_DIR /data/workdir/
ENV ALIBUILD_WORK_DIR /data/alice/sw/
ENV HOME /data/

WORKDIR /data/

ENTRYPOINT /bin/bash --init-file /etc/bashrc
