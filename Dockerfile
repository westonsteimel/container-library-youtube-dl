# youtube-dl
#
#   docker run \
#       --rm \
#       -v "${HOME}/Downloads:/home/youtube-dl/Downloads" \
#       --name youtube-dl \
#       youtube-dl "$@"
#

FROM python:3-alpine

LABEL "version"="2019.06.27" 
ENV YOUTUBE_DL_VERSION 2019.06.27  

RUN addgroup youtube-dl \
    && adduser -G youtube-dl -s /bin/sh -D youtube-dl

USER youtube-dl
ENV PATH "/home/youtube-dl/.local/bin:$PATH"
RUN pip install --user --no-cache-dir youtube-dl==${YOUTUBE_DL_VERSION}
WORKDIR /home/youtube-dl/Downloads

ENTRYPOINT ["youtube-dl"]
CMD ["--help"]

