#
# Copyright 2005  Hon Hai Precision Ind. Co. Ltd.
#  All Rights Reserved.
# No porti

#For Compiler Option, add by Jasmine Yang, 03/27/2006
CONFIG_PPTP=y
#CONFIG_BPA=y
CONFIG_RIP=y
CONFIG_NEW_WANDETECT=y
CONFIG_SINGLE_PROCESS_PPPOE=y
MPOE_ENABLE_FLAG=y
CONFIG_STATIC_PPPOE=y

ifeq ($(PROFILE),R6300v2)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
#CONFIG_MTOOLS=y /* , makred by MJ., for 3400v2 downsizing., 2011.02.21.  */
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_KERNEL_2_6_36=y
endif


INCLUDE_IPV6_FLAG=y
#CONFIG_WGET=y