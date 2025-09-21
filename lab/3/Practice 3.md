# Practice 03 (6 hrs): Proof of Work algorithm

In this practice, you are required to learn the PoW algorithm and implement one in code.

In Bitcoin, in order to win the mining rights, miners need to keep trying different random numbers until the block hash satisfies some difficulty requirement, like containing leading 60 zeroes. This process consumes a large number of computing resourses, therefore, the valid random number is viewed as a proof of work.

### Requirements

Your program does the following:

- Before running the algorithm, create and configure your local blockchain. 

- Read initial transaction data from the console input.

- Create new transactions and add them into your transaction pool.

- When the transaction pool is full (e.g., the pool can contain 4 txs at most, however, the size of the pool is left user-defined), add all transactions into a block, and add the block to your blockchain.

- When you generate a block, you need to generate a valid proof using the PoW algorithm. And the form of the block should meet the following format (for simplicity, you need not to store the whole merkle tree in the block).

- You need to add 3 valid blocks to your blockchain successfully, and print your blockchain as clearly as you can.

- You can use the Blockchain class template below to complete this practice.

```python
# the format of a valid block
{
    'block header':{
        'index': , # the block index in the chain
        'timestamp': , # the block generation time
        'previous_hash': , # the hash of previous block header
        'merkle root': , # root of the merkle tree based on the transactions
        'nonce': , # a valid random number
     },
    'transactions': [], # transaction list
}
```

The genesis block is shown below:

```python
# the genesis block
{
    'block header':{
        'index': 0
        'timestamp': 0
        'previous_hash': 0
        'merkle root': 0
        'nonce': 100
     },
    'transactions': [],
}
```

The Blockchain class template is shown below:

```python
class Blockchain(object):
    def __init__(self):
        """
        创建交易池、本地区块链并添加创世区块
        """
        self.transaction_pool = []
        self.chain = []

        # TODO: 创建创世区块并加入区块链
        pass


    def add_block(self, proof, previous_hash=None):
        """
        TODO: 创建一个新的区块到区块链中，并返回创建成功的区块
        :param proof: <int>                    由工作证明算法生成的证明
        :param previous_hash: <str>            前一个区块的 hash 值
        :return: <dict>                        新区块
        """
        pass


    def add_transaction(self, sender, receiver, amount):
        """
        TODO: 添加一笔新的交易到交易池中
        :param sender: <str>   发送者
        :param receiver: <str> 接收者
        :param amount: <int>   金额
        :return: <bool>        是否添加成功
        """
        pass


    def __last_block(self):
        """
        TODO: 返回本地区块链（最长链）上的最后一个区块的 hash 值
        return: <str>
        """
        pass


    def __hash(block):
        """
        给一个区块生成 SHA-256 值
        :param block: <dict>
        :return: <str>
        """
        block_string = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_string).hexdigest()


    def proof_of_work(pre_proof):
        """
        TODO: 简易工作量证明算法
         - 找到一个数字p，使得p*p'的hash值的前2个字符是0
         - 其中p'是前一个区块的proof,找到的p是工作量证明
        :param pre_proof: <int>
        :return: <int>
        """

        pass


    def print():
        """
        TODO: 打印区块链
        """
        pass
```

##### Input

If the size of the transaction pool is 4 txs, you can use the input data below. Or you can generate your input data in the format as "sender receiver amount", to generate new transactions.

```textile
BlockGen Alice 5
Alice Bob 0.5
Charlie Alice 1
Bob Dan 2
BlockGen Alice 5
Charlie Dan 3
Bob Charlie 0.1
Frank Alice 2
BlockGen Alice 5
Frank Bob 0.5
Bob Charlie 0.5
Alice Dan 1
```
