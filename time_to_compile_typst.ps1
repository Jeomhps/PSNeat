$start_time = Get-Date

& typst compile src/main.typ output.pdf

$end_time = Get-Date
$duration = ($end_time - $start_time).TotalSeconds

Write-Output "Compilation Time: $duration seconds"
