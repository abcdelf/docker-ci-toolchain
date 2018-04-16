
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
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
