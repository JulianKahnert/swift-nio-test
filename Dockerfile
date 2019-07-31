FROM swift:5.0.2

EXPOSE 8888
WORKDIR /app

COPY ./swift-nio /app

RUN apt-get -qq update && apt-get install -y \
    libicu60 libxml2 libbsd0 libcurl4 libatomic1 tzdata \
    && rm -r /var/lib/apt/lists/*

RUN cd /app/Sources
RUN swift build -c release && mv `swift build -c release --show-bin-path` /app

ENTRYPOINT /app/release/NIOHTTP1Server 0.0.0.0 8080
