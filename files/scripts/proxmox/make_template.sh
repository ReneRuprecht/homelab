#!/bin/bash
# ============================================================
# make_template.sh - Dynamisches Proxmox Cloud-Init Template Script
# Beispiel: ./make_template.sh 100 debian-13 ./debian-13-generic-amd64.raw
# ============================================================

if [ $# -lt 3 ]; then
  echo "Nutzung: $0 <VMID> <NAME> <IMAGE_PATH>"
  echo "Beispiel: $0 100 debian-13 ./debian-13-generic-amd64.raw"
  exit 1
fi

VMID=$1
NAME=$2
IMAGE_PATH=$3

# ==== Konfiguration ====
STORAGE="internal-storage"       # Dein Ziel-Storage (z. B. zfs-ssd, local-lvm)
BRIDGE="vmbr0"                   # Dein Standard-Netzwerk-Bridge
MEMORY=2048                      # RAM in MB
CORES=2                          # CPU-Kerne

echo "Erstelle Template:"
echo "  → VMID:  $VMID"
echo "  → Name:  $NAME"
echo "  → Image: $IMAGE_PATH"
echo "  → Storage: $STORAGE"
echo "  → Bridge: $BRIDGE"
echo "------------------------------------------------------------"

# ==== Vorprüfung ====
if ! [ -f "$IMAGE_PATH" ]; then
  echo "Image-Datei '$IMAGE_PATH' nicht gefunden."
  exit 1
fi

if qm status $VMID &>/dev/null; then
  echo "VM $VMID existiert bereits – bitte löschen oder andere ID wählen."
  exit 1
fi

# ==== VM erstellen ====
echo "Erstelle neue VM..."
qm create $VMID \
  --name "$NAME" \
  --memory $MEMORY \
  --cores $CORES \
  --net0 virtio,bridge=$BRIDGE

# ==== Image importieren ====
echo "Importiere Image..."
qm importdisk $VMID "$IMAGE_PATH" $STORAGE

# ==== Disk anhängen ====
echo "Hänge Disk an..."
qm set $VMID --scsihw virtio-scsi-pci --scsi0 ${STORAGE}:vm-${VMID}-disk-0

# ==== Boot-Optionen  ====
echo "Setze Boot"
qm set $VMID \
  --boot c \
  --bootdisk scsi0 \
  --agent enabled=1

# ==== Cloud-Init hinzufügen ====
echo "Füge Cloud-Init-Laufwerk hinzu..."
qm set $VMID --ide2 ${STORAGE}:cloudinit

# ==== Serielle Konsole ====
qm set $VMID --serial0 socket --vga serial0

# ==== Template finalisieren ====
echo "Erstelle Template..."
qm template $VMID

echo "Fertig! Template '$NAME' (VMID: $VMID) wurde erfolgreich erstellt."
