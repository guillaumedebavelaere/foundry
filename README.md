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