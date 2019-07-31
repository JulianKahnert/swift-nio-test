# Usage

```bash
# build
docker build -t swift-nio-test .

# run
docker run --publish 8080:8080 swift-nio-test

```

## Paths

The server has the following endpoints:

- `/`: serves "Hello world!"
- `/sendfile/*`: serves the file at path `*` to the client, using `sendfile`.
- `/fileio/*`: serves the file at path `*` to the client by reading the file in to memory in chunks.
- `/dynamic/echo`: Echoes the request body back to the client.
- `/dynamic/echo_balloon`: Echoes the request body back to the client after buffering it entirely in memory first.
- `/dynamic/pid`: Echoes pack the PID of the server.
- `/dynamic/write-delay`: Echoes "Hello world" after a 100ms delay.
- `/dynamic/info`: Sends information about the received request.
- `/dynamic/trailers`: Sends the PID along with some HTTP trailers.
- `/dynamic/continuous`: Sends a chunked body forever.
- `/dynamic/count-to-ten`: Sends the numbers 1 through 10 in separate chunks.
- `/dynamic/client-ip`: Sends what the server believes the client IP is.
