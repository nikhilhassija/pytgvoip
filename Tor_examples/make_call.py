from tgvoip import VoIPServerConfig, VoIPFileStreamService, VoIPController, VoIPFileStreamCallMixin
import pyrogram
import time
import sys

client = pyrogram.Client(session_name = 'session', proxy=dict(
        hostname="127.0.0.1",
        port=9050,
        username="",
        password=""
    ))
client.start()

voip_service = VoIPFileStreamService(client, receive_calls=False)
call = voip_service.start_call('@Voiptor')

call.play('51_sox_48k.raw')

@call.on_call_state_changed
def state_changed(call, state):
    print('State changed:', call, state)
    if state == 11:
    	sys.exit(0)
