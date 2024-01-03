FROM alpine

COPY patches/* ./patches/

RUN ls -a ./patches/