{{- define "name" -}}
{{- printf "%s" .Values.clusterName | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "endpoints" -}}
{{- $replicas := int (toString (.Values.replicas)) }}
{{- $name := (include "name" .) }}
  {{- range $i, $e := untilStep 0 $replicas 1 -}}
{{ $name }}-{{ $i }},
  {{- end -}}
{{- end -}}