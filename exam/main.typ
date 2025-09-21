#import "@preview/ezexam:0.3.1": *

#show: setup.with(
    mode: EXAM,
    resume: false,
    heading-top: 0em,
    heading-bottom: .4em,
    line-height: .65em,
    par-spacing: .65em,
    enum-spacing: .65em,
    list-spacing: .65em,
)
#set par(justify: true)
#show strong: set text(weight: "bold")
#let Title = "山东大学区块链原理期末考试"
#let author = "arshtyi"
#let date = datetime.today()
#set document(title: Title, date: date, author: author)
#title(Title)
#exam-info(info: (
    教师: "徐明辉",
    时间: datetime(year: 2025, month: 11, day: 19).display("[year].[month].[day]"),
    源码: link("https://github.com/arshtyi/SDU-Principles-Of-Block-Chain", "link"),
))
#show raw: set text(font: "JetBrains Mono")
#show raw.where(block: false): box.with(
    fill: luma(240),
    inset: (x: .3em, y: 0em),
    outset: (x: 0em, y: .3em),
    radius: .2em,
)

= 简答
#question[
    + 请画出比特币的完整区块结构图。要求：简化版，但要画出区块头/区块体内存储的基本信息。
    + 简述在比特币中，对于区块内交易的序列化，为什么不用哈希链，而是用默克尔树？
]
#question[
    + 是某头部新能源车企的CTO，要基于区块链做动力电池全生命周期溯源系统，涉及矿商、材料厂、电池厂、车厂、回收商。在这一场景下，部分数据高度敏感，部分数据需强制公开用于审计，每日百万量级交易。在公有链、私有链、联盟链三者中你选哪种？给出你的选择和理由，并且给出不选择另外两个的理由
    + 简要介绍在区块链上记录数字资产和实体资产的区别
]
#question[
    在 PBFT 共识协议中，诚实的节点通过视图切换（View change）机制来避免无限制等待用户请求执行。若一个诚实节点在视图$v$中发生超时，它只有在收到视图$v+1$合法的new-view 消息后，才会正式切换至视图$v+1$。

    请回答：
    + 假设参与共识节点数为$N$，拜占庭节点数至多为$f$。视图$v+1$的主节点在视图$v$发生超时后，收集到至少多少个关于视图$v+1$的view-change消息后才会广播new-view消息？
    + 关于视图$v+1$的合法new-view 消息需要满足几个条件，并简要阐述。
]
#question[
    设你是一个分片协议的设计者，你需要决定如何将用户账户映射到不同的分片中，请对比以下两种策略：
    #set enum(numbering: "a.")
    + 基于账户地址：将地址前缀相同的账户分配到同一个分片；
    + 基于随机分配：通过对账户地址进行哈希运算，完全离散、随机地将账户映射到分片。

    请分析这两种方式各自的优缺点，以及它们分别适合什么样的应用场景。要求：简要分析优缺点即可，应用场景可以从公有链、私有链和联盟链的角度思考。
]
#question[
    + 简述共识算法的概念，以及需要满足的三个特性。
    + 简述分布式系统需要满足的两个特性。
]
