## IglooNFT

ERC-1155 NFT contract for Igloo Testing

- IglooNFTMetadata on Goerli: [0xeba1B46Fb14cA3a1CbC9405865A61F895F43ed6d](https://goerli.etherscan.io/address/0xeba1B46Fb14cA3a1CbC9405865A61F895F43ed6d)
- IglooNFT on Goerli: [0x799e75059126E6DA27A164d1315b1963Fb82c44F](https://goerli.etherscan.io/address/0x799e75059126E6DA27A164d1315b1963Fb82c44F)

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