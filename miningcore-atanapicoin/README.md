# miningcore

Miningcore is a high-performance Mining Pool Software for Linux and Windows.

<img src="https://github.com/oliverw/miningcore/raw/master/logo.png" width="150">

### Features

- Supports clusters of pools each running individual currencies
- Ultra-low-latency, multi-threaded Stratum implementation using asynchronous I/O
- Adaptive share difficulty ("vardiff")
- PoW validation (hashing) using native code for maximum performance
- Session management for purging DDoS/flood initiated zombie workers
- Payment processing
- Banning System
- Live Stats [API](https://github.com/oliverw/miningcore/wiki/API) on Port 4000
- WebSocket streaming of notable events like Blocks found, Blocks unlocked, Payments and more
- POW (proof-of-work) & POS (proof-of-stake) support
- Detailed per-pool logging to console & filesystem
- Runs on Linux and Windows

# Requirements

### I already have an Atanapi wallet and private key

Great! You are steps away from your own private mining pool.  Click Deploy and update the required variables with your wallet information

```
WALLET=
FEE_WALLET=
PRIVATE_KEY=
```

After the deployment has started click on the Logs in the Deployment Details page to check the status.
There is currently no UI.

### I don't have an Atanapi wallet or private key.

You need an Atanapi wallet address and private key to setup the mining pool.  If you do not have one, simply deploy this default template without any WALLET or PRIVATE_KEY defined.
In Cloudmos, select "Shell" and from the services tab click on "atanapi".  In the "Type command window" use the 2 following commands to generate a new address and show the private key of the new address.

```
/atanapi-cli getnewaddress
YOUR_NEW_ADDRESS
/atanapi-cli dumpprivkey YOUR_NEW_ADDRESS
```
* Replace YOUR_NEW_ADDRESS after dumpprivkey to get the private key!

You can now update the variables in the deployment with your new wallet and private key.  Be sure to write down the private key or keep it in a safe place!

### Connecting to the Mining Pool / Stratum Ports

The mining pool is pre-configured to map each stratum port to an ephemeral port.  After your deployment is successful you will see the new port numbers to connect to.
The stratum port is shown as `Forwarded Ports:30216:3062`.  
For example, use `tcp+stratum://provider.akash.world:30216` to connect your miners.

### What about security?

The default template is configured to only deploy to audited Akash providers.  If you remove this `signedBy` attribution key you are putting your private key at risk.
The pool wallet should NEVER be used for long term/cold storage of coins.