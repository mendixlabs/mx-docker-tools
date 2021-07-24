# Dockerfile to use Mendix command line tools in docker context.
FROM adoptopenjdk/openjdk11:jdk-11.0.3_7

ENV PATH="$JAVA_HOME:$PATH" \
    MONO_VERSION="5.20.1" \
    LANG="C.UTF-8"

RUN apt-get update -qqy && \
    apt-get install -qqy gnupg && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && \
    echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic/snapshots/$MONO_VERSION main" | \ 
      tee /etc/apt/sources.list.d/mono-official-stable.list && \
    apt-get update -qqy && \
    apt-get install -qqy mono-devel && \
\
    update-ca-certificates -f && \
    cert-sync /etc/ssl/certs/ca-certificates.crt && \
\
    apt-get -qqy remove --auto-remove wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD ./scripts /opt/scripts

ARG MX_VERSION="9.3.0.22930"

# Each comment line relates to a line in the RUN script
# Create a directory that console tools going to be extracted to
# Grant execution permission to tools acquisition scripts
# Run tools acquisition scripts
# Grant execution permissions to the entry point script
RUN mkdir /opt/tools && \
    chmod +x /opt/scripts/getMxTools.sh && \
    /opt/scripts/getMxTools.sh $MX_VERSION && \
    chmod +x /opt/scripts/entrypoint.sh

WORKDIR /opt/tools/
ENTRYPOINT [ "/opt/scripts/entrypoint.sh" ]
