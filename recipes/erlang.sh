# Erlang/OTP
# $1: tmp_path
# $2: erlang_git_ref

TMP_PATH="$1"
ERLANG_GIT_REF="$2"

SUNZI_WORKING_DIRECTORY="$(pwd)"

cd $TMP_PATH
rm -rf otp
git clone --depth=1 https://github.com/erlang/otp.git
cd otp
git checkout $ERLANG_GIT_REF

./otp_build autoconf
./configure --prefix=/usr/local --without-javac --enable-halfword-emulator
make -j 4 && make install

cd $SUNZI_WORKING_DIRECTORY
