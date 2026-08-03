# =========================================================
# Mana PowerShell Profile (stable dev environment)
# =========================================================

# ----------------------------
# Environment variables
# ----------------------------
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"

# Yazi needs git-bash's file.exe; resolve it from the scoop install so this
# survives a different username or machine layout.
$gitPrefix = (scoop prefix git 2>$null | Select-Object -First 1)
if ($gitPrefix -and (Test-Path -LiteralPath "$gitPrefix\usr\bin\file.exe"))
{
    $env:YAZI_FILE_ONE = "$gitPrefix/usr/bin/file.exe"
}

# ----------------------------
# Helpers
# ----------------------------

function Test-Command($name)
{
    return $null -ne (Get-Command $name -ErrorAction SilentlyContinue)
}

# ----------------------------
# Yazi
# ----------------------------
function y
{
    $tmp = (New-TemporaryFile).FullName
    yazi.exe @args --cwd-file="$tmp"
    $cwd = Get-Content -Path $tmp -Encoding UTF8
    if ($cwd -and $cwd -ne $PWD.Path -and (Test-Path -LiteralPath $cwd -PathType Container))
    {
        Set-Location -LiteralPath (Resolve-Path -LiteralPath $cwd).Path
    }
    Remove-Item -Path $tmp
}

# ----------------------------
# Fastfetch (run once per session)
# ----------------------------
function Show-Fastfetch
{
    if (-not $script:FASTFETCH_SHOWN)
    {
        if (Test-Command fastfetch)
        {
            fastfetch
        }
        $script:FASTFETCH_SHOWN = $true
    }
}


# ----------------------------
# Oh-My-Posh
# ----------------------------
$ompConfig = Join-Path $env:USERPROFILE "dotfiles\powershell\themes\cyberdream.omp.toml"

if ((Test-Path $ompConfig) -and (Test-Command oh-my-posh))
{
    oh-my-posh init pwsh --config $ompConfig | Invoke-Expression
}

# ----------------------------
# Zoxide
# ----------------------------
if (Test-Command zoxide)
{
    $zoxideInit = & zoxide init --cmd cd powershell
    Invoke-Expression ($zoxideInit -join "`n")
}

# ----------------------------
# Scoop search hook (optional)
# ----------------------------
if (Test-Command scoop-search)
{
    try
    {
        $hook = scoop-search --hook 2>$null
        if ($hook)
        {
            Invoke-Expression $hook
        }
    } catch
    {
    }
}


# ----------------------------
# Aliases
# ----------------------------
if (Test-Command lsd)
{
    Set-Alias ls lsd
}


# ----------------------------
# PSReadLine
# ----------------------------
if (Get-Module -ListAvailable -Name PSReadLine)
{
    Import-Module PSReadLine
    Set-PSReadLineOption -PredictionSource HistoryAndPlugin -PredictionViewStyle ListView
    Set-PSReadLineOption -HistorySaveStyle SaveIncrementally
    Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
}

# ----------------------------
# Terminal-Icons (icons in tab completion)
# ----------------------------
if (Get-Module -ListAvailable -Name Terminal-Icons)
{
    Import-Module Terminal-Icons
}

# ----------------------------
# PSFzf (Ctrl+T file picker, Ctrl+R reverse history)
# ----------------------------
if (Get-Module -ListAvailable -Name PSFzf)
{
    Import-Module PSFzf
    Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+t' -PSReadLineChordReverseHistory 'Ctrl+r'
}


# ----------------------------
# Fastfetch startup
# ----------------------------
Show-Fastfetch


# ----------------------------
# Update function (Topgrade)
# ----------------------------
function update
{
    if (Test-Command topgrade)
    {
        topgrade
    } else
    {
        Write-Host "Topgrade not found. Install it with: scoop install topgrade" -ForegroundColor Red
    }
}


# ----------------------------
# Optional: quick Podman helper
# ----------------------------
function Initialize-PodmanMachine
{
    if (Test-Command podman)
    {
        try
        {
            $state = podman machine inspect podman-machine-default --format "{{.State}}" 2>$null
            if (-not $state -or $state -ne "running")
            {
                Write-Host "Starting Podman machine..." -ForegroundColor Yellow
                podman machine start podman-machine-default | Out-Null
            }
        } catch
        {
            Write-Host "Podman machine not available or not initialized." -ForegroundColor Red
        }
    }
}

#f45873b3-b655-43a6-b217-97c00aa0db58 PowerToys CommandNotFound module

Import-Module -Name Microsoft.WinGet.CommandNotFound
#f45873b3-b655-43a6-b217-97c00aa0db58
