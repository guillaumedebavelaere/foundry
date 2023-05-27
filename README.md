Foundry is a smart contract development toolkit that allows users to write and test their Solidity smart contracts in Solidity and to warp the VM state in their tests.  
It consists of two main components: Forge, used for compiling, testing, and deploying smart contracts, and Cast, used to interact with the network and the smart contracts.

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

 Or in a remappings.txt file:
```
@openzeppelin/=lib/openzeppelin-contracts
```


# See remappings

```
forge remappings
```

 # Test

 ```
forge test
 ```

To print the logs (`emit log(mystring)`), we need to run the test script with the -vv flag:
```
 forge test -vv
 ```

 Test only specific contract

 ```
forge test --match-contract ERC721
 ```

coverage:
```
forge coverage
```

To debug in more details what has not been covered, use the debug report:
```
forge coverage --report debug
```

More details:
```
forge coverage --help
```

# Mocking user in a test

prank sets msg.sender to the specified address for the next call. "The next call" includes static calls as well, but not calls to the cheat code address.

You can also use startPrank which will set msg.sender for all subsequent calls until stopPrank is called.


 # Built-in fuzzing

Pass a parameter to the test function:
 ```
 function testStake(uint8 amount) public {
```

# Invariant testing
See `invariant_testDoStuff` in `StakeContractTest`
https://book.getfoundry.sh/forge/invariant-testing

# Deploy

You can start the local EVM test network at any time:
```
anvil
```
```
export PRIVATE_KEY=<your-private-key>
```

Directly deploy the contract:

```
forge create StakeContract --private-key ${PRIVATE_KEY}
```

add `--rpc-url` to specify a rpc url (by default http://127.0.0.1:8545/)


Simulate a deploy:

```
forge script script/StakeContract.s.sol:StakeContractScript --private-key $PRIVATE_KEY
```

Deploy with a script (`--broadcast`):

```
forge script script/StakeContract.s.sol:StakeContractScript --private-key $PRIVATE_KEY --broadcast
```

# Cast

Read

```
cast call $CONTRACT_ADDRESS "shouldAlwaysBeZero()"
```

Write
```
cast send $CONTRACT_ADDRESS "doStuff(uint256)" 10 --private-key $PRIVATE_KEY 
```


# VS Code Solidity configuration
If you're using VS Code, consider setting up the following Solidity configurations so that your text editor knows where to find the dependencies and your Solidity code by setting:

Package Default Dependencies Contracts Directory as src
Package Default Dependencies Directory as lib

# Foudry book
https://book.getfoundry.sh/forge/forge-std

# Foudry repo
https://github.com/foundry-rs/forge-std