all:
	@echo usage: make {task}

.PHONY: docker-vm

docker-vm:
	docker context use default
	cd linuxkit && linuxkit build -disable-content-trust -format iso-efi docker-vm.yml

.PHONY: tt-tss

tt-rss:
	docker context use server
	cd app/tt-rss && docker-compose -c server up -d
	docker context use default
