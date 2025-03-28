#!/bin/bash
#
# Proof-of-concept, find workspaces failing a particular policy check.
# The HCP TF APIs are paged. This script does not handle that. Like I say... proof-of-concept.
#
# The script also has bugs. e.g. you may see something like this. I'm not gonna fix that.
# jq: error (at <stdin>:1): Cannot iterate over null (null)

if [ -z ${TFE_ADDR} ]; then
    export TFE_ADDR="https://app.terraform.io"
fi

if [ -z ${TFE_TOKEN} ]; then
    echo "Set TFE_TOKEN env var, and try again. You may already have one in ~/.terraform.d/credentials.tfrc.json"
    exit 1
fi

POLICY_TO_CHECK="global/common/check-tf-version"


#
# Functions
#

function check_workspace_run() {
    run_id=$1

    # In my case, I've got the policy set up as a Policy Check
    # https://developer.hashicorp.com/terraform/cloud-docs/api-docs/policy-checks#list-policy-checks
    #
    # for Policy Evaluations (which run on agents), you'll need a different API

    # Get all of this run's policy checks
    run_policy_checks=$(curl -s --header "Authorization: Bearer $TFE_TOKEN" ${TFE_ADDR}/api/v2/runs/${run_id}/policy-checks)

    # Check for the policy we care about... and only if they failed
    checked_policy_result=$(
        echo ${run_policy_checks} | \
        jq ".data[0].attributes.result.sentinel.data.global.policies[] | select(.policy.name == \"${POLICY_TO_CHECK}\")"
    )

    checked_policy_pass=$( echo ${checked_policy_result} | jq .result )

    if ! ${checked_policy_pass} ; then
        return 1
    fi

    return 0
}

function check_workspace() {
    workspace_id=$1

    # API is paged. We'll only check the first few.
    # Again... proof-of-concept.
    # A real script would want to filter, and limit to maybe only one recent run
    # https://developer.hashicorp.com/terraform/cloud-docs/api-docs/run#list-runs-in-a-workspace
    runs=$( curl -s --header "Authorization: Bearer $TFE_TOKEN" ${TFE_ADDR}/api/v2/workspaces/${workspace_id}/runs )

    for run_id in $( echo ${runs} |  jq -r .data[].id ); do
        check_workspace_run ${run_id}
        if [ $? -ne 0 ]; then
            echo "${run_id} is a fail" >&2
            return 1
        fi

        #echo "${run_id} is ok" >&2
    done

    return 0
}

# TODO: Check All Workspaces

workspace_id=ws-deBHqLh9a2g2Ae5j
check_workspace "ws-deBHqLh9a2g2Ae5j"
if [ $? -ne 0 ]; then
    echo "${workspace_id} is a fail" >&2
else
    echo "${workspace_id} is ok" >&2
fi

echo

workspace_id=ws-dgdVj6UEKS7zTqB1
check_workspace "ws-dgdVj6UEKS7zTqB1"
if [ $? -ne 0 ]; then
    echo "${workspace_id} is a fail" >&2
else
    echo "${workspace_id} is ok" >&2
fi
