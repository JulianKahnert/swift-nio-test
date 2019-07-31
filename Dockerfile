FROM swift:5.0.2

EXPOSE 8888
WORKDIR /app

COPY ./swift-nio /app

RUN apt-get -qq update && apt-get install -y \
    libicu60 libxml2 libbsd0 libcurl4 libatomic1 tzdata \
    && rm -r /var/lib/apt/lists/*

RUN cd /app/Sources
RUN swift package resolve
#RUN swift build

#RUN mkdir -p /build/lib && cp -R /usr/lib/swift/linux/*.so /build/lib
RUN swift build -c release && mv `swift build -c release --show-bin-path` /app

#CMD swift run NIOHTTP1Server
#ENTRYPOINT ./Run serve -e prod -b 0.0.0.0

RUN ls -lah /app/release
ENTRYPOINT /app/release/NIOHTTP1Server 0.0.0.0 8080
