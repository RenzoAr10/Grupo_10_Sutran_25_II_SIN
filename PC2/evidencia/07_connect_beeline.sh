#!/usr/bin/env bash
set -euo pipefail
beeline -u "jdbc:hive2://localhost:10000/default" -n maria_dev
