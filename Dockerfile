FROM gcr.io/cloud-builders/curl AS download-env

RUN mkdir app && curl -s https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar --output /app/minecraft.jar

FROM gcr.io/distroless/java
COPY --from=download-env /app /app

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

CMD ["../app/minecraft.jar", "nogui"]
