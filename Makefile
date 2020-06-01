ifneq (${KERNELRELEASE},)

	obj-m  = mon_premier_driver.o
else

	KERNELDIR        ?= /lib/modules/$(shell uname -r)/build
	MODULE_DIR       ?= $(shell pwd)
	ARCH             ?=
	CROSS_COMPILE    ?=
	INSTALL_MOD_PATH ?= /

all: modules

modules:
	export ARCH=$(ARCH)
	export CROSS_COMPILE=$(CROSS_COMPILE)
	${MAKE} -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules
	
modules_install:
	export ARCH=$(ARCH)
	export CROSS_COMPILE=$(CROSS_COMPILE)
	${MAKE} INSTALL_MOD_PATH=${INSTALL_MOD_PATH} -C ${KERNELDIR} SUBDIRS=${MODULE_DIR}  modules_install

clean:
	rm -f *.o *.ko *.mod.c .*.o .*.ko .*.mod.c .*.cmd *~
	rm -f Module.symvers Module.markers modules.order
	rm -rf .tmp_versions
endif
