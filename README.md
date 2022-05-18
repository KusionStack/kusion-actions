# KusionStack Action

[![.github/workflows/main.yml](https://github.com/KusionStack/kusion-actions/actions/workflows/main.yml/badge.svg?branch=main)](https://github.com/KusionStack/kusion-actions/actions/workflows/main.yml)
[![GitHub release](https://img.shields.io/github/release/KusionStack/kusion-actions.svg)](https://github.com/KusionStack/kusion-actions/releases)
[![license](https://img.shields.io/github/license/KusionStack/kusion-actions.svg)](https://github.com/KusionStack/kusion-actions/blob/master/LICENSE)

This is a GitHub Action based on [kusion](https://github.com/KusionStack/kusion), it can help you operate your [KCL](https://github.com/KusionStack/KCLVM) configurations.

## Inputs

### `subcommand`

**Required** Kusion subcommand. Default `"apply"`.

### `workDir`

**Optional** work directory. Default `""`.

### `settings`

**Optional** KCL setting files. Default `""`.

### `arguments`

**Optional** KCL arguments. Default `""`.

### `filenames`

**Optional** KCL files. Default `""`.

### `yes`

**Optional** kusion apply --yes. Default `"false"`.

### `detail`

**Optional** kusion apply --detail. Default `"false"`.

### `noStyle`

**Optional** kusion apply --no-style. Default `"true"`.

### `dryRun`

**Optional** kusion apply --dry-run. Default `"true"`.

### `diffs`

**Optional** diff files. Default `""`.

## Example usage

kusion version:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'version'
```

kusion apply with dry run:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  dryRun: 'true'
```

kusion apply with settings:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  settings: 'ci-test/settings.yaml,kcl.yaml'
```

kusion apply with workDir:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  workDir: '/root/Konfig/appops/nginx-example'
  settings: 'ci-test/settings.yaml,kcl.yaml'
```


kusion apply with arguments and filenames:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  arguments: '-D cluster=default -D env=prod'
  filenames: 'main.k'
```


kusion apply with yes:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  settings: 'ci-test/settings.yaml,kcl.yaml'
  yes: 'true'
```

kusion apply with yes and detail:
```yaml
uses: KusionStack/kusion-actions@main
with:
  subcommand: 'apply'
  settings: 'ci-test/settings.yaml,kcl.yaml'
  yes: 'true'
  detail: 'true'
```