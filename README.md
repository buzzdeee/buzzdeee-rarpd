# rarpd

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with rarpd](#setup)
    * [What rarpd affects](#what-rarpd-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with rarpd](#beginning-with-rarpd)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module manages rarpd on OpenBSD.

## Module Description

The module configures and manages the rarpd service.

## Setup

### What rarpd affects

* configures /etc/ethers
* manages rarpd service

### Beginning with rarpd

In the very simplest case, you just include the following:

```
include rarpd
```

Configuration example for Hiera:

```
rarpd::ethers:
  node1: "00:11:22:33:44:55"
  node2: "66:77:88:99:aa:bb"
```

## Limitations

This version works for OpenBSD rarpd.

## Development

Report issues or PRs at the GitHub repository here: https://github.com/buzzdeee/buzzdeee-rarpd

