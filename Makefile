env-all: env-build env-run

env-build:
	docker-compose build

env-run:
	docker-compose run --rm --service-ports develop

serve:
	polymer serve --port 4000 & browser-sync start --port 4001 --ui-port 4002 --proxy localhost:4000/components/paper-calendar/demo/ --files '*.html' --no-open
