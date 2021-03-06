#!/bin/bash
if [[ $0 =~ ^(.*)/([^/]+)$ ]]; then
        WORKDIR=${BASH_REMATCH[1]}
fi
source ${WORKDIR}/mod.command

function run { ## build record
	read -r -d '' SPEC <<-CONFIG
	.results | if (. != null) then map({
		"entity_id": .entity_id,
		"entity_type": .entity_type
	}) else "" end
	CONFIG
	printf "${SPEC}"
}

## cmd
cmd "${@}"
