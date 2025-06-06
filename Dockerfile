FROM ghcr.io/nfra-project/kickstart-container-kit:1.8.2 AS ckit
FROM ubuntu:24.04

LABEL   maintainer="Matthias Leuffen <m@tth.es>"
     #   org.infracamp.flavor.tag="${DOCKER_TAG}" \
     #   org.infracamp.flavor.name="${IMAGE_NAME}"

COPY --from=ckit /kickstart /kickstart

## Used by buildkit to determine if it is a full or min build (requires hooks/build to send the arguments)
ARG DOCKER_TAG

ADD /kickstart /kickstart

# Do not put env config vars here - put them in prepare.d/


RUN chmod -R 755 /kickstart && /kickstart/flavor/build.sh
ENTRYPOINT ["/kickstart/run/entrypoint.sh"]
