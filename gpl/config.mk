#
# Copyright 2005  Hon Hai Precision Ind. Co. Ltd.
#  All Rights Reserved.
# No porti

#For Compiler Option, add by Jasmine Yang, 03/27/2006
CONFIG_PPTP=y
#CONFIG_BPA=y
CONFIG_RIP=y
CONFIG_NEW_WANDETECT=y
#Foxconn added by Max Ding, 11/25/2008 for multi_language, use pppoe2
CONFIG_SINGLE_PROCESS_PPPOE=y
MPOE_ENABLE_FLAG=y
CONFIG_STATIC_PPPOE=y

ifeq ($(PROFILE),R7000)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
#CONFIG_MTOOLS=y /* Foxconn, makred by MJ., for 3400v2 downsizing., 2011.02.21.  */
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_ISERVER=y
CONFIG_TIMEMACHINE=y
CONFIG_KERNEL_2_6_36=y
CONFIG_OPENVPN=y
CONFIG_TCPDUMP=y
endif

ifeq ($(PROFILE),R6400)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
#CONFIG_MTOOLS=y /* Foxconn, makred by MJ., for 3400v2 downsizing., 2011.02.21.  */
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_ISERVER=y
CONFIG_TIMEMACHINE=y
CONFIG_KERNEL_2_6_36=y
CONFIG_OPENVPN=y
CONFIG_TCPDUMP=y
CONFIG_DOWNLOADER=y
endif

ifeq ($(PROFILE),R6700)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
#CONFIG_MTOOLS=y /* Foxconn, makred by MJ., for 3400v2 downsizing., 2011.02.21.  */
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_ISERVER=y
CONFIG_TIMEMACHINE=y
CONFIG_KERNEL_2_6_36=y
CONFIG_OPENVPN=y
CONFIG_TCPDUMP=y
endif

ifeq ($(PROFILE),R6300v2)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
#CONFIG_MTOOLS=y /* Foxconn, makred by MJ., for 3400v2 downsizing., 2011.02.21.  */
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_KERNEL_2_6_36=y
endif

ifeq ($(PROFILE),R6250)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_KERNEL_2_6_36=y
endif

ifeq ($(PROFILE),R6200v2)
SAMBA_ENABLE_FLAG=y
CONFIG_NTFS_3G=n
FTP_ACCESS_USB_FLAG=y
CONFIG_DLNA=y
CONFIG_L2TP=y
CONFIG_IGMP_PROXY=y
CONFIG_KERNEL_2_6_36=y
endif

INCLUDE_IPV6_FLAG=y
CONFIG_WGET=y
#Foxconn added by Kathy, 04/03/2014 @ xAgent_cloud
CONFIG_CLOUD_XAGENT_CONF=y

# 6rd support
IPV6RD_ENABLE_FLAG=y

# Foxconn Perry added, 11/19/2014, for Facebook WiFi debug
CONFIG_FBWIFI_DEBUG=n

CONFIG_BT_IGMP=y