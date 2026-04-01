#!/usr/bin/env bash

# exports.sh
#
# Exports environment variables for the stacks-node app.
# Umbrel sources this file so that the app's IP and port are available
# to the dashboard (for the "Open" button) and to any other apps that
# declare stacks-node as a dependency.

export APP_EXPOLABS_STACKS_NODE_IP="${APP_EXPOLABS_STACKS_NODE_IP:-10.21.21.51}"
export APP_EXPOLABS_STACKS_NODE_PORT="21443"
