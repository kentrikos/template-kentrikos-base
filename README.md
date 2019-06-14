# A Product Domain Generic repo for Kentrikos project

This repo contain default structure for project [Kentrikos](https://github.com/kentrikos)

## Usage

This repo should be forked as private and not used directly as described in [aws-bootstrap](https://github.com/kentrikos/aws-bootstrap)

## Configuration

As default this repo take eu-central-1 region as example.

Files that need to be updated :

* application/$REGION/terraform.tfvars
* operations/$REGION/terraform.tfvars
* operations/$REGION/env-kops/jenkins/parameters.yaml (configs for jx and grafana installation)
* operations/$REGION/env-kops/grafana/parameters.yaml (configs for jx and grafana installation)
* operations/$REGION/env-eks/jenkins/parameters.yaml (configs for grafana installation)
* operations/$REGION/env-eks/grafana/parameters.yaml (configs for grafana installation)

* operations/$REGION/env-eks/prometheus/alertmanager.yml (configs for prometheus alertmanager installation)
* operations/$REGION/env-kops/prometheus/alertmanager.yml (configs for prometheus alertmanager installation)
* application/$REGION/env-eks/prometheus/alertmanager.yml (configs for prometheus alertmanager installation)
* application/$REGION/env-kops/prometheus/alertmanager.yml (configs for prometheus alertmanager installation)

To setup on another region change directories name or copy as new region name and update config files accordingly
