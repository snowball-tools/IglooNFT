## IglooNFT

ERC-721 with on-chain metadata + svg

- IglooNFTMetadata on Goerli: [0xeba1B46Fb14cA3a1CbC9405865A61F895F43ed6d](https://goerli.etherscan.io/address/0xeba1B46Fb14cA3a1CbC9405865A61F895F43ed6d)
- IglooNFT on Goerli: [0x799e75059126E6DA27A164d1315b1963Fb82c44F](https://goerli.etherscan.io/address/0x799e75059126E6DA27A164d1315b1963Fb82c44F)
- IglooNFTMetadata on Sepolia: [0x9A62a0d1Da80e5D52b124f66CAc711e865120aF6](https://sepolia.etherscan.io/address/0x9A62a0d1Da80e5D52b124f66CAc711e865120aF6)
- IglooNFT on Sepolia: [0x98AdA10fC1EAf5d21DB0f91d09fAa6165e427106](https://sepolia.etherscan.io/address/0x98AdA10fC1EAf5d21DB0f91d09fAa6165e427106)

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
forge script script/IglooNFT.s.sol:IglooNFTScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

#### Test mint

```shell
cast send --rpc-url <your_rpc_url> <contract_address> "safeMint(address)" <params> --private-key <your_private_key> --chain <chain_id>
```

### Verify

```shell
forge verify-contract <contract address> IglooNFT --chain <chain> --watch
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```