# Requirement

* docker 20.10.0

# Usage

```bach
$ docker build -t text-checker .
$ docker run -it --name text-checker text-checker:latest bin/bash
```

## In Container

```bash
> cd text-checker
> textlint --rulesdir node_modules/textlint-rule-mistaken-ward-check/lib/ xxx.txt -f pretty-error
```
