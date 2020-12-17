#ARG BASE_CONTAINER=jupyter/base-notebook
ARG BASE_CONTAINER=jupyter/datascience-notebook

FROM $BASE_CONTAINER

USER root

RUN python3 -m pip install jhsingle-native-proxy

RUN apt-get update && apt-get install -yq --no-install-recommends \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://code-server.dev/install.sh | sh

COPY jh-entrypoint.sh /usr/bin/jh-entrypoint.sh
RUN sudo chmod a+rx /usr/bin/jh-entrypoint.sh
COPY change-user.sh /usr/bin/change-user.sh
RUN sudo chmod a+rx /usr/bin/change-user.sh

# Install other tools
RUN apt-get update && apt-get install -yq --no-install-recommends \
    nodejs \
    npm \
    less \
    vim \
    htop \
    screen \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

CMD ["/usr/bin/change-user.sh"]
