#!/usr/bin/env sh

#su $NB_USER -c python3 -m jhsingle_native_proxy.main -- /usr/bin/code-server --auth none --bind-addr 0.0.0.0:{port} .
#python3 -m jhsingle_native_proxy.main -- su $NB_USER -c /usr/bin/code-server --auth none --bind-addr 0.0.0.0:{port} .
python3 -m jhsingle_native_proxy.main -- su $NB_USER -c '/usr/bin/code-server --auth none --bind-addr 0.0.0.0:{port} .'
