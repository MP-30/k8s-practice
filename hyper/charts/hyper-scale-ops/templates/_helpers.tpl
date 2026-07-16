{{/*
Expand the chart name.
*/}}
{{- define "hyper-scale-ops.name" -}}
hyper-scale-ops
{{- end }}

{{/*
Common labels.
*/}}
{{- define "hyper-scale-ops.labels" -}}
app: {{ include "hyper-scale-ops.name" . }}
{{- end }}