
docker image ls

echo "setup docker access below!"

sudo groupadd docker
sudo usermod -aG docker "$USER"
newgrp docker

echo "setup docker done!"
docker image ls

