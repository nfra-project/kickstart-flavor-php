FROM ghcr.io/nfra-project/kickstart-container-kit:1.8.3 AS ckit
FROM ubuntu:26.04

LABEL   maintainer="Matthias Leuffen <m@tth.es>"

COPY --from=ckit /kickstart /kickstart


ADD /kickstart /kickstart

# Do not put env config vars here - put them in prepare.d/


RUN chmod -R 755 /kickstart && /kickstart/flavor/build.sh
ENTRYPOINT ["/kickstart/run/entrypoint.sh"]
