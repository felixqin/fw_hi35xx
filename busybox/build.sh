#!/bin/bash

THISDIR=`dirname $0`

cd ${THISDIR}

. module.env

CONFIGFILE=config_hisiv300
export ARCH=arm
export CROSS_COMPILE=arm-hisiv300-linux-


echo "build start ..."

echo "-------------------------------"
if [ ! -f ${MODULE_PACKAGE} ]; then
	echo "downloading ..."
	curl ${MODULE_URL} > ${MODULE_PACKAGE} || exit 2
fi

echo "-------------------------------"
if [ ! -d ${MODULE_SRCPATH} ]; then
	echo "unpack ..."
	tar jxvf ${MODULE_PACKAGE}
fi

cd ${MODULE_SRCPATH}
cp ../${CONFIGFILE} .config
make -j8 || exit 1
make install || exit 1

cd _install
tar zcf busybox.tar.gz *
mv busybox.tar.gz ../../

cd ../../
rm -fr ${MODULE_SRCPATH}

