# 🏠 Homelab
# Intro
Das Repository dokumentiert mein selbst gehostetes Homelab basierend auf Proxmox und Kubernetes. 
Ziel ist es, verschiedene Technologien, Tools und Konzepte durch praktische Erfahrungen besser zu verstehen. 
Dabei versuche ich, so viel wie möglich zu automatisieren und die gesamte Infrastruktur als Code abzubilden.

# 💻 Hardware
Die eingesetzte Hardware befindet sich in einem selbstgebauten 10" Rack. 
Aktuell kommt ein Beelink S12 Mini Pro mit 32 GB RAM, einer 512 GB SSD und einer 256 GB NVMe zum Einsatz (Proxmox). 
Zukünftig sollen weitere PCs in das selbstgebaute 10"-Rack verbaut werden.

# Proxmox
Die VMs werden mit Terraform erstellt. Dabei werden grundlegende Ressourcen wie CPU, RAM, Netzwerk und Speicher definiert und anschließend in Proxmox bereitgestellt. Die Installation und Konfiguration der Software übernimmt Ansible. Mithilfe von Ansible Playbooks wird die benötigte Software sowie deren Konfiguration konsistent eingerichtet und bereitgestellt.

# Kubernetes
Das laufende Kubernetes Cluster soll, soweit möglich, vollständig mittels GitOps ausgestattet und konfiguriert werden. Geplant ist, interne Services wie Prometheus und Grafana mit FluxCD zu deployen und zu verwalten, während eigene Apps und Services über ArgoCD bereitgestellt und gemanagt werden. Ziel ist es, anhand praktischer Beispiele ein besseres Verständnis für beide Systeme zu entwickeln.

# Services

Aktuell betreiben wir eine Kombination aus virtuellen Maschinen und Kubernetes-Services.
Die Umgebung wird kontinuierlich weiterentwickelt und angepasst.

## Virtuelle Maschinen (VMs)
- 3× **Vault**, die derzeit für Kubernetes-Secrets verwendet werden  
- 1× **Loadbalancer**, der Anfragen an die Vault-Instanzen weiterleitet  
- 3× **K8s** (1 Master und 2 Nodes)  
- 1× **VM als Netzwerkspeicher**, die von Kubernetes-Services zur Datenspeicherung genutzt wird  

## Kubernetes-Services
- **FluxCD**  
- **Prometheus**  
- **Grafana**  
- **External Secrets**  
- **ArgoCD**
  
# Configs
## Ansible
Im Ansible-Ordner befindet sich die Pipfile, welche mit dem Befehl ```pipenv shell``` aktiviert werden kann. Fehlende Python Pakete lassen sich anschließend mit ```pipenv install --dev``` installieren. Um die benötigten Ansible Collections und Rollen zu installieren, kann ```ansible-galaxy install -r requirements.yml``` verwendet werden.

## Terraform
### Proxmox
Für die Verbindung zum Proxmox werden folgende Environment Variablen benötigt.
```
export PM_API_URL=<URL>
export PM_API_TOKEN_ID=<ID>
export PM_API_TOKEN_SECRET=<SECRET>
```
### VMs
Für die Erstellung von VMs werden folgende Environment Variablen benötigt.
```
export TF_VAR_vm_user=<vm_user>
export TF_VAR_vm_ssh_keys=<ssh_keys>
```
