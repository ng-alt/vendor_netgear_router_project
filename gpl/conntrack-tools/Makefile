SUBDIRS += libnetfilter_cttimeout-1.0.0
SUBDIRS += libnetfilter_cthelper-1.0.0
SUBDIRS += conntrack-tools-1.4.0

CONNTRACK_DIR := $(shell pwd)
CONNTRACK_INSTALL := $(CONNTRACK_DIR)/build

LIBNETFILTER_CTTIMEOUT_DIR :=$(CONNTRACK_DIR)/libnetfilter_cttimeout-1.0.0
LIBNETFILTER_CTHELPER_DIR :=$(CONNTRACK_DIR)/libnetfilter_cthelper-1.0.0

CONNTRACK_TOOLS_DIR :=$(CONNTRACK_DIR)/conntrack-tools-1.4.0
CONNTRACK_CONFIGURE :=--prefix=$(CONNTRACK_INSTALL) --host=arm-linux CC=arm-brcm-linux-uclibcgnueabi-gcc host_alias=arm-linux  LIBNFNETLINK_CFLAGS=$(NFNETLINK_CFLAGS) LIBNFNETLINK_LIBS=$(NFNETLINK_LIBS) LIBNETFILTER_CONNTRACK_CFLAGS=$(NETFILTER_CONNTRACK_CFLAGS) LIBNETFILTER_CONNTRACK_LIBS=$(NETFILTER_CONNTRACK_LIBS) LIBNETFILTER_CTTIMEOUT_CFLAGS=-I$(CONNTRACK_INSTALL)/include LIBNETFILTER_CTTIMEOUT_LIBS="-L$(CONNTRACK_INSTALL)/lib -lnetfilter_cttimeout"  LIBNETFILTER_CTHELPER_CFLAGS=-I$(CONNTRACK_INSTALL)/include LIBNETFILTER_CTHELPER_LIBS="-L$(CONNTRACK_INSTALL)/lib -lnetfilter_cthelper" LIBNETFILTER_QUEUE_LIBS=$(NETFILTER_QUEUE_LIBS) LIBNETFILTER_QUEUE_CFLAGS=$(NETFILTER_QUEUE_CFLAGS) LIBMNL_CFLAGS=$(MNL_CFLAGS) LIBMNL_LIBS=$(MNL_LIBS)

all: 
	for i in ${SUBDIRS}; do \
		(cd $$i;./configure $(CONNTRACK_CONFIGURE);make;make install) || exit 1; \
	done
	
install:
	install -m 755 $(CONNTRACK_INSTALL)/lib/libnetfilter_cthelper.so.* $(TARGETDIR)/lib/
	install -m 755 $(CONNTRACK_INSTALL)/lib/libnetfilter_cttimeout.so.* $(TARGETDIR)/lib/
	install -m 755 $(CONNTRACK_INSTALL)/lib/libnetfilter_cthelper.la $(TARGETDIR)/lib/
	install -m 755 $(CONNTRACK_INSTALL)/lib/libnetfilter_cttimeout.la $(TARGETDIR)/lib/
	cp -a $(CONNTRACK_INSTALL)/lib/pkgconfig $(TARGETDIR)/lib/
	cp -a $(CONNTRACK_INSTALL)/lib/conntrack-tools $(TARGETDIR)/lib/
	install -m 755 $(CONNTRACK_INSTALL)/sbin/conntrack $(TARGETDIR)/sbin/

clean:
	for i in ${SUBDIRS}; do \
		(cd $$i; make clean); \
	done
	rm -rf ${CONNTRACK_INSTALL}
