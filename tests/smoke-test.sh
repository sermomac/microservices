
#!/usr/bin/env bash
set -uo pipefail
# Usage:
# TEST_URLS="http://localhost:4004/actuator/health http://localhost:4000/actuator/health" \
#   bash tests/smoke-test.sh

if ! command -v curl >/dev/null 2>&1; then
  echo "ERROR: curl is required."
  exit 2
fi

if [[ -z "${TEST_URLS:-}" ]]; then
  echo "ERROR: Set TEST_URLS to the health-check URLs your services expose."
  echo 'Example: TEST_URLS="http://localhost:8080/actuator/health" bash tests/smoke-test.sh'
  exit 2
fi

passed=0
failed=0

for url in $TEST_URLS; do
  echo "Testing: $url"

  if status=$(curl --silent --show-error \
      --output /dev/null \
      --write-out '%{http_code}' \
      --connect-timeout 3 \
      --max-time 10 \
      "$url"); then

    if [[ "$status" =~ ^2[0-9][0-9]$ ]]; then
      echo "PASS: HTTP $status"
      ((passed += 1))
    else
      echo "FAIL: HTTP $status"
      ((failed += 1))
    fi
  else
    echo "FAIL: Could not reach endpoint"
    ((failed += 1))
  fi
done

echo
echo "Results: $passed passed, $failed failed"

if (( failed > 0 )); then
  exit 1
fi
