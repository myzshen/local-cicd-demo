#!/bin/bash

set -x

PROJECT_URL="https://github.com/myzshen/mvn-test.git"
PROJECT_NAME="mvn-test"
POST_SCRIPT="post-commit"

cd ~/
git clone ${PROJECT_URL}
cd -

cp ${POST_SCRIPT} ~/home/${PROJECT_NAME}/.git/hooks/ && chmod +x ~/home/${PROJECT_NAME}/.git/hooks/${POST_SCRIPT}

