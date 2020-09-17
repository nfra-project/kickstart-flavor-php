FROM nfra/kickstart-ckit:1.0-rc AS ckit

LABEL   maintainer="Matthias Leuffen <m@tth.es>" \
        org.infracamp.flavor.tag="${DOCKER_TAG}" \
        org.infracamp.flavor.name="${IMAGE_NAME}"

FROM ubuntu:20.04
COPY --from=ckit /kickstart /kickstart

## Used by buildkit to determine if it is a full or min build
ENV FLAVOR_ORIG_DOCKER_TAG="${DOCKER_TAG}"

RUN env

ADD /kickstart /kickstart

# Do not put env config vars here - put them in prepare.d/


RUN chmod -R 755 /kickstart && /kickstart/flavor/build.sh
ENTRYPOINT ["/kickstart/run/entrypoint.sh"]
# Set from hub.docker.com

