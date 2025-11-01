# 实践 01 (4 小时): 默克尔树

在本次实践中，您需要学习如何建立一个默克尔树并用代码实现它。

下图是默克尔树的一个例子。在比特币中，默克尔树用于简化支付验证（详情请参阅比特币白皮书）。

<img src="mt.webp" title="" alt="" data-align="center">

### 要求

给定初始交易数据，您的程序应该构建一个 4 层默克尔树。**应输出默克尔根，如果您能打印出整个树，您将获得更高的分数。**

为简单起见，初始交易数据由以下 8 个任意字符串组成。

```txt
The
initial
trasaction
data
in
a
merkle
tree
```

默克尔根的值应为：

```txt
50369881ce4141276e9f3432584ebc2af8d47bc6dc8f11bd1005a784c25fa210
```

如果您决定使用 Python 3 实现默克尔树，您可以使用下面的哈希函数来帮助您完成本次实践。

```python
import hashlib

def hash(val: str) -> str:
    return hashlib.sha256(val.encode('utf-8')).hexdigest()
```
