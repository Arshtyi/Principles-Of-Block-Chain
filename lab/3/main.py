import hashlib
import json
from time import time
class Blockchain(object):
    def __init__(self, pool_size=4):
        self.transaction_pool = []
        self.chain = []
        self.pool_size = pool_size
        genesis_block = {
            'block header': {
                'index': 0,
                'timestamp': 0,
                'previous_hash': 0,
                'merkle root': 0,
                'nonce': 100
            },
            'transactions': [],
        }
        self.chain.append(genesis_block)

    def add_block(self, proof, previous_hash=None):
        merkle_root = self.__calculate_merkle_root(self.transaction_pool)
        block = {
            'block header': {
                'index': len(self.chain),
                'timestamp': time(),
                'previous_hash': previous_hash or self.__hash(self.__last_block()['block header']),
                'merkle root': merkle_root,
                'nonce': proof,
            },
            'transactions': self.transaction_pool.copy(),
        }
        self.transaction_pool = []
        self.chain.append(block)
        return block

    def add_transaction(self, sender, receiver, amount):
        self.transaction_pool.append({
            'sender': sender,
            'receiver': receiver,
            'amount': amount,
        })
        if len(self.transaction_pool) >= self.pool_size:
            print(f"\n交易池已满({self.pool_size}笔交易)，开始挖矿...")
            self.mine_block()
        return True

    def __last_block(self):
        return self.chain[-1]

    def __hash(self, block):
        block_string = json.dumps(block, sort_keys=True).encode()
        return hashlib.sha256(block_string).hexdigest()

    def __calculate_merkle_root(self, transactions):
        if not transactions:
            return hashlib.sha256(b'').hexdigest()
        tx_string = json.dumps(transactions, sort_keys=True).encode()
        return hashlib.sha256(tx_string).hexdigest()

    def proof_of_work(self, pre_proof):
        proof = 0
        while self.valid_proof(pre_proof, proof) is False:
            proof += 1
        return proof

    def valid_proof(self, pre_proof, proof):
        guess = f'{proof * pre_proof}'.encode()
        guess_hash = hashlib.sha256(guess).hexdigest()
        return guess_hash[:2] == "00"

    def mine_block(self):
        last_block = self.__last_block()
        last_proof = last_block['block header']['nonce']
        proof = self.proof_of_work(last_proof)
        print(f"找到有效proof: {proof}")
        previous_hash = self.__hash(last_block['block header'])
        block = self.add_block(proof, previous_hash)
        print(f"成功创建区块 #{block['block header']['index']}")
        print(f"区块hash: {self.__hash(block['block header'])}")
        return block

    def print_chain(self):
        print("\n" + "="*80)
        print("区块链内容".center(80))
        print("="*80)
        for block in self.chain:
            print(f"\n区块 #{block['block header']['index']}")
            print("-" * 80)
            print("区块头:")
            for key, value in block['block header'].items():
                print(f"  {key}: {value}")
            print(f"\n交易数量: {len(block['transactions'])}")
            if block['transactions']:
                print("交易列表:")
                for i, tx in enumerate(block['transactions'], 1):
                    print(f"  交易{i}: {tx['sender']} -> {tx['receiver']}: {tx['amount']}")
            print("-" * 80)
        print("\n" + "="*80)
        print(f"区块链总长度: {len(self.chain)} 个区块")
        print("="*80 + "\n")

def main():
    blockchain = Blockchain(pool_size=4)
    sample_input = """BlockGen Alice 5
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
Alice Dan 1"""
    lines = sample_input.strip().split('\n')
    for line in lines:
        parts = line.strip().split()
        if len(parts) == 3:
            sender, receiver, amount = parts
            try:
                amount = float(amount)
                blockchain.add_transaction(sender, receiver, amount)
            except ValueError:
                print(f"错误: 金额必须是数字")
    blockchain.print_chain()
if __name__ == '__main__':
    main()
