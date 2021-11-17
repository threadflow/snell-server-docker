# snell-server-docker

Docker image for [snell-server](https://github.com/surge-networks/snell)

```bash
docker run -e PSK=<your_psk_here> -p <your_host_port_here>:9102 --restart unless-stopped -d <image>
```

The default `OBFS` setting is `tls`, you can switch it to `http` by adding `-e OBFS=http` to the docker run args.
