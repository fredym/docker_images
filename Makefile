define HELP_MSG

  fedora:  Builds an image with a bare Fedora system.
  rails:   Builds a basic rails runtime environment.

endef
export HELP_MSG



default:
	@echo "$$HELP_MSG"

fedora: fedora/Dockerfile fedora/fedora.tar.xz
	docker build -t fredym/fedora -f fedora/Dockerfile fedora/
	docker push fredym/fedora

rails: rails/Dockerfile
	docker build -t fredym/rails -f rails/Dockerfile rails/
	docker push fredym/rails
