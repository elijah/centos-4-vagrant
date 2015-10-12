# Makefile for centos-4-vagrant box and the docker image we want to produce from it.
default: clean packerbuild tarball export  

packerbuild: packer.json
		packer build packer.json

export: 
		vagrant ssh -c 'scp centos4-base.tar.gz elw@192.168.1.124:/Users/elw/'

addbox:  vagrant box add centos4.7-x86_64.box --name centos4.7-x86_64

tarball: centos4-base.tar.gz
    vagrant ssh -c 'tar --numeric-owner --exclude=/proc --exclude=/sys -cvf centos6-base.tar /'

clean:
		-rm -f centos4-base.tar.gz
		-rm -f centos4.7-x86_64.box
