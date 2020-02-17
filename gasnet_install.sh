package_name=GASNet-2019.9.0-release
wget "https://gasnet.lbl.gov/EX/GASNet-2019.9.0.tar.gz"
tar -xf GASNet-2019.9.0.tar.gz
mv GASNet-2019.9.0 GASNet-2019.9.0-source
mkdir GASNet-2019.9.0-build
mkdir $package_name
gasnet_prefix=$(readlink -f $package_name)
cd GASNet-2019.9.0-source
cp other/contrib/cross-configure-cray-aries-slurm .
cd ../GASNet-2019.9.0-build
../GASNet-2019.9.0-source/cross-configure-cray-aries-slurm --prefix=$gasnet_prefix
make -j
make install
cd ..
rm -r GASNet-2019.9.0-build GASNet-2019.9.0-source GASNet-2019.9.0.tar.gz
