#!/bin/bash
# SCRIPT: sending_rsa_dsa_keys.sh (adapted from page 24 of the book , Listing 1-4 and Listing 1-5)
# I have not tested it on virtual machines yet! 
PURPOSE="This script is used to set up DSA or RSA  SSH keys. \n It must \
 be executed by the user who needs the keys to be setup on some remote host.\n"
REM_HOST=$1
if [ -z "$REM_HOST" ]; then
	echo -e $PURPOSE ; echo -e "Usage: \n "$0" <ip-addr-of-remote-host>" ; exit
fi
if [ -r $HOME/.ssh/id_dsa.pub ]; then 
	cat $HOME/.ssh/id_dsa.pub | ssh $REM_HOST "cat >> ~/.ssh/authorized_keys" || echo "Fail to transfer DSA keys"
elif [ -r $HOME/.ssh/id_rsa.pub ]; then 
	cat $HOME/.ssh/id_rsa.pub | ssh $REM_HOST "cat >> ~/.ssh/authorized_keys" || echo "Fail to transfer RSA keys"
else 
	echo "No DSA neither RSA keys are set up in this host for $USER" 
    echo "Set your  keys with : ssh-keygen "; exit
fi
