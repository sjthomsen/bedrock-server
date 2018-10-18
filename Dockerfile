FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y unzip curl libcurl4 libssl1.0.0 && \
    curl https://minecraft.azureedge.net/bin-linux/bedrock-server-1.7.0.13.zip --output bedrock-server.zip && \
    unzip bedrock-server.zip -d bedrock-server && \
    rm bedrock-server.zip

RUN mkdir /bedrock-server/server.properties.dir && \
    rm /bedrock-server/server.properties && \
    ln -s /bedrock-server/server.properties.dir/server.properties /bedrock-server/server.properties

EXPOSE 19132/udp

VOLUME /bedrock-server/worlds /bedrock-server/server.properties.dir

WORKDIR /bedrock-server
ENV LD_LIBRARY_PATH=.
CMD ./bedrock_server
