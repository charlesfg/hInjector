set -xe

#./configure --libdir=/usr/lib64
sudo make clean 
sudo make xen
set +e
sudo make tools
sudo make stubdom
set -e
sudo make install-xen
set +e
sudo make install-tools PYTHON_PREFIX_ARG=--install-layout=deb
#PYTHON_PREFIX_ARG=--install-layout=deb era preciso por causa de um bug relacionado com o Python em Debian.
sudo make install-stubdom
set -e
cd dist/
sudo ./install.sh
sudo /sbin/ldconfig
cd -
set +x
echo "---------------------------------------------------------"
echo "                          !!!DONE!!!                     "
echo "---------------------------------------------------------"
