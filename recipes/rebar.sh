# rebar
# $1: tmp_path
# $2: rebar_git_ref

TMP_PATH="$1"
REBAR_GIT_REF="$2"

SUNZI_WORKING_DIRECTORY="$(pwd)"

cd $TMP_PATH
rm -rf rebar
git clone --depth=1 https://github.com/basho/rebar.git
cd rebar
git checkout $REBAR_GIT_REF

./bootstrap

cp ./rebar /usr/local/bin/

cd $SUNZI_WORKING_DIRECTORY
