#!/usr/bin/env bash

# See http://redsymbol.net/articles/unofficial-bash-strict-mode/
# for the following two lines:
set -euo pipefail
IFS=$'\n\t'

#
# Usage: test <case>
#

EXPECTED_ARGS=1
E_BADARGS=64

mac_url="http://chromedriver.storage.googleapis.com/2.15/chromedriver_mac32.zip"
win_url="http://chromedriver.storage.googleapis.com/2.15/chromedriver_win32.zip"

DO_showUsage() {
    echo "Usage: $(basename $0) {docker|mac|win}"
    exit $E_BADARGS
}

if [ $# -ne $EXPECTED_ARGS ]; then
    DO_showUsage
fi

DO_testDocker() {
    echo ""
    echo "#######################"
    echo "## Testing in Docker ##"
    echo "#######################"
    echo ""
    docker build --no-cache=true -t fc-fcuitest .
}

DO_testMac() {
    echo ""
    echo "####################"
    echo "## Testing on Mac ##"
    echo "####################"
    echo ""
    mkdir -p target
    if [ ! -f target/chromedriver ]; then
        curl -sS $mac_url > target/driver.zip && unzip target/driver.zip && rm target/driver.zip && mv chromedriver target/
    fi
    lein with-profile mac test
}

DO_testWin() {
    echo ""
    echo "########################"
    echo "## Testing on Windows ##"
    echo "########################"
    echo ""
    mkdir -p target
    if [ ! -f target/chromedriver.exe ]; then
        curl -sS $win_url > target/driver.zip && unzip target/driver.zip && rm target/driver.zip && mv chromedriver.exe target/
    fi
    lein with-profile win test
}

case "$1" in
    docker)
        DO_testDocker
        ;;
    mac)
        DO_testMac
        ;;
    win)
        DO_testWin
        ;;
    *)
        DO_showUsage
	;;
esac
