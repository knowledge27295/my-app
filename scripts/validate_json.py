import json
from pathlib import Path


FILES = [
    Path("renovate.json"),
    Path("demo/package.json"),
    Path("examples/renovate-github-app-secret.example.json"),
]


for file_path in FILES:
    print(f"Validating {file_path}...")

    with file_path.open("r", encoding="utf-8") as file:
        json.load(file)

    print(f"OK: {file_path}")
