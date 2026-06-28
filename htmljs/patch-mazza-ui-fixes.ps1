# Ajustes de legibilidade na UI MAZZA (wdoc embutido).
param(
    [string]$WdocDir = (Join-Path $PSScriptRoot "..\wdoc")
)

# Wi-Fi verde
# Formularios (config, log, gravity, pressure): texto preto, caixa branca, inline (nao sobrepoe rotulo)
# Modais escuros: texto branco
# Modos de Fermentacao: regras especificas em $ControlFixCss (nao alterar)
$FormInputSel = '.card input[type=text],.card input[type=number],.card input[type=password],.card input[type=datetime-local],.card select:not(.condition),.card textarea,.card .sginput,#inputform input[type=text],#inputform input[type=number],#inputform input[type=password],#inputform input[type=datetime-local],#inputform select,#inputform textarea,.mqtt-input,.nb,#logname'
$LogCss = '#logname{color:#000!important;-webkit-text-fill-color:#000!important;background:transparent!important;background-color:transparent!important;background-image:none!important;border:1px solid #ccc!important}#loglist,.mdl-data-table{color:#000!important}#loglist th,.mdl-data-table th{color:#000!important;background:transparent!important}#loglist td,.mdl-data-table td,.mdl-data-table .logid,.mdl-data-table .logdate{color:#000!important;background:transparent!important;-webkit-text-fill-color:#000!important}#loglist tr:nth-child(even),.mdl-data-table tr:nth-child(even){background:#fff!important}#loglist tr:nth-child(odd):not(:first-child),.mdl-data-table tr:nth-child(odd):not(:first-child){background:#eee!important}'
$FormInputCss = "${FormInputSel}{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;background-image:none!important;border:1px solid #ccc!important;box-shadow:none!important;display:inline-block!important;width:auto!important;max-width:100%!important;min-width:4em!important;padding:8px 10px!important;margin:8px 4px!important;vertical-align:middle!important;box-sizing:border-box!important}${FormInputSel}::placeholder{color:#666!important}.card select option,.card .inline-header,.card h5,.card h6{color:inherit}.card select option{color:#000;background:#fff}"
$ModalCss = '.modal-content,.modal .modal-content{color:#fff!important}.modal-content label,.modal-content p,.modal-content span,.modal-content h5,.modal-content h6,.modal-content td,.modal-content th,.modal-content li,.modal-content .msg,.modal-content .message,.modal-content .modal-header{color:#fff!important}.modal-content input,.modal-content select,.modal-content textarea,.modal input[type=text],.modal input[type=number],.modal input[type=password],.modal-content input[type=text],.modal-content input[type=number],.modal-content input[type=password],.modal-content .sginput{color:#fff!important;-webkit-text-fill-color:#fff!important;background:transparent!important;background-color:transparent!important;background-image:none!important;border:1px solid #2a3f5f!important;box-shadow:none!important;display:inline-block!important;width:auto!important;max-width:100%!important;padding:8px 10px!important;margin:8px 4px!important;vertical-align:middle!important}.modal-content input::placeholder,.modal-content textarea::placeholder{color:#8899aa!important}'
$ProfileCss = '.profileTable tbody tr.odd{background:#eee!important}.profileTable tbody tr.even{background:#fff!important}#profile-edit input[type=datetime-local],#profile-edit #startdate{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;background-image:none!important;border:1px solid #ccc!important;display:inline-block!important;width:auto!important;padding:8px 10px!important;margin:8px 4px!important}.profileTable td[contenteditable=true],.profileTable .stage-temp,.profileTable .stage-time,.profileTable .stage-sg,.profileTable .stage-stabletime{color:#000!important;font-size:14px!important}.profileTable thead th{color:#000!important}#profile-edit .start-date{color:#000!important}'
$GlobalFixCss = '.rssi-bar{background-color:#90ee90!important}' + $FormInputCss + $LogCss + $ModalCss + $ProfileCss

$TitleHookJs = '<script id=mazza-title-hook>(function(){function s(n){var h=document.getElementById("hostname");if(!h||!n)return;h.textContent=n;document.title=n;h.dataset.titleLoaded="1";}function l(w){w.addEventListener("message",function(e){if(e.data.length>2&&e.data.charAt(0)==="A"&&e.data.charAt(1)===":"){try{var c=JSON.parse(e.data.substring(2));if(c.nn)s(c.nn);}catch(x){}}});}var h=document.getElementById("hostname");if(h&&!h.dataset.titleLoaded){try{var w=new WebSocket("ws://"+location.host+"/ws");l(w);}catch(x){}}if(typeof BWF!=="undefined"){var o=BWF.init;BWF.init=function(a){a=a||{};var hs=a.handlers||{},oa=hs.A;hs.A=function(c){if(c&&c.nn)s(c.nn);if(typeof oa==="function")oa(c);};a.handlers=hs;return o.call(BWF,a);};}})();</script>'

$ControlExtraInputSel = '#capgravityinput,#cappressure,#beer-t,#fridge-t,#captimeinput,#ptc-control input,#humidity-control input,#hc-target'
$ControlLayoutCss = '#profile-edit{width:780px!important;max-width:100%!important}#tc_chart{width:calc(100% - 780px)!important;min-width:280px!important}table.profileTable{table-layout:auto!important}.profileTable th:nth-child(2),.profileTable td:nth-child(2){min-width:200px!important;width:auto!important;max-width:none!important;overflow:visible!important;text-align:center!important}.profileTable select.condition,.profileTable select.condition.md,.profileTable select.md,.profileTable select.md.condition,#profile-edit select.condition{min-width:26ch!important;width:auto!important;max-width:100%!important;height:auto!important;min-height:24px!important;overflow:visible!important;text-overflow:clip!important;white-space:nowrap!important;font-size:11px!important;line-height:1.2!important;padding:3px 20px 3px 8px!important;display:inline-block!important;margin:0 auto!important;box-sizing:border-box!important;color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;border:1px solid #ccc!important;-webkit-appearance:auto!important;appearance:auto!important;text-align:center!important;text-align-last:center!important;vertical-align:middle!important}.profileTable td{padding:8px 6px!important;vertical-align:middle!important;overflow:visible!important}.condition-con{display:flex!important;justify-content:center!important;align-items:center!important;min-width:0!important;width:100%!important;overflow:visible!important}'
$ControlFixCss = $ControlLayoutCss + '#delbtn,#clearbtn,#setnow,#saveasbtn,#loadbtn{color:#000!important}#tc_chart text,#tc_chart .dygraph-axis-label,#tc_chart .dygraph-xlabel,#tc_chart .dygraph-ylabel{color:#000!important;fill:#000!important}' + $ControlExtraInputSel + '{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;background-image:none!important;border:1px solid #ccc!important;display:inline-block!important;width:auto!important;padding:8px 10px!important;margin:8px 4px!important;vertical-align:middle!important;box-sizing:border-box!important}'
$ControlChartHookJs = '<script id=mazza-control-chart-hook>(function(){function f(){var c=document.getElementById("tc_chart");if(!c)return;c.querySelectorAll("text").forEach(function(el){el.style.setProperty("fill","#000","important");});}new MutationObserver(f).observe(document.documentElement,{subtree:true,childList:true});document.addEventListener("DOMContentLoaded",f);f();})();</script>'

function Convert-HtmlToWdocHeader {
    param([byte[]]$GzBytes, [string]$VarName)
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
    [void]$sb.AppendLine('')
    [void]$sb.AppendLine("unsigned int dist_${VarName}_len = $($GzBytes.Length);")
    return $sb.ToString()
}

function Read-WdocHtml {
    param([string]$Path)
    $content = Get-Content $Path -Raw
    if ($content -notmatch 'const unsigned char (\w+)\[\] PROGMEM') { return $null, $null }
    $varName = $Matches[1]
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
    return $varName, [Text.Encoding]::UTF8.GetString($out.ToArray())
}

function Write-WdocHtml {
    param([string]$Path, [string]$VarName, [string]$Html)
    $raw = [Text.Encoding]::UTF8.GetBytes($Html)
    $compressed = New-Object IO.MemoryStream
    $gzipOut = New-Object IO.Compression.GZipStream($compressed, [IO.Compression.CompressionMode]::Compress, $true)
    $gzipOut.Write($raw, 0, $raw.Length)
    $gzipOut.Close()
    $header = Convert-HtmlToWdocHeader -GzBytes $compressed.ToArray() -VarName $varName
    Set-Content -Path $Path -Value $header -NoNewline -Encoding ASCII
}

$AjaxErrorFn = 'function ajaxErrorText(s,r){if(typeof s==="object")return r||"erro de rede";if(s===401)return "login necessario";if(s===404)return "nao encontrado";if(s===0)return r||"erro de rede";return String(s)+(r?": "+r:"");}'

function Apply-AjaxFix {
    param([string]$Html)
    $h = $Html
    if ($h -notmatch 'function s_ajax\(') { return $h }
    if ($h -notmatch 'ajaxErrorText') {
        $h = $h -replace '(function s_ajax\()', ($AjaxErrorFn + '$1')
    }
    $h = [regex]::Replace($h, 'else\s*\{\s*c\.onerror\(c\.status\)\s*\}', 'else{b.fail&&b.fail(c.status,c.responseText)}')
    $h = [regex]::Replace($h, 'else\s+c\.onerror\(-1\)', 'else b.fail&&b.fail(-1,"timeout")')
    $h = [regex]::Replace($h, 'c\.onerror\s*=\s*function\s*\(\s*a\s*\)\s*\{\s*if\s*\(\s*typeof b\["fail"\]\s*!=\s*"undefined"\s*\)\s*b\.fail\s*\(\s*a\s*\)\s*\}', 'c.onerror=function(){b.fail&&b.fail(c.status||0,c.responseText||"network error")}')
    $h = [regex]::Replace($h, 'fail:function\(d\)\{alert\("Falha ao deletar por:"\+d\)\}', 'fail:function(st,msg){alert("Falha ao deletar por:"+ajaxErrorText(st,msg))}')
    $h = [regex]::Replace($h, 'fail:function\(d\)\{alert\("Failed to delete for:"\+d\)\}', 'fail:function(st,msg){alert("Failed to delete for:"+ajaxErrorText(st,msg))}')
    return $h
}

function Strip-UiFixes {
    param([string]$Html)
    $h = $Html
    $h = [regex]::Replace($h, '<style id=mazza-ui-fix>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<style id=mazza-control-text-fix>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<script id=mazza-control-chart-hook>[^<]*</script>', '')
    $h = [regex]::Replace($h, '<script id=mazza-title-hook>[^<]*</script>', '')
    return $h
}

function Apply-TitleHook {
    param([string]$Html)
    $h = $Html
    $h = [regex]::Replace($h, '<script>\(function\(\)\{var h=document\.getElementById\("hostname"\);[^<]*</script>', '')
    $h = [regex]::Replace($h, '<script>\(function\(\)\{var h=document\.getElementById\(''hostname''\);[^<]*</script>', '')
    if ($h -notmatch 'id=["'']?hostname["'']?' -or $h -match 'mazza-title-hook') { return $h }
    if ($h -match '(<span id=hostname>BrewPiLess</span>)') {
        return [regex]::Replace($h, '(<span id=hostname>BrewPiLess</span>)', '$1' + $TitleHookJs, 1)
    }
    if ($h -match '(<span id="hostname">BrewPiLess</span>)') {
        return [regex]::Replace($h, '(<span id="hostname">BrewPiLess</span>)', '$1' + $TitleHookJs, 1)
    }
    return $h
}

function Apply-FooterPatch {
    param([string]$Html)
    $h = $Html
    $h = [regex]::Replace($h, 'BrewPiLess by <a href=https://github\.com/vitotai/\s*>\s*vitotai</a>', 'BrewPiLess theme BrewSystems')
    $h = [regex]::Replace($h, 'BrewPiLess by <a href="https://github.com/vitotai/">vitotai</a>', 'BrewPiLess theme BrewSystems')
    $h = $h.Replace('BrewPiLess by vitotai', 'BrewPiLess theme BrewSystems')
    return $h
}

function Apply-UiFixes {
    param([string]$Html, [string]$FilePath)
    $h = Strip-UiFixes $Html
    $h = Apply-AjaxFix $h
    $h = Apply-FooterPatch $h
    $h = Apply-TitleHook $h
    $extra = '<style id=mazza-ui-fix>' + $GlobalFixCss + '</style>'
    if ($FilePath -match 'control_htm\.h$') {
        $extra += '<style id=mazza-control-text-fix>' + $ControlFixCss + '</style>' + $ControlChartHookJs
    }
    if ($h -match '</head>') { return $h.Replace('</head>', $extra + '</head>') }
    return $h
}

$count = 0
Get-ChildItem -Path $WdocDir -Filter '*_htm.h' -File | ForEach-Object {
    $varName, $html = Read-WdocHtml -Path $_.FullName
    if (-not $html) { return }
    $patched = Apply-UiFixes -Html $html -FilePath $_.Name
    if ($patched -eq $html) {
        Write-Host "Sem mudancas: $($_.Name)"
        return
    }
    Write-WdocHtml -Path $_.FullName -VarName $varName -Html $patched
    Write-Host "Atualizado: $($_.Name)"
    $count++
}
Write-Host "Concluido: $count arquivo(s) atualizado(s)"
