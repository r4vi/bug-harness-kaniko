# Minimal Test Case for Harness-Kaniko Dockerignore Bug

This repository contains a minimal test case for a bug found in the Harness implementation of the Kaniko builder. The bug manifests when parsing `.dockerignore` files. 

## Bug Description

The bug occurs when a `.dockerignore` file is configured to ignore all files by default and only includes certain files through exceptions. If a filename in the exceptions list contains a `+` symbol, the file is not correctly unignored and remains excluded from the build context.

## Reproducing the Bug

1. Run the following command to build the Docker image using the Harness-Kaniko builder:

    ```bash
    make build
    ```

    Notice that the file `a+b.patch` is not copied into the Docker image.

2. Run the following command to build the Docker image using the upstream Kaniko project:

    ```bash
    make build_google
    ```

    In this case, the file `a+b.patch` is correctly copied into the Docker image.

This discrepancy between the two builders demonstrates the bug in the Harness-Kaniko builder's handling of `.dockerignore` files.
