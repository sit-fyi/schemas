SCHEMAS=$(wildcard *.json)
VALID=$(patsubst %.json,%.valid,${SCHEMAS})

all: $(VALID)

%.valid: %.json
	@[[ "$<" =~ package(-lock)?.json ]] && true || node_modules/ajv-cli/index.js -s draft-07/schema -d $<

node_modules/ajv-cli/index.js:
	npm install
