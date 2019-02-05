FROM gcr.io/cloud-builders/curl AS download-env

RUN mkdir app && curl -s https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar --output /app/minecraft.jar

FROM gcr.io/distroless/java
COPY --from=download-env /app /app

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

CMD ["../app/minecraft.jar", "nogui"]
