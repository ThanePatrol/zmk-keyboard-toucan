.PHONY: get-artifact 

help: ## Display this screen
	@echo "Usage: make [target]"
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?##' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s \033[0m %s\n", $$1, $$2}'

get-artifact: ## Gets the latest artifact  
	rm -r firmware
	ID=$$(gh run list --status success --repo ThanePatrol/zmk-keyboard-toucan --limit 1 --json databaseId --jq '.[0].databaseId'); \
	echo $$ID; \
	gh run download $$ID --repo ThanePatrol/zmk-keyboard-toucan
