---
title: Unity中GameObject对象引用
date: 2017-07-17 17:11:45
tags: unity
categories:
---

今天想到个问题，GameObject对象销毁后，其对象引用==null为true，按正常来说，一个类引用变量，在没主动置其为null的情况下与null是不等值的。因此，不是引用变量的值变了，而应该是==操作符被Unity重载了。

<!--more-->

上网查了下C#有没能直接对比对象引用的接口，找到了这个：
	
	object.ReferenceEquals(obj1, obj2);

它是个静态方法，不担心被重写。于是写了以下代码作测试验证：
	
	public class TestClass : MonoBehaviour
	{
		private GameObject Obj = new GameObject("test");
		
		void Update()
		{
			if (Input.GetKeyDown(KeyCode.Space))
			{
				Debug.LogFormat("== ? {0}", Obj == null);
				Debug.LogFormat("object.ReferenceEquals ? {0}", object.ReferenceEquals(Obj, null));
				if (Obj != null)
				{
					GameObject.Destroy(Obj);
					Debug.Log("destroy obj!");
				}
			}
		}
	}
	
输出结果：

![](output1.png)

输出结果跟预期的一样。==操作符被Unity内部重载了才导致了判空能成立。出于好奇，也试了下Equal()函数，其结果与==操作符一样，也被Unity内部重载了。

因此，用GameObject对象引用时需多加注意，尽量避免用其引用作索引匹配之类的，因为C#的List或者Dictionary等数据结构是用默认的相等比较器Equal()进行对比的，除非自己特殊指定比较器。
