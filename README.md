# My Helm Charts

Helm charts published as OCI artifacts on GitHub Container Registry (GHCR).

[![Release Charts](https://github.com/jemaltahir/helm-charts/actions/workflows/helm-release.yml/badge.svg)](https://github.com/jemaltahir/helm-charts/actions/workflows/helm-release.yml)

## Available Charts

| Chart   | Description                     | Version |
| ------- | ------------------------------- | ------- |
| mychart | A sample Nginx deployment chart | 0.1.0   |

## Usage

No `helm repo add` needed. Install directly from GHCR:

```bash
# Install latest
helm install my-release oci://ghcr.io/jemaltahir/helm-charts/mychart --version 0.1.0

# Install with custom values
helm install my-release oci://ghcr.io/jemaltahir/helm-charts/mychart --version 0.1.0 \
  --set replicaCount=2 \
  --set service.type=NodePort

# Install from a custom values file
helm install my-release oci://ghcr.io/jemaltahir/helm-charts/mychart --version 0.1.0 \
  -f my-values.yaml
```

## Pulling a chart

```bash
helm pull oci://ghcr.io/jemaltahir/helm-charts/mychart --version 0.1.0
```
