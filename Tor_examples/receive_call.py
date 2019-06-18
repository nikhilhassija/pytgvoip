import pyrogram

from tgvoip import VoIPServerConfig, VoIPFileStreamService, VoIPIncomingFileStreamCall
import time,sys

client = pyrogram.Client('recv_session')
#client = pyrogram.Client(session_name = 'recv_session', proxy=dict(
#        hostname="127.0.0.1",
#        port=9050,
#        username="",
#        password=""
#    ))

client.start()
service = VoIPFileStreamService(client)

@service.on_incoming_call
def process_call(call: VoIPIncomingFileStreamCall):
    call.accept()
    out_file = './output/output' + str(int(time.time())) + '.raw'
    call.set_output_file(out_file)

client.idle()
