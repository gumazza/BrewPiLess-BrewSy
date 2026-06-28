param(
    [string]$WdocDir = (Join-Path $PSScriptRoot "..\wdoc")
)

function Apply-MazzaTheme {
    param([string]$Html)
    $h = $Html

    # ordem importa: padrões específicos antes dos genéricos
    $rules = @(
        @{ Old = '.header{height:64px;background:#009688'; New = '.header{height:64px;background:#16213e' },
        @{ Old = '.header_title{font-size:32px;line-height:64px;color:#fff'; New = '.header_title{font-size:32px;line-height:64px;color:#e8a838' },
        @{ Old = '.header_version-display{font-size:14px;color:#fff'; New = '.header_version-display{font-size:14px;color:#8899aa' },
        @{ Old = '.btn--raised{background-color:#009688;color:#fff'; New = '.btn--raised{background-color:#e8a838;color:#1a1a2e' },
        @{ Old = '.btn--raised:hover{background-color:#00796b'; New = '.btn--raised:hover{background-color:#c9922f' },
        @{ Old = 'html,body{height:100%}'; New = 'html,body{height:100%;background:#1a1a2e;color:#eaeaea}' },
        @{ Old = '[side]{-webkit-box-shadow:0 2px 2px 0 rgba(0,0,0,.14),0 1px 5px 0 rgba(0,0,0,.12),0 3px 1px -2px rgba(0,0,0,.2);box-shadow:0 2px 2px 0 rgba(0,0,0,.14),0 1px 5px 0 rgba(0,0,0,.12),0 3px 1px -2px rgba(0,0,0,.2);width:300px;padding:16px;overflow-y:auto;background:#eee'; New = '[side]{-webkit-box-shadow:0 2px 2px 0 rgba(0,0,0,.35),0 1px 5px 0 rgba(0,0,0,.35),0 3px 1px -2px rgba(0,0,0,.35);box-shadow:0 2px 2px 0 rgba(0,0,0,.35),0 1px 5px 0 rgba(0,0,0,.35),0 3px 1px -2px rgba(0,0,0,.35);width:300px;padding:16px;overflow-y:auto;background:#16213e;color:#eaeaea;border:1px solid #2a3f5f;border-radius:12px' },
        @{ Old = '.footer{height:40px;background:#222'; New = '.footer{height:40px;background:#16213e;border-top:1px solid #2a3f5f' },
        @{ Old = '.footer{height:40px;background:#222;color:rgba(255,255,255,.87)'; New = '.footer{height:40px;background:#16213e;color:#8899aa;border-top:1px solid #2a3f5f' },
        @{ Old = '.modal-content{position:relative;padding:2.4rem;background:#fff'; New = '.modal-content{position:relative;padding:2.4rem;background:#16213e;color:#eaeaea;border:1px solid #2a3f5f;border-radius:12px' },
        @{ Old = '.modal-content{background-color:#fefefe'; New = '.modal-content{background-color:#16213e;color:#eaeaea' },
        @{ Old = '.card{display:block;box-shadow:0 1px 3px rgba(0,0,0,.12),0 1px 2px rgba(0,0,0,.24)'; New = '.card{display:block;background:#16213e;color:#eaeaea;border:1px solid #2a3f5f;border-radius:12px;box-shadow:0 1px 3px rgba(0,0,0,.35),0 1px 2px rgba(0,0,0,.45)' },
        @{ Old = '.profileTable tbody tr.odd{background:#eee}'; New = '.profileTable tbody tr.odd{background:#0f3460}' },
        @{ Old = '.profileTable tbody tr.even{background:#fff}'; New = '.profileTable tbody tr.even{background:#16213e}' },
        @{ Old = '.chart-legend-row.time{background-color:#ddeeff'; New = '.chart-legend-row.time{background-color:#0f3460' },
        @{ Old = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#0f3460'; New = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#90ee90' },
        @{ Old = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#e8a838'; New = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#90ee90' },
        @{ Old = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#009688'; New = '.rssi-bar{position:absolute;bottom:0;float:left;width:4px;border-radius:1px;background-color:#90ee90' },
        @{ Old = '.yellow-bar{position:absolute;z-index:10;bottom:0;height:3px;background:#458cff'; New = '.yellow-bar{position:absolute;z-index:10;bottom:0;height:3px;background:#e8a838' },
        @{ Old = '.yellow-bar{position:absolute;z-index:10;bottom:0;height:3px;background:#458CFF'; New = '.yellow-bar{position:absolute;z-index:10;bottom:0;height:3px;background:#e8a838' },
        @{ Old = '#networkselection button{border:0;border-radius:.3rem;background-color:#1fa3ec;color:#fff'; New = '#networkselection button{border:0;border-radius:8px;background-color:#e8a838;color:#1a1a2e' },
        @{ Old = '#advanced .modal-header{border-bottom:#00635a 2px solid}'; New = '#advanced .modal-header{border-bottom:#e8a838 2px solid}' },
        @{ Old = 'background:linear-gradient(to bottom,rgba(255,255,255,0) 96%,#009688 4%)'; New = 'background:#0f3460;border:1px solid #2a3f5f;border-radius:8px' },
        @{ Old = '-webkit-input-placeholder{color:#009688'; New = '-webkit-input-placeholder{color:#8899aa' },
        @{ Old = ':-moz-placeholder{color:#009688'; New = ':-moz-placeholder{color:#8899aa' },
        @{ Old = '::-moz-placeholder{color:#009688'; New = '::-moz-placeholder{color:#8899aa' },
        @{ Old = '::-webkit-input-placeholder{color:#009688'; New = '::-webkit-input-placeholder{color:#8899aa' },
        @{ Old = ':focus::placeholder{color:#009688'; New = ':focus::placeholder{color:#8899aa' },
        @{ Old = '#009688'; New = '#e8a838' },
        @{ Old = 'background-color:#009688'; New = 'background-color:#e8a838' },
        @{ Old = 'background:#009688'; New = 'background:#16213e' },
        @{ Old = 'color:#009688'; New = 'color:#e8a838' },
        @{ Old = 'border-bottom:solid 1px #009688'; New = 'border:1px solid #2a3f5f;border-radius:8px' },
        @{ Old = 'background-color:#00796b'; New = 'background-color:#c9922f' },
        @{ Old = '#00635a'; New = '#16213e' },
        @{ Old = '#00302c'; New = '#1a1a2e' },
        @{ Old = '#ffc107'; New = '#e8a838' },
        @{ Old = '#ededed'; New = '#16213e' },
        @{ Old = 'background:#eee'; New = 'background:#16213e' },
        @{ Old = 'background:#EEE'; New = 'background:#16213e' },
        @{ Old = 'background-color:#eee'; New = 'background-color:#16213e' },
        @{ Old = 'background-color:#fafafa'; New = 'background-color:#0f3460' },
        @{ Old = 'background-color:#FAFAFA'; New = 'background-color:#0f3460' },
        @{ Old = '#212121'; New = '#eaeaea' },
        @{ Old = '#757575'; New = '#8899aa' },
        @{ Old = '#bdbdbd'; New = '#2a3f5f' },
        @{ Old = '#BDBDBD'; New = '#2a3f5f' },
        @{ Old = '#424f5a'; New = '#8899aa' },
        @{ Old = '#306fa9'; New = '#e8a838' },
        @{ Old = '#e0e0e0'; New = '#2a3f5f' },
        @{ Old = 'background:#ccc'; New = 'background:#0f3460' },
        @{ Old = 'background:#CCC'; New = 'background:#0f3460' },
        @{ Old = 'background-color:#323232'; New = 'background-color:#0f3460' },
        @{ Old = 'background-color:#444'; New = 'background-color:#0f3460' },
        @{ Old = 'background:lightgray'; New = 'background:#0f3460' }
    )

    foreach ($rule in $rules) {
        $h = $h.Replace($rule.Old, $rule.New)
    }

    return $h
}

function Convert-HtmlToWdocHeader {
    param(
        [byte[]]$GzBytes,
        [string]$VarName
    )

    $sb = New-Object System.Text.StringBuilder
    [void]$sb.AppendLine("const unsigned char ${VarName}[] PROGMEM = {")
    for ($i = 0; $i -lt $GzBytes.Length; $i++) {
        if ($i % 12 -eq 0) { [void]$sb.Append('  ') }
        [void]$sb.Append('0x{0:x2}' -f $GzBytes[$i])
        if ($i -lt $GzBytes.Length - 1) { [void]$sb.Append(', ') }
        if ($i % 12 -eq 11) { [void]$sb.AppendLine('') }
    }
    if ($GzBytes.Length % 12 -ne 0) { [void]$sb.AppendLine('') }
    [void]$sb.AppendLine('};')
    [void]$sb.AppendLine("")
    [void]$sb.AppendLine("unsigned int dist_${VarName}_len = $($GzBytes.Length);")
    return $sb.ToString()
}

function Update-WdocHeader {
    param([string]$Path)

    $content = Get-Content $Path -Raw
    if ($content -notmatch 'const unsigned char (\w+)\[\] PROGMEM') { return $false }
    $varName = $Matches[1]

    $hexMatches = [regex]::Matches($content, '0x[0-9a-fA-F]{2}')
    $bytes = New-Object byte[] $hexMatches.Count
    for ($i = 0; $i -lt $hexMatches.Count; $i++) {
        $bytes[$i] = [Convert]::ToByte($hexMatches[$i].Value.Substring(2), 16)
    }

    $input = New-Object System.IO.MemoryStream(,$bytes)
    $decompressed = New-Object System.IO.MemoryStream
    $gzipIn = New-Object System.IO.Compression.GZipStream($input, [IO.Compression.CompressionMode]::Decompress)
    $gzipIn.CopyTo($decompressed)
    $gzipIn.Close()

    $html = [System.Text.Encoding]::UTF8.GetString($decompressed.ToArray())
    $patched = Apply-MazzaTheme $html
    if ($patched -eq $html) {
        Write-Host "Sem mudanças: $Path"
        return $false
    }

    $raw = [System.Text.Encoding]::UTF8.GetBytes($patched)
    $compressed = New-Object System.IO.MemoryStream
    $gzipOut = New-Object System.IO.Compression.GZipStream($compressed, [IO.Compression.CompressionMode]::Compress, $true)
    $gzipOut.Write($raw, 0, $raw.Length)
    $gzipOut.Close()
    $newBytes = $compressed.ToArray()

    $header = Convert-HtmlToWdocHeader -GzBytes $newBytes -VarName $varName
    Set-Content -Path $Path -Value $header -NoNewline -Encoding ASCII
    Write-Host "Atualizado: $Path"
    return $true
}

$files = Get-ChildItem -Path $WdocDir -Filter '*_htm.h' -File
$count = 0
foreach ($file in $files) {
    if (Update-WdocHeader -Path $file.FullName) { $count++ }
}
Write-Host "Concluído: $count arquivo(s) atualizado(s) em $WdocDir"
