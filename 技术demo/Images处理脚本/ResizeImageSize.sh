#base.sh
#图片尺寸处理脚本
#----------------使用说明---------------------#
#前提电脑必须安装imagemagick脚本 mac 下安装方式为终端执行 brew install imagemagick 其他操作系统安装该脚本请百度吧
#将要裁剪的图片放到脚本所在目录
#将icon修改为带后缀的图片名字 图片必须是1024*1024的png 因为ios的icon必须是png的
# 获取当前脚本所在目录
icon="黑帮ICON-棒棒糖.png"
script_dir="$( cd "$( dirname "$0"  )" && pwd  )"
pic_path="$script_dir/$icon"
imageDir="$script_dir/images"
if [[ -d "$imageDir" ]]; then
	#statements
	echo $imageDir
else
	mkdir -pv $imageDir
fi
#iphone
#20pt
convert -resize 40x40 $pic_path $imageDir/iphone_40@2x.png
convert -resize 60x60 $pic_path $imageDir/iphone_60@3x.png
#29pt
convert -resize 29x29 $pic_path $imageDir/iphone_29.png
convert -resize 58x58 $pic_path $imageDir/iphone_58@2x.png
convert -resize 87x87 $pic_path $imageDir/iphone_87@3x.png
#40pt
convert -resize 80x80 $pic_path $imageDir/iphone_80@2x.png
convert -resize 120x120 $pic_path $imageDir/iphone_120@2x.png
#57pt
convert -resize 57x57 $pic_path $imageDir/iphone_57@x.png
convert -resize 114x114 $pic_path $imageDir/iphone_114@2x.png
#60pt
convert -resize 57x57 $pic_path $imageDir/iphone_57@x.png
convert -resize 114x114 $pic_path $imageDir/iphone_114@2x.png
#ipad 图片
#20pt
convert -resize 120x120 $pic_path $imageDir/iphone_120-1@2x.png
convert -resize 180x180 $pic_path $imageDir/iphone_180@3x.png
#29pt
convert -resize 29x29 $pic_path $imageDir/ipad_29@2x.png
convert -resize 58x58 $pic_path $imageDir/ipad_58@2x.png
#40pt
convert -resize 40x40 $pic_path $imageDir/ipad_40@x.png
convert -resize 80x80 $pic_path $imageDir/ipad_80@2x.png
#76pt
convert -resize 76x76 $pic_path $imageDir/ipad_76@x.png
convert -resize 152x152 $pic_path $imageDir/ipad_152@2x.png
#83.5pt
convert -resize 167x167 $pic_path $imageDir/ipad_167@2x.png
#App Store 1024pt
convert -resize 1024x1024 $pic_path $imageDir/app_store_1024.png
open $imageDir/

