ARG BASE_CONTAINER=jupyter/datascience-notebook
FROM $BASE_CONTAINER

USER root

RUN apt-get update && apt-get install -yq --no-install-recommends \
    curl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install other tools
RUN apt-get update && apt-get install -yq --no-install-recommends \
    nodejs \
    npm \
    less \
    vim \
    htop \
    screen \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip3 install -r requirements.txt
RUN jupyter serverextension enable --sys-prefix jupyter_server_proxy

RUN npm install -g configurable-http-proxy
COPY start_configurable_http_proxy.sh /usr/local/bin/

COPY jupyter_notebook_config.py /etc/jupyter/

USER $NB_UID
