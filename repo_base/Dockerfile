ARG BASE_IMG=debian:bullseye
# hadolint ignore=DL3006
FROM $BASE_IMG

COPY setup.sh /tmp/
RUN chmod +x /tmp/setup.sh
RUN /tmp/setup.sh
