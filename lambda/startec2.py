import boto3
import os

target_tag_key = os.environ['TARGET_TAG_KEY']
target_tag_value = os.environ['TARGET_TAG_VALUE']
client = boto3.resource('ec2')

def start_instance():
    filters = [{
        'Name': 'tag:'+ target_tag_key,
        'Values': [target_tag_value]
        },
        {
            'Name': 'instance-state-name',
            'Values': ['stopped']
        }
    ]
    instances = client.instances.filter(Filters=filters)
    StoppedInstances = [instance.id for instance in instances]
    print(StoppedInstances)
    if len(StoppedInstances) > 0:
        starting = client.instances.filter(InstanceIds=StoppedInstances).start()
        print("Starting instances")
    else:
        print("No instances STOPPED")
    return 'Ok'

def lambda_handler(event, context):
    start_instance()
