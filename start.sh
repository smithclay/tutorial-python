#!/bin/sh

# pyenv activate rookout
# export ROOKOUT_TOKEN=...


export OTEL_RESOURCE_ATTRIBUTES=service.name=tutorial-pyton
export OTEL_EXPORTER=otlp_span

# Requires OpenTelemetry collector to be running @ localhost:55680
export OTEL_EXPORTER_OTLP_SPAN_ENDPOINT=localhost:55680
export OTEL_EXPORTER_OTLP_SPAN_INSECURE=True
export OTEL_BSP_MAX_EXPORT_BATCH_SIZE=1
opentelemetry-instrument python app.py

# generate some traffic
# while sleep 5; do curl -s localhost:5000/static/index.html; done