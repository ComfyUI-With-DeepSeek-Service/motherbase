## Docker commands

### Update backend service
```shell
docker-compose down -v backend  && \
 docker-compose build --no-cache backend && \
 docker-compose up -d backend 
```