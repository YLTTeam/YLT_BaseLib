#!/bin/bash

#这个脚本默认的运行目录是app的根目录，首先解析 copyheaderlist.txt中的配置的接口路径，然后拿到接口文件，解析接口文件中的所有方法，生成宏文件。
#此脚本运行环境为 /bin/zsh （终端安装oh-my-zsh）
#copyheaderlist.txt中存储的为接口文件的路径，保持最后一行为空行
resultFile=../FLRouter/FLRouter/Classes/FLRouterURLMacro.h
echo "//" > $resultFile
echo "//  FLRouterURLMacro_h" >> $resultFile
echo "//  FLAPP" >> $resultFile
echo "//" >> $resultFile
echo "//  Created by $USER on $(date +%Y/%m/%d).h" >> $resultFile
echo "//  Copyright © $(date +%Y)年 fuliao. All rights reserved." >> $resultFile
echo "//" >> $resultFile
echo "//  author:wangshen email:840787626@qq.com" >> $resultFile
echo "\n\n#ifndef FLRouterURLMacro_h\n#define FLRouterURLMacro_h\n\n" >> $resultFile


while read line
do
    aaa=$line
    presubString=$(expr $aaa : '\([\.\.\/]*[a-zA-Z0-9_/]*\/\)')
    subfixString=${aaa//$presubString/""}
    classname=${subfixString//".h"/""}
    markString="//组件$classname路由表"
    echo $markString >> $resultFile
    while read line1
    do
        if [ "$line1" != "" ]; then
            selPreString=$(expr $line1 : '\([+-][ ]*([a-zA-Z]*)\)')
            if [ "$selPreString" != "" ]; then
                selSubfixString=${line1//$selPreString/""}
                selName=$(expr $selSubfixString : '\([A-Za-z0-9_]*[:|;]\)')
                selName=${selName//":"/""}
                selName=${selName//";"/""}
                defineStr="#define FLRouter_URL_"$classname"_"$selName"  "@\"FLRoute://$classname/$selName\"
                echo $defineStr >> $resultFile
            fi
        fi
    done < $aaa
    echo "\n\n" >> $resultFile
done < copyheaderlist.txt

echo "#endif /* FLRouterURLMacro_h */" >> $resultFile
