#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#


source $GITHUB_WORKSPACE/functions.sh


# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default DNS
sed -i 's/DNS_SERVERS=""/DNS_SERVERS="1.1.1.1"/g' package/network/services/dnsmasq/files/dnsmasq.init


##
# rm -rf ./feeds/extraipk/theme/luci-theme-argon-18.06
# rm -rf ./feeds/extraipk/theme/luci-app-argon-config-18.06
# rm -rf ./feeds/extraipk/theme/luci-theme-design
# rm -rf ./feeds/extraipk/theme/luci-theme-edge
# rm -rf ./feeds/extraipk/theme/luci-theme-ifit
# rm -rf ./feeds/extraipk/theme/luci-theme-opentopd
# rm -rf ./feeds/extraipk/theme/luci-theme-neobird

# rm -rf ./package/feeds/extraipk/luci-theme-argon-18.06
# rm -rf ./package/feeds/extraipk/luci-app-argon-config-18.06
# rm -rf ./package/feeds/extraipk/theme/luci-theme-design
# rm -rf ./package/feeds/extraipk/theme/luci-theme-edge
# rm -rf ./package/feeds/extraipk/theme/luci-theme-ifit
# rm -rf ./package/feeds/extraipk/theme/luci-theme-opentopd
# rm -rf ./package/feeds/extraipk/theme/luci-theme-neobird


##取消bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-nginx/Makefile

##更改主机名
sed -i "s/hostname='.*'/hostname='OpenWrt'/g" package/base-files/files/bin/config_generate

##加入作者信息
sed -i "s/DISTRIB_DESCRIPTION='*.*'/DISTRIB_DESCRIPTION='OpenWRT-$(date +%Y%m%d)'/g"  package/base-files/files/etc/openwrt_release
sed -i "s/DISTRIB_REVISION='*.*'/DISTRIB_REVISION=' By CN2014'/g" package/base-files/files/etc/openwrt_release
# cp -af feeds/extraipk/patch/diy/banner-easy  package/base-files/files/etc/banner

# sed -i "2iuci set istore.istore.channel='leslie_w'" package/emortal/default-settings/files/99-default-settings
# sed -i "3iuci commit istore" package/emortal/default-settings/files/99-default-settings


##FQ全部调到VPN菜单
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm

# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/passwall/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/socks_auto_switch/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/global/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/log/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/rule/*.htm
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-passwall/luasrc/view/passwall/server/*.htm

# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/passwall2/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/model/cbi/passwall2/client/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/model/cbi/passwall2/server/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/app_update/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/socks_auto_switch/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/global/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/haproxy/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/log/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/node_list/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/rule/*.htm
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-passwall2/luasrc/view/passwall2/server/*.htm

# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-vssr/luasrc/view/vssr/*.htm

# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
# sed -i 's/services/vpn/g' package/feeds/luci/luci-app-openclash/luasrc/view/openclash/*.htm

# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/controller/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/model/cbi/bypass/*.lua
# sed -i 's/services/vpn/g' package/feeds/extraipk/luci-app-bypass/luasrc/view/bypass/*.htm

cd $GITHUB_WORKSPACE/openwrt/package
rm -rf luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon.git

# 移除 openwrt feeds 自带的核心包
# rm -rf $GITHUB_WORKSPACE/openwrt/feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}
# rm -rf  $GITHUB_WORKSPACE/openwrt/feeds/jell/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd-alt,miniupnpd-iptables,wireless-regdb}

# 更新 golang 1.22 版本
cd $GITHUB_WORKSPACE/openwrt
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 22.x feeds/packages/lang/golang

# 更新 chinadns-ng 版本
#svn co https://github.com/xiaorouji/openwrt-passwall-packages/trunk/chinadns-ng/ $GITHUB_WORKSPACE/openwrt/feeds/jell/chinadns-ng

# rm -rf $GITHUB_WORKSPACE/openwrt/feeds/jell/chinadns-ng
# cd $GITHUB_WORKSPACE/openwrt/feeds
# mkdir temp_chinadns-ng
# cd temp_chinadns-ng
# git init
# git config core.sparseCheckout true
# echo 'chinadns-ng' > .git/info/sparse-checkout
# git remote add -f origin https://github.com/xiaorouji/openwrt-passwall-packages.git
# git pull origin main
# mv chinadns-ng $GITHUB_WORKSPACE/openwrt/feeds/jell/
# cd ..
# rm -rf temp_chinadns-ng

merge_package master https://github.com/coolsnowwolf/lede.git package/feeds/NueXini_Packages package/lean/vsftpd-alt

# 修改插件名字
sed -i 's/"SoftEther VPN Service"/"SoftEther VPN"/g' `egrep "SoftEther VPN Service" -rl ./`
sed -i 's/"AliDDNS"/"阿里DDNS"/g' `egrep "AliDDNS" -rl ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `egrep "FileBrowser" -rl ./`
sed -i 's/"SoftEther Status"/"SoftEther"/g' `egrep "SoftEther Status" -rl ./`
sed -i 's/"MWAN3 分流助手"/"分流助手"/g' `egrep -rl 'MWAN3 分流助手' ./`
sed -i 's/"FileBrowser"/"文件管理"/g' `egrep -rl 'FileBrowser' ./`
sed -i 's/"广告屏蔽大师 Plus+"/"广告屏蔽"/g' `egrep -rl '广告屏蔽大师 Plus+' ./`
sed -i 's/"AList"/"影视搜刮"/g' `egrep -rl 'AList' ./`
sed -i 's/"EASY MESH"/"MESH组网"/g' `egrep -rl 'EASY MESH' ./`
sed -i 's/"服务质量(QoS)"/"服务质量"/g' `egrep -rl '服务质量(QoS)' ./`
sed -i 's/"服务质量（QoS）"/"服务质量"/g' `egrep -rl '服务质量（QoS）' ./`
sed -i 's/"frp 客户端"/"FRP客户端"/g' `egrep -rl 'frp 客户端' ./`
sed -i 's/"解除网易云音乐播放限制"/"网易云音乐"/g' `egrep -rl '解除网易云音乐播放限制' ./`
sed -i 's/"Multi Stream daemon Lite"/"msd_lite"/g' `egrep -rl 'Multi Stream daemon Lite' ./`
sed -i 's/"KMS 服务器"/"KMS服务器"/g' `egrep -rl 'KMS 服务器' ./`

cat > package/base-files/files/etc/banner << EOF
  _______                     ________        __
 |       |.-----.-----.-----.|  |  |  |.----.|  |_
 |   -   ||  _  |  -__|     ||  |  |  ||   _||   _|
 |_______||   __|_____|__|__||________||__|  |____|
          |__| W I R E L E S S   F R E E D O M
 -----------------------------------------------------
 %D %V, %C
 -----------------------------------------------------
