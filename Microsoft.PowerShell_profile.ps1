$env:POSH_VI_MODE = "insert"
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        $env:POSH_VI_MODE = "normal"
    } else {
        $env:POSH_VI_MODE = "insert"
    }
    [Microsoft.PowerShell.PSConsoleReadLine]::InvokePrompt()
}

Set-PSReadLineOption -EditMode Vi -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange

# init oh-my-posh
oh-my-posh init pwsh --config "D:\Git\dotfiles\.oh-my-posh\config.omp.json" | Invoke-Expression
