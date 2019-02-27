# tf\_helm\_sa

Create Kubernetes service account for Tiller. This module will
create a service account for helm's in-cluster component Tiller, which interacts directly with the Kubernetes API server to install, upgrade, query and remove Kubernetes resources.

## Usage

```hcl
module "tiller_sa" {
  source = "github.com/evry-ace/tf_helm_sa"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| tf_helm_sa_name | Service account name | string | `""` | no |
| tf_helm_sa_namespace | Service account namespace | string | `""` | no |

## Authors

Module is maintained by the EVRY ACE Team.

## License

MIT License. See [LICENSE](./LICENSE) for full details.