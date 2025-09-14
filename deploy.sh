#!/usr/bin/env bash

# Production deploy script

set -euo pipefail

COMPOSE_FILE="docker-compose.prod.yml"
ENV_FILE=".env.prod"

usage() {
  echo "Usage: $0 [--no-cache] [--logs]"
}

check_prereqs() {
  if ! docker info >/dev/null 2>&1; then
    echo "Docker is not running. Please start Docker Desktop and try again." >&2
    exit 1
  fi
  if command -v docker-compose >/dev/null 2>&1; then
    COMPOSE_CMD="docker-compose"
  else
    COMPOSE_CMD="docker compose"
  fi
}

main() {
  NO_CACHE=false
  SHOW_LOGS=false

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --no-cache)
        NO_CACHE=true
        ;;
      --logs)
        SHOW_LOGS=true
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        echo "Unknown option: $1" >&2
        usage
        exit 1
        ;;
    esac
    shift
  done

  check_prereqs

  BUILD_ARGS=""
  if [ "$NO_CACHE" = true ]; then
    BUILD_ARGS="--no-cache"
  fi

  $COMPOSE_CMD -f "$COMPOSE_FILE" --env-file "$ENV_FILE" up -d --build $BUILD_ARGS

  $COMPOSE_CMD -f "$COMPOSE_FILE" ps
  if [ "$SHOW_LOGS" = true ]; then
    $COMPOSE_CMD -f "$COMPOSE_FILE" logs -f
  fi
}

main "$@"
