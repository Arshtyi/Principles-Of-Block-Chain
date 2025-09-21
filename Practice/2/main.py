import sys
import time
import hashlib
import json
from typing import List, Tuple, Optional
def sha256_hex(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()
def merkle_root(transactions: List[str]) -> Tuple[str, List[List[str]]]:
    if not transactions:
        return '0', [[]]
    layer = [sha256_hex(tx.encode('utf-8')) for tx in transactions]
    layers = [layer.copy()]
    while len(layer) > 1:
        if len(layer) % 2 == 1:
            layer.append(layer[-1])
        next_layer = []
        for i in range(0, len(layer), 2):
            left = layer[i]
            right = layer[i+1]
            combined = bytes.fromhex(left) + bytes.fromhex(right)
            parent = sha256_hex(combined)
            next_layer.append(parent)
        layer = next_layer
        layers.append(layer.copy())
    root = layer[0]
    return root, layers
def block_header_hash(header: dict) -> str:
    header_json = json.dumps(header, sort_keys=True, ensure_ascii=False).encode('utf-8')
    return sha256_hex(header_json)
def create_block(index: int, previous_hash: str, transactions: List[str], nonce: int = 0, timestamp: Optional[float] = None) -> Tuple[dict, List[List[str]]]:
    if timestamp is None:
        timestamp = time.time()
    merkle, layers = merkle_root(transactions)
    header = {
        'index': index,
        'timestamp': timestamp,
        'previous_hash': previous_hash,
        'merkle root': merkle,
        'nonce': nonce,
    }
    block = {
        'block header': header,
        'transactions': transactions.copy(),
    }
    return block, layers
def main():
    txs = [line.strip() for line in sys.stdin if line.strip()]
    genesis = {
        'block header':{
            'index': 0,
            'timestamp': 0,
            'previous_hash': 0,
            'merkle root': 0,
            'nonce': 100,
        },
        'transactions': [],
    }
    index = 1
    previous_hash = block_header_hash(genesis['block header'])
    block, layers = create_block(index=index, previous_hash=previous_hash, transactions=txs, nonce=0)
    print(json.dumps(block, ensure_ascii=False, indent=4))
if __name__ == '__main__':
    main()
