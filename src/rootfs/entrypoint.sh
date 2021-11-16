#!/bin/bash

ENTRYPOINT="${ENTRYPOINT:-/action/lib/linter.sh}"

RUN_LOCAL="${RUN_LOCAL:-true}"

echo "INFO: Checking 'RUN_LOCAL=${RUN_LOCAL}' == 'true'"
if [ "${RUN_LOCAL}" == "true" ] ; then
  echo "INFO: ${ENTRYPOINT} hax in progress..."
  export RUN_LOCAL="${RUN_LOCAL-true}"
  export DEFAULT_WORKSPACE="${DEFAULT_WORKSPACE-.}"
  export DEFAULT_BRANCH="${DEFAULT_BRANCH-main}"
else
  echo "INFO: running regular old '${ENTRYPOINT} ${@}'..."
fi

echo "INFO: RUN_LOCAL=${RUN_LOCAL}"
echo "INFO: DEFAULT_WORKSPACE=${DEFAULT_WORKSPACE}"
echo "INFO: DEFAULT_BRANCH=${DEFAULT_BRANCH}"

exec ${ENTRYPOINT} ${@}

