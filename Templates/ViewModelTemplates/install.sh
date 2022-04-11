
#!/bin/bash
abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0
set -e

BASEDIR=$HOME
TEMPLATESDIR1=~/Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates
TEMPLATESDIR2=~/Downloads/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates
FULLTEMPLATESDIR1="$TEMPLATESDIR1/DSKit"
FULLTEMPLATESDIR2="$TEMPLATESDIR2/DSKit"

echo "Templates will be installed"

if [ -d "${FULLTEMPLATESDIR1}" ]; then
    rm -r "${FULLTEMPLATESDIR1}"
fi

if [ -d "${FULLTEMPLATESDIR2}" ]; then
    rm -r "${FULLTEMPLATESDIR2}"
fi

mkdir -p "${FULLTEMPLATESDIR1}"
cp -r *.xctemplate "${FULLTEMPLATESDIR1}"

mkdir -p "${FULLTEMPLATESDIR2}"
cp -r *.xctemplate "${FULLTEMPLATESDIR2}"

trap : 0

echo >&2 '
***********************************************
*** DSKit templates, successfully installed ***
***********************************************
'
