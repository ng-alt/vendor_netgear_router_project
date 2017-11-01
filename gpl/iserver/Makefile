HOST=arm-linux
SRC_PATH=$(shell pwd)
HOST_COMPILE=$(HOST)-
TOOL_CHAIN_PATH=$(TOOLCHAIN)
export SRC_PATH

PKG_CONFIG_PATH=$(SRC_PATH)/build/usr/lib/pkgconfig
export PKG_CONFIG_PATH
PKG_CONFIG_LIBDIR=$(SRC_PATH)/build/usr/lib/pkgconfig
export PKG_CONFIG_LIBDIR
PKG_INSTall_DIR =$(SRC_PATH)/build
DESTDIR = $(PKG_INSTall_DIR)
export DESTDIR
LDFLAGS += -L$(SRC_PATH)/build/usr/lib
CFLAGS += -I$(SRC_PATH)/build/usr/include
CPPFLAGS += -I$(SRC_PATH)/build/usr/include

export LDFLAGS
export CFLAGS
export CPPFLAGS
PATH := $(PKG_INSTALL_DIR)/usr/lib:$(PATH)
export PATH

#SUBDIRS2 += forked-daapd-0.19

SUBDIRS += zlib-1.2.7
SUBDIRS += confuse-2.7
SUBDIRS += libiconv-1.10
SUBDIRS += tre-0.8.0
SUBDIRS += libantlr3c-3.2
SUBDIRS += libgpg-error-1.10
#SUBDIRS += gperf-3.0.4
SUBDIRS += sqlite-3.6.22
SUBDIRS += libgcrypt-1.5.0
SUBDIRS += mxml-2.7
#SUBDIRS += libevent-1.4.14b-stable
SUBDIRS += avl-0.3.5
SUBDIRS += libunistring-0.9.3
SUBDIRS += alsa-lib-1.0.26
#SUBDIRS += libav-0.8.8
SUBDIRS += libdaemon-0.14
SUBDIRS += expat-2.0.1
SUBDIRS += gdbm-1.8.3
SUBDIRS += dbus-1.6.8
SUBDIRS += avahi-0.6.25
#SUBDIRS += libkqueue-1.0.6 
#SUBDIRS += forked-daapd-0.19

#SUBDIRS2 = dbus-1.6.8
SUBDIRS3 = avahi-0.6.25
#SUBDIRS4 = forked-daapd-0.19
SUBDIRS6 = sqlite-3.6.22
SUBDIRS6 = libiconv-1.10
SUBDIRS6 = libunistring-0.9.3
#SUBDIRS6 = libevent-1.4.14b-stable
SUBDIRS5 = alsa-lib-1.0.26

# Foxconn added pling 06/20/2016, for new forked-daapd
# libav-0.8.8 is too old for the new forked-daapd, use ffmpeg 2.3.4 from DLNA
# libevent also need to be updated to support new forked-daapd
LIBAVDIR = $(SRC_PATH)/../minidlna/lib
LIBAVINCLUDEDIR = $(SRC_PATH)/../minidlna/ffmpeg-2.3.4
LIBEVENTDIR = libevent-2.0.22-stable
FORKEDDAAPDDIR = ejurgensen-forked-daapd

all:
	test -d "$(TARGETDIR)" ||  mkdir  "$(TARGETDIR)" 
	test -d "$(TARGETDIR)/usr" ||  mkdir  "$(TARGETDIR)/usr" 
	test -d "$(TARGETDIR)/usr/bin" ||  mkdir  "$(TARGETDIR)/usr/bin" 
	for i in ${SUBDIRS}; do \
		(cd $$i; make && make install) || exit 1; \
	done
	#$(STRIP) $(SRC_PATH)/forked-daapd-0.19/src/forked-daapd; \
	#install -m 755 $(SRC_PATH)/forked-daapd-0.19/src/forked-daapd $(TARGETDIR)/usr/bin
	make libevent ;
	make forked ;
	$(STRIP) $(SRC_PATH)/$(FORKEDDAAPDDIR)/src/forked-daapd; \
	install -m 755 $(SRC_PATH)/$(FORKEDDAAPDDIR)/src/forked-daapd $(TARGETDIR)/usr/bin
	install -m 755 $(SRC_PATH)/$(FORKEDDAAPDDIR)/forked-daapd.conf $(TARGETDIR)/etc
	install -m 755 $(SRC_PATH)/$(FORKEDDAAPDDIR)/sqlext/.libs/forked-daapd-sqlext.so $(TARGETDIR)/usr/lib
	install -m 755 $(SRC_PATH)/start_forked-daapd.sh $(TARGETDIR)/usr/bin

libevent:
	[ -f $(SRC_PATH)/$(LIBEVENTDIR)/config.log ] || \
	(cd $(SRC_PATH)/$(LIBEVENTDIR); \
		./configure --host=arm-linux --prefix=/usr CC=arm-brcm-linux-uclibcgnueabi-gcc RANLIB=arm-brcm-linux-uclibcgnueabi-ranlib --enable-shared CFLAGS="-I$(SRC_PATH)/build/usr/include" LDFLAGS="-L$(SRC_PATH)/build/usr/include" ; ) && \
	cd $(SRC_PATH)/$(LIBEVENTDIR); make && make install

forked:
	[ -f $(SRC_PATH)/$(FORKEDDAAPDDIR)/config.log ] || \
	(export CC=arm-brcm-linux-uclibcgnueabi-gcc ; \
	export CPP="arm-brcm-linux-uclibcgnueabi-gcc -E " ; \
	export AR=arm-brcm-linux-uclibcgnueabi-ar; \
	export LD=arm-brcm-linux-uclibcgnueabi-ld ; \
	export LD_LIBRARY_PATH=$(SRC_PATH)/build/usr/lib ; \
	export LD_RUN_PATH=$(SRC_PATH)/build/usr/lib ; \
	export AM_PATH_LIBGCRYPT=$(SRC_PATH)/build/usr/lib ; \
	export AM_PATH_GPG_ERROR=$(SRC_PATH)/build/usr/lib ; \
	export AVAHI_CFLAGS="-I$(SRC_PATH)/build/usr/include" &&  \
	export AVAHI_LIBS="-L$(SRC_PATH)/build/usr/lib -lavahi-common -lavahi-client" && \
	export PKG_CONFIG_PATH=$(SRC_PATH)/build/usr/lib/pkgconfig ; \
	export PKG_CONFIG_LIBDIR=$(SRC_PATH)/build/usr/lib/pkgconfig ; \
	export hardcode_minus_L="no" ; \
	export ACLOCAL="aclocal -I$(SRC_PATH)/libgcrypt-1.5.0/src -I$(SRC_PATH)/libgpg-error-1.10/src -Im4 -I$(SRC_PATH)/libiconv-1.10/ -I$(SRC_PATH)/libiconv-1.10/libcharset -I$(SRC_PATH)/libiconv-1.10/m4 -I$(SRC_PATH)/libevent-2.0.22-stable -I$(SRC_PATH)/libevent-2.0.22-stable/m4 -I$(SRC_PATH)/avahi-0.6.25/ -I$(SRC_PATH)/avahi-0.6.25/common -I/usr/share/aclocal/" ; \
	export AUTOCONF="autoconf -i -B$(SRC_PATH)/build/usr/lib -I$(SRC_PATH)/build/usr/lib/pkgconfig" ; \
	cd $(SRC_PATH)/$(FORKEDDAAPDDIR) && \
	aclocal -I$(SRC_PATH)/libgcrypt-1.5.0/src -I$(SRC_PATH)/libgpg-error-1.10/src -Im4 -I$(SRC_PATH)/libiconv-1.10/ -I$(SRC_PATH)/libiconv-1.10/libcharset -I$(SRC_PATH)/libiconv-1.10/m4 -I$(SRC_PATH)/libevent-2.0.22-stable -I$(SRC_PATH)/libevent-2.0.22-stable/m4 -I$(SRC_PATH)/avahi-0.6.25/ -I$(SRC_PATH)/avahi-0.6.25/common -I/usr/share/aclocal/ && \
	autoreconf -i -B$(SRC_PATH)/build/usr/lib -I$(SRC_PATH)/build/usr/lib/pkgconfig  && \
	./configure --host=arm-linux-gnu --build=i386 --enable-shared --localstatedir=/var --prefix=/usr ZLIB_CFLAGS="-I$(SRC_PATH)/zlib-1.2.7" ZLIB_LIBS="-lz" CFLAGS="-I$(SRC_PATH)/build/usr/include -I$(LIBAVINCLUDEDIR)" CPPFLAGS="-I$(SRC_PATH)/build/usr/include" LDFLAGS="-L$(SRC_PATH)/build/usr/lib -liconv -lunistring" LIBS="-L$(LIBAVDIR) -lavdevice -lavfilter -lavcodec -lswresample -lswscale -lavutil -lavformat" SQLITE3_CFLAGS="-I$(SRC_PATH)/build/usr/include" SQLITE3_LIBS="-L$(SRC_PATH)/build/usr/lib -lsqlite3" LIBEVENT_CFLAGS="-I$(SRC_PATH)/build/usr/include" LIBEVENT_LIBS="-L$(SRC_PATH)/build/usr/lib -levent -levent_core -levent_pthreads -levent_extra" AVAHI_CFLAGS="-I$(SRC_PATH)/avahi-0.6.25/include" AVAHI_LDFLAGS="-L$(SRC_PATH)/build/usr/lib -lavahi-common -lavahi-client" LIBAV_CFLAGS="-I$(LIBAVDIR)" LIBAV_LIBS="-L$(LIBAVDIR) -lavdevice -lavfilter -lavcodec -lswresample -lswscale -lavutil -lavformat" MINIXML_CFLAGS="-I$(SRC_PATH)/build/usr/include" MINIXML_LIBS="-L$(SRC_PATH)/build/usr/lib -lmxml" CONFUSE_CFLAGS="-I$(SRC_PATH)/build/usr/include" CONFUSE_LIBS="-L$(SRC_PATH)/build/usr/lib -lconfuse" ALSA_CFLAGS="-I$(SRC_PATH)/build/usr/include/alsa" ALSA_LIBS="-L$(SRC_PATH)/build/usr/lib -lasound" && \
	sed -e "s/hardcode_minus_L=/hardcode_minus_L=no/g" libtool >libtool.sed && \
	mv libtool.sed libtool ) && \
	cd $(SRC_PATH)/build/usr/lib && \
	(if grep -q " \/usr\/lib" libavahi-client.la ; then \
		sed -e "s# /usr/lib# $(SRC_PATH)/build/usr/lib#g" libavahi-client.la > libavahi-client.la.sed ; \
		mv libavahi-client.la.sed libavahi-client.la ; \
	fi) && \
	(if grep -q " \/usr\/lib" libunistring.la ; then \
		sed -e "s# /usr/lib# $(SRC_PATH)/build/usr/lib#g" libunistring.la > libunistring.la.sed ; \
		mv libunistring.la.sed libunistring.la ; \
	fi) && \
	cd $(SRC_PATH)/$(FORKEDDAAPDDIR) && make 

#sqlite:
#	for i in ${SUBDIRS6}; do \
#		(cd $$i; make && make install) || exit 1; \
#	done

#daapd:
#	for i in ${SUBDIRS}; do \
#		(cd $$i; make && make install) || exit 1; \
#	done
#dbus:
#	for i in ${SUBDIRS2}; do \
#		(cd $$i; make && make install) || exit 1; \
#	done

#	cd sqlite-3.6.22; \
	make CFLAGS="-DSQLITE_ENABLE_UNLOCK_NOTIFY";\
	 --includedir=$(DESTDIR) --libdir=$(DESTDImake install
#	./configure --host=$(HOST) CFLAGS=-Os --enable-threadsafe --prefix=/usr;\
	make CFLAGS="-DSQLITE_ENABLE_UNLOCK_NOTIFY";\
	make install
#	cd mxml-2.7; \
	make && make install-libmxml.so.1.5
	touch .conf
make_iserver:
#ifeq ($(PROFILE),WNDR3400)
	cp config_WNDR3400.h source/include/config.h
#endif
	cd source ; make

clean: 

	echo "$(PATH)"
	for i in ${SUBDIRS}; do \
		(cd $$i; make clean) || exit 1; \
	done
	rm -r ./build/*
	
cleansmb: 
	

distclean:
	rm -rf .conf
	cd source ; make distclean

install:
	$(STRIP)  $(SRC_PATH)/build/usr/lib/*.so 
	$(STRIP)  $(SRC_PATH)/build/usr/lib/*.so.*
	install -m 755 $(SRC_PATH)/build/usr/lib/*.so  $(TARGETDIR)/lib/
	cp /projects/hnd/tools/linux/hndtools-arm-linux-2.6.36-uclibc-4.5.3/lib/librt* $(TARGETDIR)/lib


		
