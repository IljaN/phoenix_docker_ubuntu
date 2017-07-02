FROM ubuntu
RUN apt-get update && \
   apt-get install -y libssl1.0.0 postgresql-client locales && \
   apt-get autoclean
RUN mkdir -p /app
ARG APP_NAME
ARG VERSION=0.0.1
COPY _build/prod/rel/${APP_NAME}/releases/${VERSION}/${APP_NAME}.tar.gz /app/${APP_NAME}.tar.gz
#COPY scripts/wait-for-postgres.sh /app/wait-for-postgres.sh
WORKDIR /app
RUN tar xvzf ${APP_NAME}.tar.gz
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV APP_NAME=$APP_NAME
ENV PORT 8888
CMD ["sh", "-c", "/app/bin/$APP_NAME foreground"]
