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
  -v /root/smartnode:/raptoreum \
  --restart=unless-stopped \
  raptoreum_node
```

### Environment Variables

- `RPC_USER`: RPC username
- `RPC_PASSWORD`: RPC password
- `TESTNET`: Set to `1` for testnet, `0` for mainnet
- `EXTERNALIP`: Your external IP address

### Bootstrap

For a fast setup, run the `bootstrap.sh` script inside the Docker container:

```bash
docker exec -it raptoreum_node /bin/bash
./bootstrap.sh
```
