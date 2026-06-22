import argparse
import fnmatch
import json
from pathlib import Path

import yaml

parser = argparse.ArgumentParser()
parser.add_argument("--mode", required=True, choices=["terraform", "ansible", "docker"])
parser.add_argument("--input", required=True)

args = parser.parse_args()

mode = args.mode
changed_dirs = json.loads(args.input)

mapping = {}

if mode == "ansible":
    with open("ansible/playbook_mapping.yml") as f:
        mapping_file = yaml.safe_load(f)
        mapping = mapping_file.get("patterns", {})


def normalize(path):
    return Path(path)


def terraform_matrix(paths):
    selected = set()

    for p in paths:
        if not p.startswith("terraform/environments/"):
            continue

        parts = Path(p).parts

        # terraform/environments/<env>/<component>
        if len(parts) < 4:
            continue

        env = parts[2]
        component = parts[3]

        if Path(component).suffix:
            continue

        selected.add((env, component))

    return [{"env": env, "component": comp} for env, comp in sorted(selected)]


def ansible_matrix(paths, mapping):
    selected = set()

    for p in paths:
        parts = Path(p).parts

        if "inventory" in p:
            # ansible/inventory/<env>/<type>/<name>
            if len(parts) < 5:
                continue

            env = parts[2]
            name = Path(parts[4]).stem

            for playbook, patterns in mapping.items():
                if any(fnmatch.fnmatch(name, pat) for pat in patterns):
                    selected.add((env, playbook))

        elif "playbook" in p:
            # ansible/playbook/<env>/<file>.yml
            if len(parts) != 4:
                continue

            env = parts[2]
            name = Path(parts[3]).stem

            for playbook, patterns in mapping.items():
                if any(fnmatch.fnmatch(name, pat) for pat in patterns):
                    selected.add((env, playbook))

    return [{"env": env, "playbook": pb} for env, pb in sorted(selected)]


def docker_matrix(paths):
    selected = set()

    for p in paths:
        if not p.startswith("docker/ci/"):
            continue

        parts = Path(p).parts

        if len(parts) < 3:
            continue

        selected.add("/".join(parts[:3]))

    return [{"path": path} for path in sorted(selected)]


if mode == "terraform":
    output = terraform_matrix(changed_dirs)

elif mode == "ansible":
    output = ansible_matrix(changed_dirs, mapping)

elif mode == "docker":
    output = docker_matrix(changed_dirs)

else:
    output = []


print(json.dumps(output, indent=2))
