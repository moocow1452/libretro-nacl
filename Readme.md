Add on to .bashrc:


export PATH=/home/user/depot_tools:$PATH:/home/user/nacl_sdk/pepper_canary/tools:/home/user/naclports/build_tools
export NACL_SDK_ROOT=/home/user/nacl_sdk/pepper_canary
export TOOLCHAIN=glibc

This is a culmination of my current work on the NaCl port of the Retroarch Emulator. It is nowhere near finished, and whatever cores are created need to be compiled as well. 

./retroarch-fetch.sh && nacl-env.sh ./retroarch-build.sh