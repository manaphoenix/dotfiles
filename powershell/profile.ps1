# =========================================================
# Mana PowerShell Profile (stable dev environment)
# =========================================================

# ----------------------------
# Environment variables
# ----------------------------
$env:EDITOR = "nvim"
$env:VISUAL = "nvim"


# ----------------------------
# Helpers
# ----------------------------

function Test-Command($name)
{
    return [bool](Get-Command $name -ErrorAction SilentlyContinue)
}


# ----------------------------
# Fastfetch (run once per session)
# ----------------------------
function Show-Fastfetch
{
    if (-not $global:FASTFETCH_SHOWN)
    {
        if (Test-Command fastfetch)
        {
            fastfetch
        }
        $global:FASTFETCH_SHOWN = $true
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
# PSReadLine (safe import)
# ----------------------------
if (Get-Module -ListAvailable -Name PSReadLine)
{
    Import-Module PSReadLine
}


# ----------------------------
# Fastfetch startup
# ----------------------------
Show-Fastfetch


# ----------------------------
# Update function (Topgrade)
# ----------------------------
$global:UPDATE_SCRIPT = "$HOME\Documents\Code\pwsh\update-all.ps1"

function update
{
    if (Test-Path $global:UPDATE_SCRIPT)
    {
        & $global:UPDATE_SCRIPT
    } else
    {
        Write-Host "Update script not found: $global:UPDATE_SCRIPT" -ForegroundColor Red
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
            if ($state -ne "running")
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
