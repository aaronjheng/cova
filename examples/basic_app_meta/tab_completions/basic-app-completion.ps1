# Requires PowerShell v5.1+

# This Tab Completion script was generated by the Cova Library.
# Details at https://github.com/00JCIV00/cova


# PowerShell Completion Installation Instructions for basic-app
# 1. Load the completion script into your current PowerShell session:
#    . .\basic-app-completion.ps1
#
# 2. Ensure your Execution Policy allows the script to be run. Example:
#    Set-ExecutionPolicy RemoteSigned
#
# 3. To ensure this completion script is loaded automatically in future sessions,
#    add the above sourcing command to your PowerShell profile:
#    Notepad $PROFILE
#    Add the line: . C:\path\to\basic-app-completion.ps1
#
# 4. Restart your PowerShell session or source your profile again:
#    . $PROFILE


function _basic-app {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'new',
		'open',
		'list',
		'clean',
		'view-lists',
		'help',
		'usage',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-new {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'help',
		'usage',
		'--first-name',
		'--last-name',
		'--age',
		'--phone',
		'--address',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-open {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'help',
		'usage',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-list {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'filter',
		'help',
		'usage',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-list-filter {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'help',
		'usage',
		'--id',
		'--admin',
		'--age',
		'--first-name',
		'--last-name',
		'--phone',
		'--address',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-clean {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'help',
		'usage',
		'--file',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

function _basic-app-view-lists {
    param($wordToComplete, $commandAst)
    $suggestions = @(
		'help',
		'usage',
		'--help',
		'--usage'
	)
    return $suggestions | Where-Object { $_ -like "$wordToComplete*" }
}

Register-ArgumentCompleter -CommandName 'basic-app.exe' -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPos)

    $functionName = "_" + $($commandAst.Extent.Text.replace(' ', '-').replace(".exe", ""))
    if ($wordToComplete) {
        $functionName = $functionName.replace("-$wordToComplete", "")
    }

    # Check if the function exists and invoke it
    if (Get-Command -Name $functionName -ErrorAction SilentlyContinue) {
        & $functionName $wordToComplete $commandAst
    } else {
        # Fallback logic to show files in the current directory
        Get-ChildItem -Path '.' -File | Where-Object Name -like "*$wordToComplete*" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_.Name, $_.Name, 'ParameterValue', $_.Name)
        }
    }
}