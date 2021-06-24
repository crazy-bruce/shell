#!/usr/bin/env bash
# Author: Bruce Chen
# Create Time: 2021.06.23
# Version: 1.0
# description: uninstall tiger

# global variables

tiger_code_dir="/home/bruce/tiger"
tiger_install_dir="/opt"
tiger_tools_dir="/usr/local/bin"
tiger_bin_dir="/home/bruce/.local/bin"
tiger_package_dir="/home/bruce/.local/lib/python3.5/site-packages"



# need root privilege to exec script

if [ $USER != "root" ];then
    echo "warning: permission denied, need root privilege to exec this script!"
    exit 1
fi

# del ~/tiger/build/   ~/tiger/tiger.egg-info/
cd ${tiger_code_dir}

if [ -d "build/" ];then
    rm -rf build/
fi

if [ -d "tiger.egg-info/" ];then
    rm -rf tiger.egg-info/
fi

# del /opt/ internal taf_bck  tiger
cd ${tiger_install_dir}

if [ -d "internal/" ];then
    rm -rf internal/
fi
    
if [ -d "taf_bck/" ];then
    rm -rf taf_bck/ 
fi

if [ -d "tiger/"  ];then
    rm -rf tiger/
fi

# del /usr/local/bin
cd ${tiger_tools_dir}

if [ -f "chromedriver" ];then
    rm -f chromedriver
fi

if [ -f "geckodriver" ];then
    rm -f geckodriver
fi


# del ~/.local
cd ${tiger_bin_dir}

if [ -f "tiger" ];then
    rm -f tiger
fi

cd ${tiger_package_dir}
if [ -d "tiger/" ];then
    rm -rf tiger/
fi

if [ -d "tiger-1.9.0.egg-info/" ];then
    rm -rf tiger-1.9.0.egg-info/
fi

echo "uninstall tiger successfully!"
