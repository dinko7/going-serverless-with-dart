include secrets.mk

.PHONY: clean

FUNCTION_TARGET = oncreatetodo
REGION = europe-west3
FUNCTION_SIGNATURE_TYPE = cloudevent

build:
	dart run build_runner build --delete-conflicting-outputs

test: clean build
	dart test

clean:
	dart run build_runner clean
	rm -rf bin/server.dart

run: build
	dart run bin/server.dart --target=$(FUNCTION_TARGET) --signature-type=cloudevent


# See: https://cloud.google.com/sdk/gcloud/reference/run/deploy
deploy: build
	gcloud run deploy $(FUNCTION_TARGET) \
		--source=. \
		--no-allow-unauthenticated \
		--project=$(PROJECT_ID) \
		--region=$(REGION) \
		--set-env-vars PROJECT_ID=$(PROJECT_ID)

# See: https://cloud.google.com/sdk/gcloud/reference/eventarc/triggers/create
trigger:
	gcloud eventarc triggers create $(FUNCTION_TARGET) \
    --location=$(REGION) \
    --destination-run-service=$(FUNCTION_TARGET) \
    --event-filters="type=google.cloud.firestore.document.v1.created" \
    --event-filters="database=(default)" \
    --event-filters="namespace=(default)" \
    --event-filters-path-pattern="document=todos/{todoId}" \
    --event-data-content-type="application/protobuf" \
    --service-account="$(EVENT_ARC_SERVICE_ACCOUNT_NAME)@$(PROJECT_ID).iam.gserviceaccount.com" \
		--project=$(PROJECT_ID)

