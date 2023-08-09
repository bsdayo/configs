[https://rclone.org/install/#docker](https://rclone.org/install/#docker)

```shell
# add a remote interactively
docker run --rm -it \
    -v ./config:/config/rclone \
    rclone/rclone \
    config

# make sure the config is ok by listing the remotes
docker run --rm \
    -v ./config:/config/rclone \
    rclone/rclone \
    listremotes
```
