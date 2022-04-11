
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
TEMPLATESDIR=~/../../Applications/Xcode.app/Contents/Developer/Library/Xcode/Templates/File\ Templates
FULLTEMPLATESDIR="$TEMPLATESDIR/DSKit"

echo "Templates will be installed to ${FULLTEMPLATESDIR}"

if [ -d "${FULLTEMPLATESDIR}" ]; then
    rm -r "${FULLTEMPLATESDIR}"
fi

mkdir -p "${FULLTEMPLATESDIR}"
cp -r *.xctemplate "${FULLTEMPLATESDIR}"
trap : 0

echo >&2 '
***********************************************
*** DSKit templates, successfully installed ***
***********************************************
'
