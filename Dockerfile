FROM gcr.io/cloud-builders/curl AS download-env
RUN mkdir app && curl http://assets.minecraft.net/1_5_2/minecraft_server.jar --output /app/minecraft.jar

FROM gcr.io/distroless/java
COPY --from=download-env /app/minecraft.jar /app/minecraft.jar

VOLUME ["/data"]
WORKDIR /data

EXPOSE 25565

CMD ["../app/minecraft.jar", "nogui"]
