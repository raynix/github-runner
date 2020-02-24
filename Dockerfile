FROM ubuntu:latest as builder
ARG VERSION=2.165.2

WORKDIR /actions-runner
RUN apt update -qqy && apt install -qqy curl
RUN curl -O -L https://github.com/actions/runner/releases/download/v${VERSION}/actions-runner-linux-x64-${VERSION}.tar.gz && \
  tar xzf ./actions-runner-linux-x64-${VERSION}.tar.gz && \
  rm ./actions-runner-linux-x64-${VERSION}.tar.gz && \
  addgroup --system --gid 2000 ghrunner && \
  adduser --system --gid 2000 --uid 2000 ghrunner

FROM alpine:latest

RUN apk add --update bash && rm -rf /var/cache/apk/*s
WORKDIR /actions-runner
COPY --from=builder /actions-runner/* ./
COPY --from=builder /etc/passwd /etc/passwd
USER ghrunner
COPY entrypoint.sh .
ENTRYPOINT ["entrypoint.sh"]
