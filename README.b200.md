
## Install Docker without `sudo` (usually within another docker)
```
# if no sudo, you need to install docker as follows:
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

echo -e "\n[Docker Configuration]"
echo "Creating Docker daemon config to /path/to/your/docker_dir (large disk prefered)..."
mkdir -p /etc/docker # /path/to/your/docker_dir
cat <<EOF | tee /etc/docker/daemon.json
{
  "data-root": "/path/to/your/docker_dir",
  "storage-driver": "overlay2",
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
EOF

dockerd > /var/log/dockerd.log 2>&1 &
sleep 5

docker image ls
```

If you encounter permission errors `permission denied while trying to connect to the docker API at unix:///var/run/docker.sock`,
try to setup docker group
```
usermod -aG docker $USER
newgrp docker
```
If still does not work, try:
```
ls -l /var/run/docker.sock
# if socket permissions is not 666
chmod 666 /var/run/docker.sock
```

If still does not work, maybe you can change the storage-driver
```
mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
  "storage-driver": "vfs",
  "data-root": "/mnt/docker_dir"
}
EOF
```

If still does not work, ask help from Claude Sonnet/Opus 4.5
