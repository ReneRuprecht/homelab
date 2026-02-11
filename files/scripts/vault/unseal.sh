#!/bin/bash

########################
#
# DEV / Test Script
# Unseal-Keys in Umgebungsvariablen, nicht für Produktion geeignet!"
#
########################

echo "########################"
echo "#"
echo "# DEV / Test Script"
echo "# Unseal-Keys in Umgebungsvariablen, nicht für Produktion geeignet!"
echo "#"
echo "########################"

KEY1="$VAULT_UNSEAL_KEY1"
KEY2="$VAULT_UNSEAL_KEY2"
KEY3="$VAULT_UNSEAL_KEY3"

if [ -z "$KEY1" ] || [ -z "$KEY2" ] || [ -z "$KEY3" ]; then
  echo "Fehler: Unseal Keys fehlen. Bitte VAULT_UNSEAL_KEY1/2/3 setzen."
  exit 1
fi

echo "Vault unsealing"
vault operator unseal "$KEY1"
vault operator unseal "$KEY2"
vault operator unseal "$KEY3"

echo "Vault sollte nun unsealed sein."

