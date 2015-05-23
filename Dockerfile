FROM ubuntu:14.10

RUN apt-get update
RUN apt-get -y build-dep
RUN apt-get -y install texinfo

RUN mkdir -p /gcc/scripts
ADD common.sh /gcc/scripts/common.sh
ADD prepare.sh /gcc/scripts/prepapre.sh
ADD build_gcc_deps.sh /gcc/scripts/build_gcc_deps.sh
ADD build_gcc.sh /gcc/scripts/build_gcc.sh
RUN mkdir -p /opt/hisi-linux-nptl
# Original runtime from hitec
ADD hisi-linux-nptl /opt/hisi-linux-nptl

WORKDIR /gcc/scripts
RUN ./prepare.sh
RUN ./build_gcc_deps.sh
RUN ./build_gcc.sh

CMD /bin/bash
