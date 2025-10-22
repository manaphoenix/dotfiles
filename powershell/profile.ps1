oh-my-posh init pwsh --config "$env:USERPROFILE\dotfiles\powershell\themes\cyberdream.omp.json" | Invoke-Expression

function vi {
    param([string[]]$args)
    nvim @args
    Clear-Host
}

Register-ArgumentCompleter -CommandName vi -ParameterName args -ScriptBlock {
    param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
    Get-ChildItem -Name -File | Where-Object { $_ -like "$wordToComplete*" } | ForEach-Object {
        [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
    }
}