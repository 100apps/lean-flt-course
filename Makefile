.PHONY: setup check shell docs docs-serve upstream github-login clean-status

setup:
	docker compose build lean
	docker compose run --rm lean bash -lc 'lake update && lake exe cache get && lake build'

check:
	docker compose run --rm lean lake build

shell:
	docker compose run --rm lean bash

docs:
	docker compose build docs
	docker compose run --rm docs mkdocs build --strict

docs-serve:
	docker compose up --build docs

upstream:
	docker compose run --rm lean scripts/fetch-upstream.sh

github-login:
	docker compose build lean
	docker compose run --rm github auth login --hostname github.com --git-protocol https --web

clean-status:
	docker compose run --rm lean lake clean
