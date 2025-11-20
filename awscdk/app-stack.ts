import * as cdk from 'aws-cdk-lib';
import * as s3 from 'aws-cdk-lib/aws-s3';
import * as iam from 'aws-cdk-lib/aws-iam';
import { Construct } from 'constructs';
import * as ec2 from 'aws-cdk-lib/aws-ec2';

export class CdkLocalStackDemoStack extends cdk.Stack {
    constructor(scope: Construct, id: string, props?: cdk.StackProps) {
        super(scope, id, props);

        // Create S3 Bucket
        const bucket = new s3.Bucket(this, 'MyBucket', {
            bucketName: `my-unique-bucket-${id.toLowerCase()}`,
            removalPolicy: cdk.RemovalPolicy.DESTROY,
        });

        // Create IAM Role
        const role = new iam.Role(this, 'MyRole', {
            assumedBy: new iam.ServicePrincipal('s3.amazonaws.com'),
        });

        // Attach Policy to Role
        role.addToPolicy(new iam.PolicyStatement({
            actions: ['s3:*'],
            resources: [bucket.bucketArn],
        }));

        // create VPC
        const vpc = new ec2.Vpc(this, 'Vpc', {
          ipAddresses: ec2.IpAddresses.cidr('10.0.0.0/16')
        });

        // Security group allowing SSH
        const sg = new ec2.SecurityGroup(this, 'InstanceSG', {
          vpc,
          description: 'Allow SSH access',
          allowAllOutbound: true,
        });

        sg.addIngressRule(ec2.Peer.anyIpv4(), ec2.Port.tcp(22), 'Allow SSH');

        // EC2 instance
        const compute = new ec2.Instance(this, 'AWS-CDK-EC2', {
          vpc,
          instanceType: ec2.InstanceType.of(
            ec2.InstanceClass.T2,
            ec2.InstanceSize.MICRO,
          ),
          machineImage: new ec2.AmazonLinuxImage(),
          securityGroup: sg,
        });
  }
}