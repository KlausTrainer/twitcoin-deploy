# Twitcoin
# $1: tmp_path

TMP_PATH="$1"

SUNZI_WORKING_DIRECTORY="$(pwd)"

cd $TMP_PATH
rm -rf twitcoin
git clone --depth=1 https://github.com/KlausTrainer/twitcoin.git

cd twitcoin

make

if ! id -u twitcoin &> /dev/null; then
    adduser --system --shell=/bin/sh twitcoin
fi

chown -R twitcoin:nogroup *
cp -dR * /home/twitcoin/

cd $SUNZI_WORKING_DIRECTORY

cp files/twitcoin.config /home/twitcoin/config/twitcoin.config
cp files/twitcoin-upstart.conf /etc/init/twitcoin.conf

if [ "$(status twitcoin)" = "twitcoin stop/waiting" ]; then
    start twitcoin
fi
