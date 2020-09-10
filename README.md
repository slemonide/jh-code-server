# jh-code-server

Getting VSCode [code-server](https://github.com/cdr/code-server) running inside JupyterHub

Build the Docker image:

```
docker build -t jh-code-server .
```

Add to your JupyterHub config, e.g.:


```
c.DockerSpawner.image = 'jh-code-server:latest'
c.DockerSpawner.cmd = ["python3", "-m", "jhsingle_native_proxy.main", "--destport=0", "/usr/bin/code-server", "{--}bind-addr", "0.0.0.0:{port}", "."]
```

