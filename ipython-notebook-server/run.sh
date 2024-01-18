#! /bin/bash
set -e
if [ -z "$GIT_REPO" ]; then
    echo "Git Repo not defined. Blank project will be used"
else
    cd /tmp/notebook && git clone https://github.com/$GIT_REPO
fi

ipython notebook --no-browser --ip=0.0.0.0 --port=8080 --notebook-dir=/tmp/notebook/${GIT_REPO/*\/}/${REPO_DIR}
