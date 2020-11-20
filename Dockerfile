FROM codercom/code-server:latest

RUN sudo apt update
RUN sudo apt install -y python3-pip

RUN sudo python3 -m pip install jhsingle-native-proxy

COPY jh-entrypoint.sh /usr/bin/jh-entrypoint.sh

RUN sudo chmod a+rx /usr/bin/jh-entrypoint.sh

CMD ["/usr/bin/jh-entrypoint.sh"]
ENTRYPOINT ["/usr/bin/jh-entrypoint.sh"]

