
# this script aims to redirect docker images to a specific location (e.g., /mnt/docker)
# you need this when your / storage is small
# /dev/root       124G   38G   87G  31% /


new_data_root=${1:-'/mnt/docker'}
# make sure your new_data_root exists
# sudo mkdir /mnt/docker
# sudo chmod 777 /mnt/docker/ -R

echo ${new_data_root}


# stop your docker
sudo systemctl stop docker

# uncomment and run (better stepwise)
# move your docker data to the new location
# sudo rsync -axPS /var/lib/docker/ ${new_data_root}

# uncomment and run (better stepwise)
# cp /etc/docker/daemon.json daemon.bak.json
# sudo python3 add_data_root.py /etc/docker/daemon.json ${new_data_root}
echo "this is the new docker daemon"
cat /etc/docker/daemon.json

# uncomment and run (better stepwise)
# sudo mv /var/lib/docker /var/lib/docker.bak

sudo systemctl start docker

echo "double check new docker root dir"
sudo docker info | grep "Docker Root Dir"

docker image ls
sudo du -sh ${new_data_root}




