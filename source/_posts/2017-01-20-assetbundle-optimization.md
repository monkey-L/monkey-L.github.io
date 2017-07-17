---
title: assetbundle-optimization
date: 2017-01-20 23:03:31
tags:
categories:
---


主要问题是散包很多，加载太慢。我导出了份数据，其中大部分模型单个模型都依赖了20多个包。针对散包的问题，由于散包主要为材质球和其依赖的贴图还有声音，因此考虑了以下优化点：

公用资源（shader、setting、script、mapdata）：

- 一种资源一个包，按文件夹打包

模型：

- 模型预设不要直接绑定特效和声音
- 模型贴图一个包，模型动作一个包，模型shader在shader包，其它模型依赖作为一个包。

贴图：

1. 贴图归类，按文件夹打包（通用贴图、模型贴图、特效贴图）

特效：

1. 特效分类，

图集：

1. 一个图集一个包

UI：

1. 除了图集外，一个UI一个包.

声音：

1. 声音分类，按文件夹打包

材质：

1. 


# 目标：



# 方案：

Resources:

整包资源：
- setting
- script
- shader

散包资源：
- audio
- model
- effect
- ui
- atlas
- other
- img
- navdata
