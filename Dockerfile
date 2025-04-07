FROM ubuntu:latest
LABEL authors="morgan"

ENTRYPOINT ["top", "-b"]