#
# Embedded ARM build environment for use with gitlab-ci-multi-runner
#
# Author: Kyle Manna <kyle[at]kylemanna[d0t]com>
#

#
# Ubuntu is selected due to its long support life.
#
FROM ubuntu:16.04

#
# Ubuntu 16.04 seems to lag behind by a lot from embedded compilers currently at v4.9.3
#
# Instead, install upstream release from PPA and associated signing key.
#
#                                                                       
#                       
RUN \
    echo 'deb http://ppa.launchpad.net/team-gcc-arm-embedded/ppa/ubuntu xenial main' > /etc/apt/sources.list.d/gcc-arm-embedded.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D1FAA6ECF64D33B0 && \
    apt-get update && \
    apt-get install -y \
                        build-essential \
                        cmake \
                        curl \
                        gcc \
                        git \
                        qemu-user \
                        clang \
                        python-protobuf \
                        valgrind \
                        ninja-build \
                        gcc-arm-embedded \
                        sdcc \
                        srecord \
                        protobuf-compiler \
                        openssh-client \
                        python \
                        wget \
                        bzip2 \
                   && \
    #cd /opt/ && \
    #wget https://launchpad.net/gcc-arm-embedded/4.9/4.9-2015-q3-update/+download/#gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 && \
    #tar xjf gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 && \
    #wget http://downloads.sourceforge.net/project/sdcc/sdcc-linux-x86/3.3.0/sdcc-3.3.0-i386-unknown-linux2.5.tar.bz2 && \
    #tar xjf sdcc-3.3.0-i386-unknown-linux2.5.tar.bz2 && \
    #rm sdcc-3.3.0-i386-unknown-linux2.5.tar.bz2 && \
    #cd sdcc-3.3.0 && \
    #cp -r * /usr/local && \
    #chmod a+x ~/.bashrc && \
    #echo 'export PATH=$PATH:/opt/sdcc-3.3.0/bin' >> ~/.bashrc && \
    #echo 'export PATH=$PATH:/opt/gcc-arm-none-eabi-4_9-2015q3/bin' >> ~/.bashrc && \
    #rm gcc-arm-none-eabi-4_9-2015q3-20150921-linux.tar.bz2 && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

    #rm -rf /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial universe' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates universe' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial multiverse' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates multiverse' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security universe' >> /etc/apt/sources.list && \
    #echo 'deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security multiverse' >> /etc/apt/sources.list && \#