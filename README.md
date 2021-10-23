# concourse-helloworld-resource
A super simple exmaple of Concourse Resource. Just say "Hello World" on your Concourse!

This is the orginal example - you can use the helloworld.yaml in the repo

## Purpose
I wanted to test out skip_download to stop implicit get in put of custom resource (well all really).



```yaml
# U DONT NEED TO VVV
# save this file as helloworld.yaml
resource_types:
- name: helloworld
  type: docker-image
  source:
    # set repo of your helloworld resource
    repository: {{YOUR_ACCOUNT/HELLOWORLD_RESOURCE}}
    ## or use my helloworld resource
    # repository: yoshiyuki/concourse-helloworld-resource

resources:
- name: helloworld
  type: helloworld

jobs:
- name: hello_world
  plan:
  - put: helloworld
- name: hello_world_no_implicit_get
  plan:
  - put: helloworld
    get_params: { skip_download: true }
```

### Build the container
```
docker build . -f Dockerfile -t whatevs:0.1
docker tag whatevs:0.1 <yourrepo>/whatevs:0.1
docker push <yourrepo>/hatevs:0.1
```

```shell
$ fly -t ci set-pipeline helloworld -c helloworld.yaml
```
