# GCP Spanner Emulator for Local Development

### Build the Docker image:
- `docker build . -t gcp-spanner-emulator:latest`

### Run:
- `docker run -p 9010:9010 gcp-spanner-emulator:latest`

### Test connection with curl:
- test with curl: `http://localhost:9010` or `0.0.0.0:9010`
- Host and ports can be passed as part of building the image

### Clean up build stage image:
- `docker image prune --filter label=stage=builder`

### Build arm image
```bash
docker buildx build --platform linux/arm64 -t terzakes/gcp-spanner-emulator:latest --push .
```

### Build multi-arch images
```bash
docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t terzakes/gcp-spanner-emulator:latest --push .
```