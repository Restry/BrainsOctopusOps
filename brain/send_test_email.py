import os
from azure.communication.email import EmailClient

connection_string = os.getenv("ACS_CONNECTION_STRING", "endpoint=https://octopusopscomm.unitedstates.communication.azure.com/;accesskey=<YOUR_ACCESS_KEY>")
client = EmailClient.from_connection_string(connection_string)

message = {
    "senderAddress": "DoNotReply@octopus-ops.net",
    "content": {
        "subject": "Octopus Ops Brain: Azure Infrastructure Ready!",
        "plainText": "Dad, the Azure Email Infrastructure for octopus-ops.net is officially LIVE. 🐙📧",
        "html": "<html><h1>Octopus Ops Brain - Success!</h1><p>Dad, the official domain <strong>octopus-ops.net</strong> is now fully integrated with our Azure Communication Services. External communication is active.</p></html>"
    },
    "recipients": {
        "to": [{"address": "michaelman@live.cn"}]
    }
}

try:
    poller = client.begin_send(message)
    result = poller.result()
    print(f"Message sent! ID: {result['id']}")
except Exception as ex:
    print(f"Error: {ex}")
