gits to download, preferably at $HOME:

git clone https://chromium.googlesource.com/chromium/tools/depot_tools.git

git clone https://chromium.googlesource.com/external/naclports.git

wget http://storage.googleapis.com/nativeclient-mirror/nacl/nacl_sdk/nacl_sdk.zip ; unzip nacl_sdk.zip

Add on to .bashrc:

export PATH=/home/user/depot_tools:$PATH:/home/user/nacl_sdk/pepper_canary/tools:/home/user/naclports/build_tools

export NACL_SDK_ROOT=/home/user/nacl_sdk/pepper_canary

export TOOLCHAIN=glibc

This is a culmination of my current work on the NaCl port of the Retroarch Emulator, based on the work of the Retroarch community and the libretro-super script. It is nowhere near finished, and whatever cores are created need to be compiled as well. 

./retroarch-fetch.sh && nacl-env.sh ./retroarch-build.sh
