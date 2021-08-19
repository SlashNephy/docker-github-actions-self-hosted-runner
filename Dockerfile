FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends \
        tzdata \
        ca-certificates \
        curl \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos "" runner

USER runner
WORKDIR /home/runner
RUN mkdir actions-runner \
    && cd actions-runner \
    && curl -O -L https://github.com/actions/runner/releases/download/v2.280.2/actions-runner-linux-x64-2.280.2.tar.gz \
    && tar xzf actions-runner-linux-x64-2.280.2.tar.gz \
    && rm actions-runner-linux-x64-2.280.2.tar.gz

USER root
WORKDIR /home/runner/actions-runner
RUN ./bin/installdependencies.sh

COPY entrypoint.sh /home/runner/actions-runner/entrypoint.sh
RUN chmod +x entrypoint.sh

USER runner
WORKDIR /home/runner/actions-runner

ENTRYPOINT [ "./entrypoint.sh" ]
