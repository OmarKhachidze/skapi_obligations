.PHONY: get clean run analyze lint-strict l10n help

# Install dependencies
get:
	flutter pub get

# Clean build artifacts
clean:
	flutter clean

# Run the app on a connected device
run:
	flutter run

# Run the Dart analyzer (linter)
analyze:
	dart analyze

# Run analyzer with warnings as errors
lint-strict:
	dart analyze --fatal-infos --fatal-warnings

# Generate Flutter localization files from ARB files
l10n:
	flutter gen-l10n

# Help message
help:
	@echo "Available commands:"
	@echo "  make get          - Install dependencies"
	@echo "  make clean        - Clean build artifacts"
	@echo "  make run          - Run the app on a connected device"
	@echo "  make analyze      - Run Dart analyzer"
	@echo "  make lint-strict  - Analyze and treat warnings as errors"
	@echo "  make l10n         - Generate localization files from ARB"