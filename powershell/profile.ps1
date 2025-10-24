oh-my-posh init pwsh --config "$env:USERPROFILE\dotfiles\powershell\themes\cyberdream.omp.json" | Invoke-Expression
Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
