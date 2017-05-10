#***************************************************************************
#***
#***    Copyright 2016  Hon Hai Precision Ind. Co. Ltd.
#***    All Rights Reserved.
#***    No portions of this material shall be reproduced in any form without the
#***    written permission of Hon Hai Precision Ind. Co. Ltd.
#***
#***    All information contained in this document is Hon Hai Precision Ind.  
#***    Co. Ltd. company private, proprietary, and trade secret property and 
#***    are protected by international intellectual property laws and treaties.
#***
#****************************************************************************

include ../config.mk
include ../config.in

all:
	$(info build awsiot)
	make -C sample_apps/subscribe_publish_sample

install:
	install -d $(TARGETDIR)/sbin
	#install sample_apps/subscribe_publish_sample/subscribe_publish_sample $(TARGETDIR)/sbin
	#$(STRIP) $(TARGETDIR)/sbin/subscribe_publish_sample
	#install sample_apps/subscribe_publish_sample/awsiotpub $(TARGETDIR)/sbin
	#$(STRIP) $(TARGETDIR)/sbin/awsiotpub
	#install -d $(TARGETDIR)/certs
	#cp -f certs/aws-iot-rootCA.pem $(TARGETDIR)/certs/rootCA.pem
	#cp -f certs/96f0efb06e-certificate.pem $(TARGETDIR)/certs/certificate.pem
	#cp -f certs/96f0efb06e-private.pem $(TARGETDIR)/certs/private.pem
	
clean:
	#rm -f sample_apps/subscribe_publish_sample
	rm -f sample_apps/awsiotpub

