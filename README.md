# Raptoreum Node Docker

Docker container for running a Raptoreum node.

## Quick Start

### Build the Docker Image

Build the Docker image:

```bash
docker build -t raptoreum_node .
```

### Run the Docker Container

Replace `<your_IP>` with your external IP address and run:

```bash
docker run \
  -d \
  -p 10225:10225 \
  -p 10226:10226 \
  --name raptoreum_node \
  -e RPC_USER=<your_rpc_user> \
  -e RPC_PASSWORD=<your_rpc_password> \
  -e EXTERNALIP=<your_IP> \
  -v raptoreum:/raptoreum \
  --restart=unless-stopped \
  raptoreum_node
```

### Environment Variables

- `RPC_USER`: RPC username
- `RPC_PASSWORD`: RPC password
- `TESTNET`: Set to `1` for testnet, `0` for mainnet
- `EXTERNALIP`: Your external IP address
- `FORCE_BOOTSTRAP`: Set to `1` to force bootstrap
- `RPC_ALLOW_IP`: Allow RPC from IP address
