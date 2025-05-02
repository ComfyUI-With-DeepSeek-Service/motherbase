## Docker commands

### Update backend service
```shell
docker-compose down -v backend  && \
 docker-compose build --no-cache backend && \
 docker-compose up -d backend 
```

### TODO

1) define deepseek model in envs, pass it to deepseek service, backend service
2) 