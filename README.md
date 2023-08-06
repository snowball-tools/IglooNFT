## IglooNFT

ERC-1155 NFT contract for Igloo Testing

- [Only Owner] Goerli: [0x6aa7722ceb3f5393fc7a3f9e200df042a144c523](https://goerli.etherscan.io/address/0x6aa7722ceb3f5393fc7a3f9e200df042a144c523)
- [For Testing... Anyone can mint]: [0x9541b98f2339dec2675f5ff3ea96b69a35aae71a](https://goerli.etherscan.io/address/0x9541b98f2339dec2675f5ff3ea96b69a35aae71a)
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