help:
	@echo "Available targets:"
	@echo "  run    - Bootstrap the full environment (install tools, provision cluster)"
	@echo "  down   - Destroy the cluster and all resources"
	@echo "  tools  - Install necessary tools only"
	@echo "  tofu   - Initialize OpenTofu"
	@echo "  apply  - Apply OpenTofu configuration"

run:
	@bash scripts/setup.sh

tools:
	@curl -fsSL https://get.opentofu.org/install-opentofu.sh | sh -s -- --install-method standalone
	@curl -sS https://webi.sh/k9s | bash

tofu:
	@cd bootstrap && tofu init

apply:
	@cd bootstrap && tofu apply -auto-approve

down:
	@cd bootstrap && tofu destroy -auto-approve
