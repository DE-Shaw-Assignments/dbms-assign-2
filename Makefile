.PHONY: run

run: check_python run_script

check_python:
	@if command -v python3 > /dev/null; then \
		echo "Python is installed"; \
	else \
		echo "Python is not installed"; \
		exit 1; \
	fi

run_script:
	@echo "Running the Python script..."
	python3 auto.py
