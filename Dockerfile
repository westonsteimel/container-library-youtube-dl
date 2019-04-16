# youtube-dl
#
#   docker run \
#       --rm \
#       -v "${HOME}/Downloads:/home/youtube-dl/Downloads" \
#       --name youtube-dl \
#       youtube-dl "$@"
#

FROM python:3-alpine

ENV YOUTUBE_DL_VERSION 2019.04.17

RUN addgroup -g 1000 youtube-dl \
    && adduser -u 1000 -G youtube-dl -s /bin/sh -D youtube-dl

USER youtube-dl
ENV PATH "/home/youtube-dl/.local/bin:$PATH"
RUN pip install --user --no-cache-dir youtube-dl==${YOUTUBE_DL_VERSION}
WORKDIR /home/youtube-dl/Downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

