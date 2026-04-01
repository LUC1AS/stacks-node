# stacks-node

An Umbrel community app that runs a **Stacks mainnet follower node**, anchored to your own Umbrel Bitcoin node as the burnchain backend.

> **By [LUC1AS](https://github.com/LUC1AS)**

## What is Stacks?

[Stacks](https://stacks.co) is a Bitcoin layer for smart contracts and decentralised apps. Every Stacks block is anchored to a Bitcoin block, giving Stacks transactions Bitcoin-grade finality.

## Features

- **No extra Bitcoin node needed** — reuses your existing Umbrel Bitcoin app
- **Official image** — `ghcr.io/stacks-network/stacks-core:3.3.0.0.5`
- **Quick Sync** — on first install, automatically downloads and extracts the latest Hiro mainnet snapshot so your node is ready in minutes instead of days
- **Init container** — renders `Config.toml` at startup from Umbrel's injected env vars
- **Non-conflicting ports** — exposes `21443` (RPC) and `21444` (P2P) to avoid clashes with other community Stacks apps
- **Healthcheck** — Umbrel can monitor node liveness via `/v2/info`
- **MIT licensed** — clean-room implementation

## Requirements

- [Umbrel](https://umbrel.com) with the **Bitcoin** app installed and fully synced

## Installation

### Via Umbrel App Store (community)

1. Open your Umbrel dashboard
2. Go to **App Store → Community App Stores**
3. Paste the URL:
   ```
   https://github.com/LUC1AS/stacks-node
   ```
4. Click **Add Store**, then install **Stacks Node**

### Manual (non-Umbrel)

```bash
cp .env.example .env
# Edit .env with your Bitcoin node RPC credentials
docker compose --env-file .env up -d
```

## Ports

| Port  | Protocol | Description    |
|-------|----------|----------------|
| 21443 | TCP      | Stacks RPC API |
| 21444 | TCP      | Stacks P2P     |

## API

Once running, the Stacks RPC API is available at:

```
http://<your-umbrel-ip>:21443/v2/info
```

Common endpoints:

| Endpoint | Description |
|----------|-------------|
| `/v2/info` | Node info, burn block height, stacks tip |
| `/v2/accounts/<address>` | Account balance and nonce |
| `/v2/transactions` | Broadcast signed transactions |
| `/v2/fees/transfer` | Estimated fee for STX transfer |

Full API reference: [docs.hiro.so/api](https://docs.hiro.so/api)

## License

[MIT](LICENSE)
