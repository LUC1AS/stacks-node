# stacks-node

An Umbrel community app that runs a **Stacks mainnet follower node**, anchored to your own Umbrel Bitcoin node as the burnchain backend.

## What is Stacks?

[Stacks](https://stacks.co) is a Bitcoin layer for smart contracts and decentralised apps. Every Stacks block is anchored to a Bitcoin block, giving Stacks transactions Bitcoin-grade finality.

## Features

- **No extra Bitcoin node needed** — reuses your existing Umbrel Bitcoin app
- **Official image** — `ghcr.io/stacks-network/stacks-core:3.3.0.0.6`
- **Init container** — renders `Config.toml` at startup from Umbrel's injected env vars
- **Non-conflicting ports** — exposes `21443` (RPC) and `21444` (P2P) to avoid clashes with other community Stacks apps
- **Healthcheck** — Umbrel can monitor node liveness via `/v2/info`
- **MIT licensed** — clean-room implementation

## Requirements

- [Umbrel](https://umbrel.com) with the **Bitcoin** app installed and fully synced

## Installation

### Via Umbrel App Store (community)

Add this repo as a community app store in Umbrel, then install **Stacks Node**.

### Manual (non-Umbrel)

```bash
cp .env.example .env
# Edit .env with your Bitcoin node RPC credentials
docker compose --env-file .env up -d
```

## Ports

| Port  | Protocol | Description          |
|-------|----------|----------------------|
| 21443 | TCP      | Stacks RPC API       |
| 21444 | TCP      | Stacks P2P           |

## API

Once running, the Stacks RPC API is available at:

```
http://<your-umbrel-ip>:21443/v2/info
```

## License

[MIT](LICENSE)