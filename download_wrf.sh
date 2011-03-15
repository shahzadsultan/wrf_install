#!/bin/bash
#Settings
INSTALL_PATH=/opt/wrf
mkdir -p $INSTALL_PATH/src
cd $INSTALL_PATH/src
ENV=$INSTALL_PATH/src/wrf.env
echo 'export INSTALL_PATH='$INSTALL_PATH > $ENV
CLEAN_DOWN=$INSTALL_PATH/src/wrf_clean_downloads.sh
echo '#!/bin/bash' > $CLEAN_DOWN
chmod +x $CLEAN_DOWN
CLEAN_SRC=$INSTALL_PATH/src/wrf_clean_source.sh
echo '#!/bin/bash' > $CLEAN_SRC
chmod +x $CLEAN_SRC

#JASPER
APP=jasper-1.900.1
EXT=zip
echo 'export JASPER='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://www.ece.uvic.ca/~mdadams/jasper/software/${APP}.${EXT}
unzip ${APP}.${EXT}
echo rm -rf ${APP} >> $CLEAN_SRC

#JPEG
APP=jpegsrc.v8c
EXT=tar.gz
echo 'export JPEG='$APP >> $ENV
chmod +x $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://www.ijg.org/files/${APP}.${EXT}
tar zxf ${APP}.${EXT}
echo rm -rf jpeg-8c >> $CLEAN_SRC

# ZLIB
APP=zlib-1.2.5
EXT=tar.gz
echo 'export ZLIB='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://zlib.net/${APP}.tar.gz
tar zxf ${APP}.${EXT}
echo rm -rf ${APP} >> $CLEAN_SRC

# HDF5
APP=hdf5-1.8.6
EXT=tar.gz
echo 'export HDF5='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://www.hdfgroup.org/ftp/HDF5/${APP}/src/${APP}.${EXT}
tar xzf ${APP}.${EXT}
echo rm -rf ${APP} >> $CLEAN_SRC

# NetCDF4
APP=netcdf-4.1.1
EXT=tar.gz
echo 'export NETCDF4='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c ftp://ftp.unidata.ucar.edu/pub/netcdf/${APP}.${EXT}
tar xzf ${APP}.${EXT}
echo rm -rf ${APP} >> $CLEAN_SRC

# WRF
APP=WRFV3.2.1
EXT=TAR.gz
WRF_PATH=$INSTALL_PATH/$APP
echo 'export WRF='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://www.mmm.ucar.edu/wrf/src/${APP}.${EXT}
tar xzf ${APP}.${EXT}
echo rm -rf WRFV3 >> $CLEAN_SRC

# WPS
APP=WPSV3.2.1
EXT=TAR.gz
WPS_PATH=$INSTALL_PATH/$APP
echo 'export WPS='$APP >> $ENV
echo rm ${APP}.${EXT} >> $CLEAN_DOWN
cd $INSTALL_PATH/src
wget -c http://www.mmm.ucar.edu/wrf/src/${APP}.${EXT}
tar xzf ${APP}.${EXT}
echo rm -rf WPS >> $CLEAN_SRC

echo export INTEL_COMPILER_TOPDIR=/opt/intel/Compiler/11.1/072/ >> $ENV
