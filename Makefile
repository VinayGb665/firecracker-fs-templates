
dependencies: ## Download firecracker and firectl binaries
	sh deps/download-dependencies.sh
python2: ## Build alpine based python2 rootfs creator image (256MB rootfs)
	docker build -t python2fire src/python2/
python3: ## Build ubuntu based python3 rootfs creator image (1024MB rootfs bigger cuz of dependencies)
	docker build -t python3fire src/python3/

test-python3: python3
	sh tests/test-python3.sh

clean-test:
	rm tests/demo/hello-vmlinux.bin tests/demo/rootfs
clean-deps: ## Remove binaries
	rm deps/firectl deps/firecracker
clean :
	docker image rm python2fire python3fire