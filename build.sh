set -ex

if [ ! -n "$1" ]; then
    VER=`git tag | grep -v "v" | tail -n 1 |  python3 -c "import sys; vers = sys.stdin.readline().strip().split('.'); print('.'.join([*vers[:2], str(int(vers[2])+1)]))"`
else
    VER="$1"
fi
git tag $VER
git push -u origin ${VER}

docker build -t crpi-iksw7yoju3x6kkgi.cn-guangzhou.personal.cr.aliyuncs.com/carlos_aliyun01/demo-fe:$VER .
docker push crpi-iksw7yoju3x6kkgi.cn-guangzhou.personal.cr.aliyuncs.com/carlos_aliyun01/demo-fe:$VER
echo crpi-iksw7yoju3x6kkgi.cn-guangzhou.personal.cr.aliyuncs.com/carlos_aliyun01/demo-fe:$VER
