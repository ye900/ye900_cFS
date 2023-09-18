# Init Setting
sudo apt install git
sudo apt install make
sudo apt install gcc
sudo apt install cmake
sudo apt install g++

# 파일 생성
mkdir ye900_src
cd ye900_src

# WiringPi install
git clone https://github.com/WiringPi/WiringPi.git
cd WiringPi
./build
gpio -v

# I2C Setting
lsmod | grep i2c
sudo modprobe i2c-dev
sudo usermod -aG i2c 사용자_이름
sudo raspi-config
->interface option ->i2c ->ok

# cFS install
git clone https://github.com/nasa/cFS.git
cd cFS
git submodule init
git submodule update

cp cfe/cmake/Makefile.sample Makefile
cp -r cfe/cmake/sample_defs sample_defs

make SIMULATION=native prep
make
make install
cd build/exe/cpu1/
./core-cpu1
