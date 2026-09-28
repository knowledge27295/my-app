from pathlib import Path

import yaml


FILES = [
    Path(".github/workflows/renovate.yml"),
    Path(".github/workflows/validate.yml"),
]


for file_path in FILES:
    print(f"Validating {file_path}...")

    with file_path.open("r", encoding="utf-8") as file:
        yaml.safe_load(file)

    print(f"OK: {file_path}")
