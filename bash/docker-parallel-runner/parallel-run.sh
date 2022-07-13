#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide arguments"
fi

function run_docker {
    docker run ${DOCKER_KEYS:---rm} "$1" ${DOCKER_EXEC:-uname -a} 2>"$1-stderr.log" >"$1-stdout.log"
    echo $? >"$1-exitcode.log"
}

echo "Spawning containers!"

for i in $*; do
    run_docker "$i" &
done

echo "Waiting for completion..."

wait

for i in $*; do
    echo -n "$i exitcode: "
    cat "$i-exitcode.log"
    echo
    echo "### STDOUT ###"
    cat "$i-stdout.log"
    echo
    echo "### STDERR ###"
    cat "$i-stderr.log"
    echo
    echo
done
