# sof-elk-setup
Some customization for SOF-ELK, download VM from

https://github.com/philhagen/sof-elk/blob/master/VM_README.md

Running setup.sh will do the following:

Adds (anonymous) SMB access to input folders and the ability to index evtx files under the hostlog folder.

Create a hostlogs folder for storage of evtx files

Download and install the evtx to elk utilities

However, you will need to manually run the evtxtoelk.py script in order to get the logs into ES or run the bulk_import.sh script under /home/elk_user directory once all logs are added to the /logstash/hostlogs directory

Taken from https://dragos.com/blog/20180717EvtxToElk.html
