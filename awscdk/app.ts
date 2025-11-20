#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { CdkLocalStackDemoStack } from '../lib/app-stack';

const app = new cdk.App();
new CdkLocalStackDemoStack(app, 'AppStack', {
   env: { account: 'caller-identity-Account', region: 'ca-central-1' },
})
;



