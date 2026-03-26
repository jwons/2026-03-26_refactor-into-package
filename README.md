# 2026-03-26-testing

Today we'll talk about refactoring an R project into a package. Use the following instructions to setup your environment. 

## Environment Setup

This repository includes a Docker Compose setup with two services:

- `rstudio` builds from `rocker/rstudio`, installs the R package `testthat`, and mounts this repository at `/home/rstudio/project`.

Build the images:

```bash
docker compose build
```

Start the RStudio environment:

```bash
docker compose up rstudio
```

Then open `http://localhost:8787` and sign in with:

- Username: `rstudio`
- Password: `rstudio`

To stop the service, press `Ctrl+C` in the running terminal, or use:

```bash
docker compose down
```