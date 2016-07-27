
THISDIR=`dirname $0`
PACKAGE=linux-3.4.y

cd ${THISDIR}

tar zxvf ${PACKAGE}.tgz

cd ${PACKAGE}

cp ../xa3516a_full_config  .config
make -j8 ARCH=arm CROSS_COMPILE=arm-hisiv300-linux- uImage

cp arch/arm/boot/uImage ../
cd ..
rm -fr ${PACKAGE}


