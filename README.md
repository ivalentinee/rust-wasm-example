# Rust wasm example

## Build environment
- `docker-compose up -d`

## Build
- `docker-compose exec app make`

## Run
### Server
- `docker-compose exec app node out/nodejs/test.js`

### Browser
- Go to [localhost:8000](http://localhost:8000)
- Output will be in browser console
