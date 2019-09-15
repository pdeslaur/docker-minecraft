FROM gcr.io/cloud-builders/curl AS download-env

RUN mkdir app && curl -s https://launcher.mojang.com/v1/objects/2f0ec8efddd2f2c674c77be9ddb370b727dec676/server.jar --output /app/minecraft.jar

FROM gcr.io/distroless/java
COPY --from=download-env /app /app

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

CMD ["../app/minecraft.jar", "nogui"]
