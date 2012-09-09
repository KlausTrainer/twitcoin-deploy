# bitcoind
# $1: tmp_path
# $2: bitcoind_git_ref

TMP_PATH="$1"
BITCOIND_GIT_REF="$2"

SUNZI_WORKING_DIRECTORY="$(pwd)"

cd $TMP_PATH
rm -rf bitcoin
git clone --depth=1 https://github.com/bitcoin/bitcoin.git
cd bitcoin/src
git checkout $BITCOIND_GIT_REF

USE_UPNP=- make -j 4 -e -f makefile.unix

if ! id -u bitcoind &> /dev/null; then
    adduser --system bitcoind
fi
cp ./bitcoind /home/bitcoind/bitcoind
ln -f -s /home/bitcoind/bitcoind /usr/local/bin/bitcoind
mkdir -p -m 0700 /home/bitcoind/.bitcoin
cd $SUNZI_WORKING_DIRECTORY
cp files/bitcoind-upstart.conf /etc/init/bitcoind.conf
cp files/bitcoin.conf /home/bitcoind/.bitcoin/bitcoin.conf
chmod 0600 /home/bitcoind/.bitcoin/bitcoin.conf
chmod 0700 /home/bitcoind /home/bitcoind/bitcoind /home/bitcoind/.bitcoin
chown -R bitcoind:nogroup /home/bitcoind /home/bitcoind/.bitcoin

# (re-)start bitcoind
if [ "$(status bitcoind)" = "bitcoind stop/waiting" ]; then
    start bitcoind
else
    restart bitcoind
fi
