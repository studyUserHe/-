#!/bin/bash
# 获取当前脚本所在目录
script_dir="$( cd "$( dirname "$0"  )" && pwd  )"
photoPath="${script_dir}/photos/longleg"
if [ -d "$photoPath" ]; then
   echo "${photoPath}"
else
	mkdir -pv $photoPath
fi
url="http://img18.3lian.com/d/file/201709/21/f498e01633b5b704ebfe0385f52bad20.jpg"
#echo "${url%/*}------"
#curl -o ${photoPath}/${url##*/} $url 
#https://pic.sogou.com/pics/recommend?category=%C3%C0%C5%AE&from=result#%E5%85%A8%E9%83%A8
curl_url="https://pic.sogou.com/pics/channel/getAllRecomPicByTag.jsp?category=%e5%85%a8%e6%99%af&tag=%e5%a4%a7%e9%95%bf%e8%85%bf&start=0&len=90"
# json=`curl $curl_url`
#&from=result#文艺
# list=`jq '.all_items[].pic_url' $json`
 #http://pic.sogou.com/pics/recommend?category=%B1%DA%D6%BD
 json=`curl -s $curl_url`;

#获取文章列表
list=`echo $json | jq '.all_items'`;

#获取文章长度
length=`echo $json | jq '.all_items|length' `;

# 解析data字段后，开始遍历每一项，取出标题
for index in `seq 0 $length`
do
str=`echo $list | jq ".[$index].pic_url" `
test=`echo $str | sed 's/"//g'`
onePhotoPath=${photoPath}/${test##*/}.jpg
curl -o $onePhotoPath $test 
done
exit 0
