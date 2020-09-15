# Developing this container


## Dockerhub integration

- The docker-service must be added to group-repository by hand
  by the user of the automated build.
  
In docker there should be following build-settings:

| Type | Name | Dockerfile Location | Docker Tag name |
|--------|---------------|---------------------|--------------------|
| Branch | 7.4-stable    | /                   | 7.4, 7.4-arm32v7   |
| Tag    | `/^[0-9.]+$/` | /                   | latest          |
| Tag    | `/^[0-9.]+$/` | /                   | {sourceref} |