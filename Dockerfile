# youtube-dl
#
#   docker run \
#       --rm \
#       -v "${HOME}/Downloads:/home/youtube-dl/Downloads" \
#       --name youtube-dl \
#       youtube-dl "$@"
#

FROM python:3-alpine

ARG YOUTUBE_DL_VERSION="2019.08.02"
ENV YOUTUBE_DL_VERSION "${YOUTUBE_DL_VERSION}"

RUN addgroup youtube-dl \
    && adduser -G youtube-dl -s /bin/sh -D youtube-dl

USER youtube-dl
ENV PATH "/home/youtube-dl/.local/bin:$PATH"
RUN pip install --user --no-cache-dir youtube-dl==${YOUTUBE_DL_VERSION}
WORKDIR /home/youtube-dl/Downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

LABEL org.opencontainers.image.title="youtube-dl" \
    org.opencontainers.image.description="youtube-dl in Docker" \  
    org.opencontainers.image.url="https://github.com/westonsteimel/docker-youtube-dl" \ 
    org.opencontainers.image.source="https://github.com/westonsteimel/docker-youtube-dl" \
    org.opencontainers.image.version="${YOUTUBE_DL_VERSION}"
