include ../config.mk
include ../config.in

MODULE_INSTALL_DIR=$(TARGETDIR)/lib/modules/2.6.36.4brcmarm+/kernel/drivers/net/ipset
SHARED_LIBRARY_INSTALL_DIR=$(TARGETDIR)/lib
BIN_INSTALL_DIR=$(TARGETDIR)/bin
OPT_INSTALL_DIR=$(TARGETDIR)/opt/circle
CROSS_COMPILER = arm-brcm-linux-uclibcgnueabi-
KERNELPATH := $(SRCBASE)/../components/opensource/linux/linux-2.6.36
PWD = $(shell pwd)
IPSET_MODULE_DIR = $(PWD)/ipset-6.30/kernel/net/netfilter/ipset
XT_SET_MODULE_DIR = $(PWD)/ipset-6.30/kernel/net/netfilter
IPSET_SHARED_OBJECT_DIR = $(PWD)/ipset-6.30/lib/.libs

SUBDIRS = libmnl
SUBDIRS2 = ipset-6.30

all:
	make libmnl_config;
	for i in $(SUBDIRS); do \
		(cd $$i; make) || exit 1; \
	done
	make ipset_config;
	for i in $(SUBDIRS2); do \
		(cd $$i; make modules;make) || exit 1; \
	done

config: libmnl_config ipset_config

libmnl_config:
	if [ ! -f ./libmnl/config.log ];then \
		cd libmnl && ./autogen.sh &&  $(CONFIGURE) CC=$(CROSS_COMPILER)gcc; \
	fi

ipset_config:
	cd ipset-6.30 && autoconf && $(CONFIGURE) CFLAGS="-I$(SRCBASE)/../ap/gpl/circle/libmnl/include -lmnl -L$(SRCBASE)/../ap/gpl/circle/libmnl/src/.libs" CC=$(CROSS_COMPILER)gcc --host=arm-linux --with-kbuild=$(KERNELPATH) libmnl_CFLAGS="-I$(SRCBASE)/../ap/gpl/circle/libmnl/include" libmnl_LIBS="-lmnl -L$(SRCBASE)/../ap/gpl/circle/libmnl/src/.libs";  

#all: config
	

install:
	install -d $(MODULE_INSTALL_DIR)
	install -d $(BIN_INSTALL_DIR)
	install -d $(OPT_INSTALL_DIR)
	cp -r -f $(PWD)/ipset-6.30/src/ipset $(BIN_INSTALL_DIR)
	cp -r -f $(PWD)/libmnl/src/.libs/libmnl.so* $(SHARED_LIBRARY_INSTALL_DIR)
	cp -r -f $(IPSET_MODULE_DIR)/*.ko $(MODULE_INSTALL_DIR)
	cp -r -f $(XT_SET_MODULE_DIR)/*.ko $(MODULE_INSTALL_DIR)
	cp -r -f $(IPSET_SHARED_OBJECT_DIR)/*.so $(SHARED_LIBRARY_INSTALL_DIR)



