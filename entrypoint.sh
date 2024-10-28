#!/bin/bash

DIR_PATH=${1}
LIST_PATH=${2}
JOB_INDEX=$(($3+1))
SKIP_FLAG=1
RETRY_FLAG=1

# Quick exit if the job is already done
OUT_PATH=${DIR_PATH}/logs/${JOB_INDEX}
if [[ -f ${OUT_PATH} && SKIP_FLAG == "1" ]]; then
       echo "log already present, skip!"
       exit 0
fi

/gh/docker_init.sh
/gh/docker_k8_run.sh ${DIR_PATH} ${LIST_PATH} ${JOB_INDEX} ${SKIP_FLAG} ${RETRY_FLAG}
