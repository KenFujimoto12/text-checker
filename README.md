# Requirement

* docker 20.10.0

# Usage

```bash
$ git clone --recursive git@github.com:KenFujimoto12/textlint-rule-mistaken-ward-check.git
$ docker build -t text-checker .
$ docker run -it --name text-checker text-checker:latest bin/bash
```

## In Container

```bash
> cd text-checker
> vim xxx.txt
## copy and paste blog text into xxx.txt
> textlint --rulesdir node_modules/textlint-rule-mistaken-ward-check/lib/ xxx.txt -f pretty-error
```
