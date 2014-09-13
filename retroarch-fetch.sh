#!/bin/bash

. ./libretro-config.sh

# Keep three copies so we don't have to rebuild stuff all the time.
fetch_project_bsnes()
{
   echo "=== Fetching $3 ==="
   if [ -d "$2/.git" ]; then
      cd "$2"
      git pull
      cd ..
   else
      git clone $1 "$2"
   fi

   if [ -d "$2" ]; then
      cd "$2"

      if [ -d "perf/.git" ]; then
         cd perf
         git pull ..
         cd ..
      else
         git clone . perf
      fi

      if [ -d "balanced/.git" ]; then
         cd balanced
         git pull ..
         cd ..
      else
         git clone . balanced
      fi

      cd ..
   fi
}

fetch_project()
{
   echo "=== Fetching $3 ==="
   if [ -d "$2/.git" ]; then
      cd "$2"
      git pull
      cd ..
   else
      git clone "$1" "$2"
   fi
   echo "=== Fetched ==="
}

fetch_subprojects()
{
   echo "=== Fetching $5 ==="
   cd "$2"
   cd "$3"
   if [ -d "$4/.git" ]; then
      cd "$4"
      git pull
      git submodule foreach git pull origin master
      cd ..
   else
      git clone "$1" "$4"
   fi
   cd ..
   cd ..
   echo "=== Fetched ==="
}

fetch_project_submodule()
{
   echo "=== Fetching $3 ==="
   if [ -d "$2/.git" ]; then
      cd "$2"
      git pull
      git submodule foreach git pull origin master
      cd ..
   else
      git clone "$1" "$2"
      cd "$2"
      git submodule update --init
      cd ..
   fi
   echo "=== Fetched ==="
}

if [ -z $WRITERIGHTS ]; then
   REPO_BASE="https://github.com"
else
   REPO_BASE="git://github.com"
fi

fetch_project "$REPO_BASE/libretro/RetroArch.git" "retroarch" "libretro/RetroArch"
fetch_subprojects "$REPO_BASE/libretro/common-shaders.git" "retroarch" "media" "shaders" "libretro/common-shaders"
fetch_subprojects "$REPO_BASE/libretro/common-overlays.git" "retroarch" "media" "overlays" "libretro/common-overlays"
fetch_subprojects "$REPO_BASE/libretro/retroarch-assets.git" "retroarch" "media" "assets" "libretro/retroarch-assets"
fetch_subprojects "$REPO_BASE/libretro/retroarch-joypad-autoconfig.git" "retroarch" "media" "autoconfig" "libretro/joypad-autoconfig"