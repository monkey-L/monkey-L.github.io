---
title: Unity打包和热更新&&assetbundle
date: 2016-10-20 14:44:20
tags: 
- assetbundle
categories: assetbundle
---

# 遇到的问题

## 流程问题
- 怎么管理资源？
- 怎么划分assetbundle包？
- 怎么处理依赖？
- 怎么做差异/增量更新？
- 怎么加载和管理assetbundle？
- 环境配置

## 细节问题
- 依赖需要按顺序加载不？
不需要，保证所有依赖包能加载进来就行
	
- 怎么处理资源路径和ab的映射问题？
- resources的加载是不加扩展名，而ab的加载是加扩展名，因此一开始就应该定义好路径规则，统一都传带扩展名的路径，判断是用resources加载时再动态去掉扩展名
- 预设的引用太乱了，不干净，例如模型上预设又挂着特效资源，特效预设又挂着声音资源，这样会很影响到打包依赖，所以此时每种资源应该有个管理，例如特效管理和声音管理，相互之间的关联再通过配置表实现
- 同个bundle中的资源同名问题？
 按文件夹打包，根据全路径读取是最好的，ab读取资源的路径参数有两种方式：
 1. 资源名（不带路径，不带扩展名，包内资源名必须唯一）
 2. 全路径（带路径，带扩展名）
- 依赖包需不需要按顺序加载？
- asset后缀文件打不进ab包？
- 用#号拼出assetbundle名后，www加载会有失败
- xcode是7.3，而真机是10.0，导致程序Build不进手机，而电脑又是黑苹果，升级系统会各种问题，后面查了下原来可以直接复制更高版本的xcode程序包下的高版本文件到低版本程序包里，ios的目录是：Contents/Developer/Platforms/iPhoneOS.platform/DeviceSupport/，下面有各个版本的支持情况
- 路径名不能有空格，不然ios读不到
- 依赖不加载全，就所有资源都不能加载还是指定资源的依赖都加载了就能加载此资源？
- 同个资源能同时打到不同包上吗
- 更新异常处理：
	1. 网络挂了
	2. 磁盘满
	3. gprs网络提示
- 协程处理热更新时，需要处理异常的处理，因为协程内发生异常是不影响协程外执行的

# 坑
- 我的mac机是64位，要选osx64平台才能打包成功
- 打包时我是对resources下的文件夹移至
- www加载文本文件后，用www.text访问文本内容会有编码限制。官方文档上有要求文件内容为utf8或者ascii编码，如果是其它编码格式，需要通过www.bytes转编码为string(如：System.Text.Encoding.UTF7.GetString(www.bytes))，另一个问题是，官方文档中提的utf8是不带bom的，我是用c#自带的System.Text.Encoding.UTF8写出来的文件，查了格式才知道，原来这样写出来的文件是默认带bom的，如果希望文件是无bom的utf8编码，应该自己创建(new UTF8Encoding(false))进行写入。
- android streamingdatapath是在apk包里面，无法直接使用本地读取，只能通过www访问
- 平台路径问题

# 资源目录
- setting
- script
- shaders
- audio
- font
- model
- ui
- effect
- texture

# 资源打包
## 打包策略
### 整包
- setting
- script
- shader
- audio
- font
- ui

### 散包
主包名与其资源目录相同，便于查找

1. 主包
- 每个model预设
- 每个特效预设
- 每个UI贴图

2. 依赖包


### 资源包目录结构 


# 资源更新


# 资源加载


# assetbundle流程
- assetbundle打包
- assetbundle上传
- assetbunlde下载
- assetbundle加载
- asset加载 
- assetbundle卸载
- www释放