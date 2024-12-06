# k8s-tf

### Cleanup
```shell
find . -type f -name ".terraform.lock.hcl" -prune -exec rm -rf {} \; && find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;
```

### init
```shell
terragrunt run-all init -reconfigure
```
```shell
terragrunt run-all init -upgrade
```
```shell
terragrunt run-all init -upgrade --terragrunt-include-dir environments/${env}/${MODULE_NAME}
```

### apply
```shell
terragrunt run-all apply
```
```shell
terragrunt run-all apply --terragrunt-include-dir environments/${env}/${MODULE_NAME}
```

```shell
cd environments/${env}/${MODULE_NAME}
terragrunt apply
```