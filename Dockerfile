FROM ghcr.io/ba-st/pharo-loader:v11.0.0
USER root
RUN  apt update \
  && apt upgrade --assume-yes \
  && apt install --assume-yes --no-install-recommends curl git \
  && apt clean \
  && rm --recursive --force /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  ;
RUN mkdir -p /opt/smalltalkci \
  && chown pharo:users /opt/smalltalkci -R \
  && chmod +w /opt/smalltalkci \
  ;

COPY --chown=pharo:users pharo-ci /opt/pharo/pharo-ci

ENTRYPOINT [ "/opt/pharo/pharo-ci" ]
