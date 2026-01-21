#!/bin/bash
#
# This script deploys the Innovation Sandbox on AWS solution into the Protagona account.
#
# This script will perform the following tasks:
#   1. Deploy the account pool stack.
#   2. Deploy the IDC stack.
#   3. Deploy the data stack.
#   4. Deploy the compute stack.
#
# Usage: ./deploy-protagona.sh
#
# Environment Variables:
#   AWS_PROFILE: The AWS profile to use for the deployment.
#
# Example:
#   AWS_PROFILE="protagona-root" ./deploy-protagona.sh
#
# Note: This script assumes that the .env file is already configured with the correct values.
export AWS_PROFILE="protagona-root"
echo "Deploying account pool stack..."
npm run deploy:account-pool
echo "Deploying IDC stack..."
npm run deploy:idc

export AWS_PROFILE="sandbox-main"
echo "Deploying data stack..."
npm run deploy:data
echo "Deploying compute stack..."
npm run deploy:compute
echo "Deployment complete!"

unset AWS_PROFILE