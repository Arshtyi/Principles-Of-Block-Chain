# Practice 02 (4 hrs): Block

In this practice, you are required to learn the structure of block and implement one in code.

A block is a unit of a blockchain to record transactions and progress. After complete this practice you may understand how blocks are linked into a chain and why it is difficult to modify blocks in a blockchain, especially those buried far deeper than the last block.  Below is an illustration of Block struture in Bitcoin Whitepaper.

<img title="" src="block.png" alt="" data-align="center">

### Requirements

Your program does the following:

- Read initial transaction data from the console input. 

- Given the genesis block, create a valid block meeting the following format (for simplicity, you need not to store the whole merkle tree in the block).

- Print the block in the format below.

```python
{
    'block header':{
        'index': , # the block index in the chain
        'timestamp': , # the block generation time
        'previous_hash': , # the hash of previous block header
        'merkle root': , # root of the merkle tree based on the transactions
        'nonce': , # a random number (this field will be used in Practice 3)
     },
    'transactions': [], # transaction list
}
```

If you program in Python, the data type of a block should be the `dict`, and transactions should be stored in a `list`. 

the genesis block is shown below:

```python
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

##### Input

```textile
BlockGen_Alice_5
Alice_Bob_0.5
Charlie_Alice_1
Bob_Dan_2
Charlie_Dan_3
Bob_Charlie_0.1
Frank_Alice_2
Frank_Bob_0.5
```
