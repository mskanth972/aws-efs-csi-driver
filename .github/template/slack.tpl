{{ $empty := true }}
{{- range . }}
{{- if (gt (len .Vulnerabilities) 0) }}
{{ $empty = false }}
{{- end }}
{{- end }}
{{- if not $empty }}
{{- range . }}
{{- if (gt (len .Vulnerabilities) 0) }}
{{ $targetName := (.Target) }}
{{- if not (contains .Type .Target) }}
{{ $targetName = (cat .Target .Type) }}
{{- end }}
{{ $targetName }}
{{ printf "+--------------------------------+------------------+----------+--------------------------------+--------------------------------+" }}
{{ printf "| Library                        | Vulnerability    | Severity |  Installed Version             | Fixed Version                  |" }}
{{ printf "+--------------------------------+------------------+----------+--------------------------------+--------------------------------+" }}
{{- range .Vulnerabilities }}
{{ printf "| %-30s | %-16s | %-8s | %-30s | %-30s |"  (.PkgName|abbrev 30) .VulnerabilityID .Severity (.InstalledVersion|abbrev 30) (.FixedVersion|abbrev 30) }}
{{- end }}
{{ printf "+--------------------------------+------------------+----------+--------------------------------+--------------------------------+" }}
{{- end }}
{{- end }}
{{- else }}
No vulnerabilities found
{{- end }}
