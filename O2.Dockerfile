## Build with
# docker build -t isaackwon/o2docker:O2-latest --file Dockerfile-base .
#
## Upload with
# docker push isaackwon/o2docker:o2-latest
# docker tag isaackwon/o2docker:o2-latest isaackwon/o2docker:o2-$(date '+%Y-%m-%d')
# docker push isaackwon/o2docker:o2-$(date '+%Y-%m-%d')

FROM isaackwon/o2docker:base-latest

WORKDIR /data/alice

RUN git clone https://github.com/Isaac-Kwon/alidist.git alidist;\
    git clone https://github.com/alisw/alibuild.git alibuild;\
    git clone https://github.com/AliceO2Group/AliceO2.git O2;\
    git clone --bare https://gitlab.cern.ch/hepmc/HepMC.git /data/alice/sw/MIRROR/hepmc;

RUN alibuild/aliBuild build HepMC -j12 --debug && alibuild/aliBuild clean
RUN alibuild/aliBuild build GEANT4 -j12 --debug && alibuild/aliBuild clean
RUN alibuild/aliBuild build ROOT -j12 --debug && alibuild/aliBuild clean
RUN alibuild/aliBuild build FairRoot -j12 --debug && alibuild/aliBuild clean
RUN alibuild/aliBuild build O2 --defaults o2 -j12 --debug && alibuild/aliBuild clean

WORKDIR /data/

ENTRYPOINT /bin/bash --init-file /etc/bashrc
