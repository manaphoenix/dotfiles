
# --- Function: Show-Fastfetch ---
# Runs 'fastfetch' once per PowerShell session and prevents repeated execution.
function Show-Fastfetch
{
    # Check if the global variable 'FASTFETCH_SHOWN' exists. If not, run fastfetch.
    if (-not (Get-Variable -Name "FASTFETCH_SHOWN" -Scope Global -ErrorAction SilentlyContinue))
    {
        # Run fastfetch (assumes it's in PATH)
        fastfetch
        # Mark as shown to prevent running again in the same session
        $global:FASTFETCH_SHOWN = $true
    }
}

# --- Initialize Oh-My-Posh ---
# Loads your custom prompt theme. Using 'Invoke-Expression' is common here, but we can simplify.
$ompConfig = Join-Path $env:USERPROFILE "dotfiles\powershell\themes\cyberdream.omp.json"
# Only invoke if file exists to avoid errors
if (Test-Path $ompConfig)
{
    oh-my-posh init pwsh --config $ompConfig | Invoke-Expression
}

# --- Initialize Zoxide ---
# Zoxide provides fast directory navigation.
$zoxideInit = zoxide init --cmd cd powershell

if ($zoxideInit) {
    # Join array elements into a single string before invoking
    Invoke-Expression ($zoxideInit -join "`n")
}


# --- Scoop Search Hook ---
# Loads any custom scoop hooks (like tab-completion)
$scoopHook = scoop-search --hook
if ($scoopHook)
{
    # Using ScriptBlock::Create works, but safer is to just invoke it
    Invoke-Expression $scoopHook
}

# --- Display Fastfetch ---
Show-Fastfetch

# --- Import PSReadLine syntax-highlighting module ---
# Enhances the PowerShell prompt with syntax highlighting.
# Check if module exists first to avoid errors
if (Get-Module -ListAvailable -Name syntax-highlighting)
{
    Import-Module syntax-highlighting
}


