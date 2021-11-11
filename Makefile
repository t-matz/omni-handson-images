DOCKER_IMAGE_OWNER = 'omnijp'
DOCKER_IMAGE_NAME = 'free5gc-base'
DOCKER_IMAGE_TAG = 'latest'

GTP5G_INSTALLER_IMAGE = 'gtp5g_installer'
GTP5G_INSTALLER_TAG = 'latest'

UERANSIM_IMAGE = 'docker_ueransim'
UERANSIM_TAG = 'latest'

.PHONY: build base gtp5g_installer ueransim
base:
	docker build -t ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} ./base
	docker image ls ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}


gtp5g_installer:
	docker build -t ${DOCKER_IMAGE_OWNER}/${GTP5G_INSTALLER_IMAGE}:${GTP5G_INSTALLER_TAG} ./gtp5g_installer
	docker image ls ${DOCKER_IMAGE_OWNER}/${GTP5G_INSTALLER_IMAGE}:${GTP5G_INSTALLER_TAG}

ueransim:
	docker build -t ${DOCKER_IMAGE_OWNER}/${UERANSIM_IMAGE}:${UERANSIM_TAG} ./ueransim 
	docker image ls  ${DOCKER_IMAGE_OWNER}/${UERANSIM_IMAGE}:${UERANSIM_TAG}

build-%: nf_%/
	docker build -t ${DOCKER_IMAGE_OWNER}/free5gc-$* ./nf_$*

build-nfs: build-amf build-smf build-ausf build-n3iwf build-nrf build-pcf build-udm build-udr build-upf build-webui build-nssf

build:  base gtp5g_installer ueransim build-nfs

push-%: nf_%/
	docker push ${DOCKER_IMAGE_OWNER}/free5gc-$*

push-nfs: push-amf push-smf push-ausf push-n3iwf push-nrf push-pcf push-udm push-udr push-upf push-webui push-nssf

push-base:
	docker push ${DOCKER_IMAGE_OWNER}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}

push-installer:
	docker push ${DOCKER_IMAGE_OWNER}/${GTP5G_INSTALLER_IMAGE}:${GTP5G_INSTALLER_TAG}

push-ueransim:
	docker push ${DOCKER_IMAGE_OWNER}/${UERANSIM_IMAGE}:${UERANSIM_TAG}

push: push-base push-installer push-ueransim push-nfs
	
