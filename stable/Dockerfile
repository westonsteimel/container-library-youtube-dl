# youtube-dl
#
#   docker run \
#       --rm \
#       -v "${HOME}/Downloads:/home/youtube-dl/Downloads" \
#       --name youtube-dl \
#       youtube-dl "$@"
#

ARG REVISION
ARG CREATED
ARG VERSION
ARG GIT_REF="${VERSION}"

FROM python:3-alpine

ARG REVISION
ARG CREATED
ARG VERSION

RUN addgroup youtube-dl \
    && adduser -G youtube-dl -s /bin/sh -D youtube-dl

USER youtube-dl
ENV PATH "/home/youtube-dl/.local/bin:$PATH"
RUN pip install --user --no-cache-dir youtube-dl==${VERSION}
WORKDIR /home/youtube-dl/Downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

LABEL org.opencontainers.image.title="youtube-dl" \
    org.opencontainers.image.description="youtube-dl in Docker" \
    org.opencontainers.image.source="${SOURCE}" \
    org.opencontainers.image.revision="${REVISION}" \
    org.opencontainers.image.created="${CREATED}" \
    org.opencontainers.image.version="${VERSION}"
