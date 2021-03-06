#!/bin/bash
if [[ $0 =~ ^(.*)/[^/]+$ ]]; then
	WORKDIR=${BASH_REMATCH[1]}
fi
source ${WORKDIR}/drv.vrni.client

if [[ -n "${VRNIHOST}" ]]; then
	ITEM="search/query"
	#URL=$(buildURL "${ITEM}")
	#if [[ -n "${CALL}" ]]; then
	#	URL+="/${CALL}"
	#else
		#URL+="?size=10"
		URL="https://field-demo.vrni.cmbu.local/api/search/query?searchString=memory%2Ccpu+of+host&timestamp=1576021141486&timeRangeString=+at+Now+&includeObjects=false&includeFacets=true&includeMetrics=false&includeEvents=false&startIndex=0&maxItemCount=10&dateTimeZone=%2B11%3A00&sourceString=USER&includeModelKeyOnly=false"
		#URL+='?searchString=memory%2Ccpu+of+host'
	#fi
	#if [[ -n "${URL}" ]]; then
		printf "%s" "[INFO]: nsx [list] ${ITEM} [${URL}]... " 1>&2
		#printf "%s" "[$(cgreen "INFO")]: nsx [$(cgreen "list")] ${ITEM} [$(cgreen "$URL")]... " 1>&2
		#printf '%s\n' "${URL}"
		vrniGet "${URL}"
	#fi
fi
