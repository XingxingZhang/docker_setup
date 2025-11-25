
mkdir -p /etc/docker
cat > /etc/docker/daemon.json <<EOF
{
  "storage-driver": "vfs",
  "data-root": "/mnt/docker_dir"
}
EOF
