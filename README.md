# Init a project
```
forge init
```

# Build

```
forge build
```

 # Install a dependency

Example: install openzeppelin:
(will fetch from github)
 ```
forge install Openzeppelin/openzeppelin-contracts
 ```

 And add a mapping in foundry.toml:
 ```
remappings = ["@openzeppelin/=lib/openzeppelin-contracts"]
 ```

 # Test

 ```
forge test
 ```

 # Built-in fuzzing

Pass a parameter to the test function:
 ```
 function testStake(uint8 amount) public {
```

# Invariant testing
See `invariant_testDoStuff` in `StakeContractTest`
https://book.getfoundry.sh/forge/invariant-testing

# Deploy

(We used hardhat to spin up a local node: `yarn hardhat node` or `make local-node`)

```
forge create StakeContract --private-key ${PRIVATE_KEY}
```

add `--rpc-url` to specify a rpc url (by default http://127.0.0.1:8545/)

# Foudry book
https://book.getfoundry.sh/forge/forge-std

# Foudry repo
https://github.com/foundry-rs/forge-std