# SPACE LEGACY - instalador
# Crea un perfil aparte "Space Legacy" en el launcher de Minecraft (Fabric 1.21.1 + Ad Astra)
# con su propia carpeta de juego. No toca tus otros mods, mundos ni perfiles.
$ErrorActionPreference = 'Stop'
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$src = Join-Path $here 'modpack'
$mc = Join-Path $env:APPDATA '.minecraft'
$game = Join-Path $env:APPDATA '.spacelegacy'
$ver = 'fabric-loader-0.20.1-1.21.1'

Write-Host ''
Write-Host '  SPACE LEGACY - instalador' -ForegroundColor Yellow
Write-Host ''
if (-not (Test-Path $mc)) { Write-Host '  No encuentro Minecraft Java en este PC. Abre el launcher una vez y vuelve a intentarlo.' -ForegroundColor Red; exit 1 }
if (Get-Process -Name 'MinecraftLauncher', 'Minecraft' -ErrorAction SilentlyContinue) {
  Write-Host '  Cierra el launcher de Minecraft antes de instalar y vuelve a ejecutar esto.' -ForegroundColor Red; exit 1
}

# 1. Fabric para 1.21.1 (el launcher descarga solo lo que falte al pulsar Jugar)
$vdir = Join-Path $mc "versions\$ver"
New-Item -ItemType Directory -Force $vdir | Out-Null
Copy-Item (Join-Path $src "fabric\$ver.json") (Join-Path $vdir "$ver.json") -Force
Write-Host '  [1/4] Fabric 1.21.1 preparado'

# 2. Carpeta de juego propia: mods, paquete de recursos y opciones
New-Item -ItemType Directory -Force (Join-Path $game 'mods'), (Join-Path $game 'resourcepacks'), (Join-Path $game 'saves') | Out-Null
Get-ChildItem (Join-Path $game 'mods') -Filter *.jar | Remove-Item -Force
Copy-Item (Join-Path $src 'mods\*.jar') (Join-Path $game 'mods') -Force
Copy-Item (Join-Path $src 'resourcepacks\*') (Join-Path $game 'resourcepacks') -Force
if (-not (Test-Path (Join-Path $game 'options.txt'))) { Copy-Item (Join-Path $src 'options.txt') $game }
Write-Host '  [2/4] Ad Astra y modelos 3D copiados'

# 3. El mundo. Si ya existe uno, se guarda una copia antes de sustituirlo.
$world = Join-Path $game 'saves\Space Legacy'
if (Test-Path $world) {
  $bak = "$world (copia $(Get-Date -Format 'yyyy-MM-dd HH.mm'))"
  Rename-Item $world $bak
  Write-Host "  Tu mundo anterior se ha guardado como: $(Split-Path -Leaf $bak)"
}
Copy-Item (Join-Path $src 'saves\Space Legacy') $world -Recurse
Write-Host '  [3/4] Mundo Space Legacy copiado'

# 4. Perfil en el launcher (con copia de seguridad del archivo de perfiles)
$now = (Get-Date).ToUniversalTime().ToString('yyyy-MM-ddTHH:mm:ss.fffZ')
$done = $false
foreach ($name in 'launcher_profiles.json', 'launcher_profiles_microsoft_store.json') {
  $file = Join-Path $mc $name
  if (-not (Test-Path $file)) { continue }
  Copy-Item $file "$file.antes-de-spacelegacy" -Force
  $json = Get-Content $file -Raw -Encoding UTF8 | ConvertFrom-Json
  if (-not $json.profiles) { $json | Add-Member -NotePropertyName profiles -NotePropertyValue ([pscustomobject]@{}) }
  $perfil = [pscustomobject]@{ name = 'Space Legacy'; type = 'custom'; created = $now; lastUsed = $now; icon = 'Glass'; lastVersionId = $ver; gameDir = $game }
  $json.profiles | Add-Member -NotePropertyName 'space-legacy' -NotePropertyValue $perfil -Force
  [IO.File]::WriteAllText($file, ($json | ConvertTo-Json -Depth 50), (New-Object Text.UTF8Encoding $false))
  $done = $true
}
if (-not $done) { Write-Host '  No he encontrado el archivo de perfiles del launcher. Abre el launcher una vez y repite.' -ForegroundColor Red; exit 1 }
Write-Host '  [4/4] Perfil "Space Legacy" creado en el launcher'

Write-Host ''
Write-Host '  LISTO.' -ForegroundColor Green
Write-Host '  1. Abre el launcher de Minecraft.'
Write-Host '  2. Elige el perfil "Space Legacy" (abajo a la izquierda) y pulsa JUGAR.'
Write-Host '  3. Un jugador > mundo "Space Legacy".'
Write-Host ''
