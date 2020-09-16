FROM nfra/kickstart-ckit:1.0-rc AS ckit

FROM ubuntu:18.04
COPY --from=ckit /kickstart /kickstart

ADD /kickstart /kickstart

# Do not put env config vars here - put them in prepare.d/


RUN chmod -R 755 /kickstart && /kickstart/flavor/build.sh
ENTRYPOINT ["/kickstart/run/entrypoint.sh"]
# Set from hub.docker.com

