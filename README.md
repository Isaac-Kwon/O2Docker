# O2Docker
ALICE O2 Docker

```
docker run -it -v ~/alio2:/data/workdir --name o2docker isaackwon/o2docker:latest
```

```
ENV PATH $PATH:/data/sw/alice/alibuild/
ENV USER_DIR /data/workdir/
ENV ALIBUILD_WORK_DIR /data/alice/sw/
```

All built O2 library is in /data/alice
AliBuild SW directory is /data/alice/sw/
