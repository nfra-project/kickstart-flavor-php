# Developing this container


## Dockerhub integration

- The docker-service must be added to group-repository by hand
  by the user of the automated build.
  
In docker there should be following build-settings:

| Type | Name | Dockerfile Location | Docker Tag name |
|--------|---------------|---------------------|--------------------|
| Branch | master                 | /                   | unstable   |
| Branch | `/^([0-9.]+)-stable$/` | /                   | {\1}       |

## Modify ckit version in dockerfile


