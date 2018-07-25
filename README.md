# PhD thesis template
PhD thesis template
Based on [Thesis template of Jochem Rutgers](https://sites.google.com/site/jochemrutgers/publications/phd-thesis)

[![Build Status](https://travis-ci.org/gkuiper/phdthesis-template.svg?branch=master)](https://travis-ci.org/gkuiper/phdthesis-template)

# Usage
Install [Docker](https://www.docker.com/)

Use the docker image from [[docker-latex-thesis](https://github.com/gkuiper/docker-latex-thesis) to build this template.

To view the possible commands of the themplate run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make help
```

To build the template run:
```bash
docker run -it -v $(pwd):/data guusk/docker-latex-thesis make fonts all
```
