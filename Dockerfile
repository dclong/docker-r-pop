FROM dclong/r-base:dev

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
        libxml2-dev \
        libcairo2-dev \
        libssl-dev \
        libcurl4-openssl-dev \
        openjdk-8-jdk r-cran-rjava \
    && apt-get autoremove \
    && apt-get autoclean

ADD install_packages.r /install_packages.r
RUN Rscript /install_packages.r \
    && rm /install_packages.r
