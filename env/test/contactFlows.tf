#resource "aws_connect_contact_flow" "IncomingCall" {
#  instance_id  = var.instanceId
#  name         = "000_IncomingCall"
#  description  = "Start flow for every incoming call"
#  type         = "CONTACT_FLOW"
#  filename     = "000_IncomingCall.json"
#  content_hash = filebase64sha256("../../src/contactFlows/000_IncomingCall.json")
#}

#TODO: Write an app to list all contact flows in the instance and describe them into .json files
#TODO: Write a terraform to put the CLI contact flows into terraform data objects
#TODO: Update above method to use data object instead of hardcoded json


#aws connect describe-contact-flow --instance-id 86e98bec-ba70-4283-b544-2d3d63888543 --region us-east-1 --contact-flow-id a40f3f95-3140-4e08-af98-cec066e88424 --> 000_IncomingCall.json
