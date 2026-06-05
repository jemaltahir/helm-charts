# My Helm Charts

A Helm chart repository hosted on GitHub Pages.

[![Release Charts](https://github.com/YOUR_GITHUB_USERNAME/helm-charts/actions/workflows/helm-release.yml/badge.svg)](https://github.com/YOUR_GITHUB_USERNAME/helm-charts/actions/workflows/helm-release.yml)

## Usage

```bash
helm repo add myrepo https://YOUR_GITHUB_USERNAME.github.io/helm-charts
helm repo update
```

## Available Charts

| Chart   | Description                     | Version |
| ------- | ------------------------------- | ------- |
| mychart | A sample Nginx deployment chart | 0.1.0   |

## Quick Start

```bash
# Install mychart with defaults
helm install my-release myrepo/mychart

# Install with custom values
helm install my-release myrepo/mychart \
  --set replicaCount=2 \
  --set service.type=NodePort

# Install from a custom values file
helm install my-release myrepo/mychart -f my-values.yaml
```
