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
$ControlLayoutCss = '#profile-s{width:100%!important}#profile-s>div{display:flex!important;flex-direction:row!important;align-items:flex-start!important;width:66.67%!important;max-width:66.67%!important;flex:0 0 66.67%!important;gap:8px!important;flex-wrap:nowrap!important}#profile-edit{flex:2 1 0!important;width:auto!important;min-width:0!important;max-width:none!important;float:none!important;margin:6px!important;overflow-x:auto!important}#tc_chart{flex:1 1 0!important;min-width:160px!important;width:auto!important;max-width:none!important;float:none!important;height:390px!important;margin:16px 0!important}table.profileTable{table-layout:auto!important}.profileTable th:nth-child(2),.profileTable td:nth-child(2){width:1%!important;min-width:0!important;white-space:nowrap!important;max-width:none!important;overflow:visible!important;text-align:center!important}.profileTable .for-time{margin:0 0 2px!important;text-align:center!important;font-size:11px!important;line-height:1.2!important;color:#000!important}.profileTable tr[type=r] .for-time{display:block!important}.profileTable tr[type=r] select.condition,.profileTable tr[type=r] .condition-con{display:none!important}.profileTable select.condition,.profileTable select.condition.md,.profileTable select.md,.profileTable select.md.condition,#profile-edit select.condition{min-width:26ch!important;width:auto!important;max-width:100%!important;height:auto!important;min-height:28px!important;overflow:visible!important;text-overflow:clip!important;white-space:nowrap!important;font-size:14px!important;line-height:1.3!important;padding:5px 22px 5px 8px!important;margin:0 auto!important;box-sizing:border-box!important;color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;border:1px solid #ccc!important;-webkit-appearance:auto!important;appearance:auto!important;text-align:center!important;text-align-last:center!important;vertical-align:middle!important}.profileTable td{padding:8px 6px!important;vertical-align:middle!important;overflow:visible!important}.condition-con{display:inline-flex!important;justify-content:center!important;align-items:center!important;min-width:0!important;width:auto!important;overflow:visible!important}'
$IndexWatermarkCss = '.chart{position:relative!important}#mazza-watermark{position:absolute!important;right:12px!important;top:398px!important;max-width:200px!important;width:22vw!important;min-width:100px!important;height:auto!important;opacity:0.2!important;pointer-events:none!important;z-index:1!important;user-select:none!important}'
$PressureDialogCss = '#dlg_calibrate .modal-content{background:#fff!important;background-color:#fff!important;color:#000!important;border:1px solid #ccc!important;box-shadow:0 4px 16px rgba(0,0,0,.2)!important;width:fit-content!important;max-width:min(560px,94vw)!important;margin:2rem auto!important;padding:1.25rem 1.5rem!important;box-sizing:border-box!important;line-height:1.5!important}#dlg_calibrate .modal-content p,#dlg_calibrate .modal-content label,#dlg_calibrate .modal-content span{color:#000!important;-webkit-text-fill-color:#000!important}#dlg_calibrate .modal-content input[type=text]{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;border:1px solid #ccc!important;display:inline-block!important;vertical-align:middle!important;margin:8px 4px!important;padding:8px 10px!important;width:auto!important;max-width:120px!important}#dlg_calibrate .card-footer{border-top:1px solid #ccc!important;margin-top:1rem!important;padding-top:0.75rem!important;text-align:right!important}'
$HcFixJs = '<script id=mazza-hc-fix>(function(){function ok(c){return c&&c.m!=0&&c.t&&c.t<=100;}HC_init=function(){var e=Q("#humidity-control");if(e)e.style.display="";var t=Q("#hc-target");if(t)t.value="";var m=Q("#hc-mode");if(m)m.value="0";};HC_show=function(c){var e=Q("#humidity-control");if(e)e.style.display="";if(!ok(c)){if(Q("#hc-target"))Q("#hc-target").value="";if(Q("#hc-mode"))Q("#hc-mode").value="0";return;}Q("#hc-mode").value=c.m;Q("#hc-target").value=c.t;};HC_apply=function(){var target=Q("#hc-target").value.trim();var mode=0,val=0;if(target){val=parseInt(target,10);if(isNaN(val)||val<0||val>100)return;mode=1;if(Q("#hc-mode"))Q("#hc-mode").value="1";}else{if(Q("#hc-mode"))Q("#hc-mode").value="0";}s_ajax({url:"/rh",m:"POST",data:"m="+mode+"&t="+val,success:function(){alert("Concluido");},fail:function(st){alert("Falha:"+st);}});};})();</script>'
$IndexHumidityFixJs = '<script id=mazza-humidity-pane-fix>(function(){if(typeof BWF==="undefined")return;var o=BWF.init;BWF.init=function(a){a=a||{};var h=a.handlers||{},p=h.A;h.A=function(c){if(typeof p==="function")p(c);var pan=Q("#humidity-pan");if(!pan)return;var active=typeof c.ht!=="undefined"&&c.ht<=100;if(!active){pan.classList.add("no-display");return;}pan.classList.remove("no-display");if(typeof c.h!=="undefined"){Q("#humidity-info").classList.remove("no-display");Q("#humidity").innerHTML=(c.h<=100)?c.h+"%":"--";}if(typeof c.hr!=="undefined"){Q("#room-humidity-info").classList.remove("no-display");Q("#room-humidity").innerHTML=(c.hr<=100)?c.hr+"%":"--";}if(typeof c.ht!=="undefined"){Q("#humidity-set-info").classList.remove("no-display");Q("#humidity-set").innerHTML=c.ht+"%";}if(typeof c.hs!=="undefined"){var s=["Idle","Dehumidifying","Humidifying","Wait to Dehumidify","Wait to Humidify","Humidify min Time","Dehumidify min Time"];Q("#hc-state-info").classList.remove("no-display");Q("#hc-state").innerHTML=s[c.hs];}};a.handlers=h;return o.call(BWF,a);};})();</script>'
$ProfileDialogCss = '#dlg_saveas .modal-content,#profile-list-pane .modal-content{background:#fff!important;background-color:#fff!important;color:#000!important;border:1px solid #ccc!important;box-shadow:0 4px 16px rgba(0,0,0,.2)!important}#dlg_saveas .modal-content .msg,#dlg_saveas .modal-content span,#profile-list-pane .modal-content h2.profile-load-heading,#profile-list-pane .modal-content .btn:not(.rmbutton){color:#000!important;-webkit-text-fill-color:#000!important}#dlg_saveas .modal-content input[type=text]{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;border:1px solid #ccc!important;box-shadow:none!important;display:inline-block!important;width:auto!important;padding:8px 10px!important;margin:8px 4px!important}'
$ConfigNetworkCss = '#networkselection .center a,#networkselection #networks a.ssid,#networkselection .nwlist a.ssid{color:#e8a838!important;-webkit-text-fill-color:#e8a838!important;font-weight:600!important;text-decoration:none!important}#networkselection .center a:hover,#networkselection #networks a.ssid:hover{color:#f0b850!important;-webkit-text-fill-color:#f0b850!important}'
$GravityDialogCss = '#dlg_addcalpoint .modal-content{background:#fff!important;background-color:#fff!important;color:#000!important;border:1px solid #ccc!important;box-shadow:0 4px 16px rgba(0,0,0,.2)!important}#dlg_addcalpoint .modal-content h5,#dlg_addcalpoint .modal-content label,#dlg_addcalpoint .modal-content span:not(.delbutton),#dlg_addcalpoint .modal-content th,#dlg_addcalpoint .modal-content td,#dlg_addcalpoint .modal-content .modal-title{color:#000!important;-webkit-text-fill-color:#000!important}#dlg_addcalpoint .modal-content input[type=number],#dlg_addcalpoint .modal-content input[type=text]{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;border:1px solid #ccc!important}#dlg_addcalpoint .caltable tbody tr.odd{background:#eee!important}#dlg_addcalpoint .caltable tbody tr.even{background:#fff!important}#dlg_addcalpoint .caltable td,#dlg_addcalpoint .caltable th{color:#000!important;border-color:rgba(0,0,0,.87)!important}'
$ControlFixCss = $ControlLayoutCss + $ProfileDialogCss + '#delbtn,#clearbtn,#setnow,#saveasbtn,#loadbtn{color:#000!important}#tc_chart text,#tc_chart .dygraph-axis-label,#tc_chart .dygraph-xlabel,#tc_chart .dygraph-ylabel{color:#000!important;fill:#000!important}' + $ControlExtraInputSel + '{color:#000!important;-webkit-text-fill-color:#000!important;background:#fff!important;background-color:#fff!important;background-image:none!important;border:1px solid #ccc!important;display:inline-block!important;width:auto!important;padding:8px 10px!important;margin:8px 4px!important;vertical-align:middle!important;box-sizing:border-box!important}'
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
    $h = [regex]::Replace($h, '<script id=mazza-hc-fix>[^<]*</script>', '')
    $h = [regex]::Replace($h, '<script id=mazza-humidity-pane-fix>[^<]*</script>', '')
    $h = [regex]::Replace($h, '<style id=mazza-index-watermark>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<style id=mazza-config-network>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<style id=mazza-gravity-dialog>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<style id=mazza-pressure-dialog>[^<]*</style>', '')
    $h = [regex]::Replace($h, '<img id=mazza-watermark[^>]*>', '')
    return $h
}

$Script:LogoDataUri = $null
function Get-LogoDataUri {
    if (-not $Script:LogoDataUri) {
        $logoPath = Join-Path $PSScriptRoot '..\extra\logo_mazza_src.png'
        if (-not (Test-Path $logoPath)) {
            throw "Logo nao encontrada: $logoPath"
        }
        $bytes = [IO.File]::ReadAllBytes($logoPath)
        $Script:LogoDataUri = 'data:image/png;base64,' + [Convert]::ToBase64String($bytes)
    }
    return $Script:LogoDataUri
}

function Apply-IndexWatermark {
    param([string]$Html, [string]$FilePath)
    if ($FilePath -notmatch 'index_htm\.h$') { return $Html }
    $h = $Html
    $h = [regex]::Replace($h, '<img id=mazza-watermark[^>]*>', '')
    $h = [regex]::Replace($h, '<style id=mazza-index-watermark>[^<]*</style>', '')
    $uri = Get-LogoDataUri
    $css = '<style id=mazza-index-watermark>' + $IndexWatermarkCss + '</style>'
    $img = '<img id=mazza-watermark src="' + $uri + '" alt="">'
    if ($h -match '<div id=div_g class=chart-main></div>') {
        $h = [regex]::Replace($h, '(<div id=div_g class=chart-main></div>)', ('$1' + $img), 1)
    } elseif ($h -match '<div main flex>') {
        $h = [regex]::Replace($h, '(<div main flex>)', ('$1' + $img), 1)
    } elseif ($h -match '</body>') {
        $h = $h.Replace('</body>', $img + '</body>')
    }
    if ($h -match '</body>') { return $h.Replace('</body>', $css + '</body>') }
    return $h + $css
}

function Apply-HumidityTextFix {
    param([string]$Html, [string]$FilePath)
    $h = $Html
    if ($FilePath -notmatch 'portuguese-br_control_htm\.h$') { return $h }
    $h = $h.Replace('Target Relative Humidity', 'Setpoint Umidade Relativa')
    $h = $h.Replace('Umidade Relativa Alvo', 'Setpoint Umidade Relativa')
    $h = $h.Replace('Humidity Control', 'Controle Umidade')
    $h = $h.Replace('Controle de Umidade', 'Controle Umidade')
    $h = $h.Replace('>Mode<', '>Modo<')
    $h = $h.Replace('>Off<', '>Desligado<')
    $h = $h.Replace('>Control<', '>Controle<')
    $h = $h.Replace('id=hc-target name=target-humidity size=4>', 'id=hc-target name=target-humidity size=4 placeholder=>')
    $h = $h.Replace('id="hc-target" name="target-humidity" size=4>', 'id="hc-target" name="target-humidity" size=4 placeholder="">')
    return $h
}

function Apply-PageTitleFix {
    param([string]$Html, [string]$FilePath)
    $h = $Html
    if ($FilePath -match 'portuguese-br_log_htm\.h$') {
        $h = $h.Replace('BrewPiLess | Registros', 'Registros')
        $h = [regex]::Replace($h, '<title>\s*BrewPiLess\s*\|\s*Registros\s*</title>', '<title>Registros</title>')
        $h = [regex]::Replace($h, '<h4>\s*BrewPiLess\s*\|\s*Registros\s*</h4>', '<h4>Registros</h4>')
    }
    if ($FilePath -match 'portuguese-br_config_htm\.h$') {
        $configTitle = 'Configura' + [char]0x00E7 + [char]0x00E3 + 'o de rede'
        $badTitles = @(
            'Configuracao de rede',
            'Configurao de rede',
            'BrewPiLess | Configuracao de rede',
            'BrewPiLess Configuration',
            'BrewPiLess Configuracao'
        )
        foreach ($bad in $badTitles) { $h = $h.Replace($bad, $configTitle) }
        $h = [regex]::Replace($h, 'BrewPiLess\s*\|\s*Configura.{0,20}de rede', $configTitle)
        $h = [regex]::Replace($h, 'Configura.{0,20}de rede', $configTitle)
        $h = [regex]::Replace($h, '<title>\s*[^<]*BrewPiLess\s*Configuration[^<]*</title>', "<title>$configTitle</title>")
        $h = [regex]::Replace($h, '<h5>\s*[^<]*BrewPiLess\s*Configuration[^<]*</h5>', "<h5>$configTitle</h5>")
    }
    return $h
}

function Apply-BodyHooks {
    param([string]$Html, [string]$FilePath)
    $h = $Html
    if ($FilePath -match 'control_htm\.h$' -and $h -notmatch 'mazza-hc-fix') {
        if ($h -match '</body>') { $h = $h.Replace('</body>', $HcFixJs + '</body>') }
        else { $h += $HcFixJs }
    }
    if ($FilePath -match 'index_htm\.h$' -and $h -notmatch 'mazza-humidity-pane-fix') {
        if ($h -match '</body>') { $h = $h.Replace('</body>', $IndexHumidityFixJs + '</body>') }
        else { $h += $IndexHumidityFixJs }
    }
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

function Strip-EmbeddedControlCss {
    param([string]$Html)
    $h = $Html
    $h = [regex]::Replace($h, 'select\.md\{width:100%;font-size:16px;height:25\.6px[^}]+\}', '')
    return $h
}

function Apply-UiFixes {
    param([string]$Html, [string]$FilePath)
    $h = Strip-UiFixes $Html
    $h = Apply-AjaxFix $h
    $h = Apply-FooterPatch $h
    $h = Apply-TitleHook $h
    $h = Apply-HumidityTextFix $h -FilePath $FilePath
    $h = Apply-PageTitleFix $h -FilePath $FilePath
    $h = Apply-IndexWatermark $h -FilePath $FilePath
    if ($FilePath -match 'control_htm\.h$') {
        $h = Strip-EmbeddedControlCss $h
    }
    $styleBlock = '<style id=mazza-ui-fix>' + $GlobalFixCss + '</style>'
    if ($FilePath -match 'control_htm\.h$') {
        $styleBlock += '<style id=mazza-control-text-fix>' + $ControlFixCss + '</style>'
    }
    if ($FilePath -match 'config_htm\.h$') {
        $styleBlock += '<style id=mazza-config-network>' + $ConfigNetworkCss + '</style>'
    }
    if ($FilePath -match 'gdc(_e32)?_htm\.h$') {
        $styleBlock += '<style id=mazza-gravity-dialog>' + $GravityDialogCss + '</style>'
    }
    if ($FilePath -match 'pressure_htm\.h$') {
        $styleBlock += '<style id=mazza-pressure-dialog>' + $PressureDialogCss + '</style>'
    }
    $h = Apply-BodyHooks $h -FilePath $FilePath
    $tail = ''
    if ($FilePath -match 'control_htm\.h$') { $tail += $ControlChartHookJs }
    $tail += $styleBlock
    if ($h -match '</body>') { return $h.Replace('</body>', $tail + '</body>') }
    if ($h -match '</head>') { return $h.Replace('</head>', $styleBlock + '</head>') }
    return $h + $tail
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
