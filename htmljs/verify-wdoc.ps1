param([string]$WdocDir = (Join-Path $PSScriptRoot "..\wdoc"))

function Read-WdocHtml([string]$Path) {
    $content = Get-Content $Path -Raw
    $hexMatches = [regex]::Matches($content, '0x[0-9a-fA-F]{2}')
    $bytes = New-Object byte[] $hexMatches.Count
    for ($i = 0; $i -lt $hexMatches.Count; $i++) {
        $bytes[$i] = [Convert]::ToByte($hexMatches[$i].Value.Substring(2), 16)
    }
    $input = New-Object IO.MemoryStream(,$bytes)
    $out = New-Object IO.MemoryStream
    $gz = New-Object IO.Compression.GZipStream($input, [IO.Compression.CompressionMode]::Decompress)
    $gz.CopyTo($out)
    $gz.Close()
    return [Text.Encoding]::UTF8.GetString($out.ToArray())
}

$checks = @(
    @{ File = 'portuguese-br_control_htm.h'; Need = @('mazza-hc-fix','Controle Umidade','66.67%','#dlg_saveas .modal-content','mazza-ui-fix') },
    @{ File = 'portuguese-br_index_htm.h'; Need = @('mazza-humidity-pane-fix','mazza-title-hook','mazza-watermark','mazza-index-watermark') },
    @{ File = 'portuguese-br_log_htm.h'; Need = @('ajaxErrorText','mazza-ui-fix') }
)

foreach ($c in $checks) {
    $path = Join-Path $WdocDir $c.File
    $h = Read-WdocHtml $path
    Write-Host "=== $($c.File) ==="
    foreach ($n in $c.Need) {
        $ok = $h -match [regex]::Escape($n)
        Write-Host ("  {0}: {1}" -f $n, $(if ($ok) { 'OK' } else { 'FALTA' }))
    }
}
