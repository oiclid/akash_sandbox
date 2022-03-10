#!/usr/bin/env sh

set -e

if [ -n "$email" ] && [ -n "$key" ] && [[ "$version" == "4" ]]; then
  ./bin/geekbench4 -r $email $key
  echo ""
elif [ -n "$email" ] && [ -n "$key" ] && [[ "$version" == "5" ]]; then
  ./bin/geekbench5 -r $email $key
  echo ""
else
echo "No email or key set - continue..."
fi

PARAMS=""

if [ -n "$help" ]; then
  PARAMS="$PARAMS --help"
fi

if [ -n "$cpu" ]; then
  PARAMS="$PARAMS --cpu"
fi

if [ -n "$arch" ]; then
  PARAMS="$PARAMS --arch $arch"
else
  PARAMS="$PARAMS --arch 64bit"
fi

if [ -n "$sysinfo" ]; then
  PARAMS="$PARAMS --sysinfo"
fi

if [ -n "$upload" ]; then
  PARAMS="$PARAMS --upload"
fi

if [ -n "$no_upload" ]; then
  PARAMS="$PARAMS --no-upload"
fi

echo ${VERSION} is the current version
if [ ${VERSION} -lt 5 ]; then
echo Using ${VERSION}
  ./bin/geekbench4 $PARAMS
else
echo Using ${VERSION}
  ./bin/geekbench5 $PARAMS 
fi
