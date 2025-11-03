import sys
import json
import yaml
from pathlib import Path
import fnmatch

if len(sys.argv) < 2 or not sys.argv[1].strip():
    print(json.dumps({"include": []}))
    sys.exit(0)

changed_dirs = json.loads(sys.argv[1])

with open("playbook_mapping.yml") as f:
    mapping_file = yaml.safe_load(f)

mapping = mapping_file.get("patterns", {})

selected = set()

for folder in changed_dirs:
    parts = Path(folder).parts
    if len(parts) < 3:
        continue
    env = parts[0]  
    var_type = parts[1]
    name = parts[2]   

    for playbook, patterns in mapping.items():
        if any(fnmatch.fnmatch(name, pat) for pat in patterns):
            selected.add((playbook, env))

def sort_key(item):
    playbook, env = item
    return (0 if playbook.startswith("dns") else 1, playbook, env)

matrix = [{"playbook": pb, "env": env} for pb, env in sorted(selected, key=sort_key)]
print(str(json.dumps(matrix, indent=2)))
