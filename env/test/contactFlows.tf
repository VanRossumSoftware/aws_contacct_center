resource "aws_connect_contact_flow" "000_IncomingCall" {
  instance_id  = var.instanceId
  name         = "000_IncomingCall"
  description  = "Start flow for every incoming call"
  type         = "CONTACT_FLOW"
  filename     = "000_IncomingCall.json"
  content_hash = filebase64sha256("000_IncomingCall.json")
}

#TODO: Write an app to list all contact flows in the instance and describe them into .json files
#TODO: Write a terraform to put the CLI contact flows into terraform data objects
#TODO: Update above method to use data object instead of hardcoded json
