<#
    .SYNOPSIS
    New-Password

    .DESCRIPTION
    Generate a password with Uppercase, Lowercase, Numeric & Special Character

    .PARAMETER MaxLength
    Maximum length of the password string in int

    .EXAMPLE
    New-Password

    .EXAMPLE
    New-Password -MaxLength 12

    .NOTES
    Author      :   PowerShell Training
    ChangeLog   :   FEB'25.......... Created

#>

Write-Debug "Function New-Password Initialized"
function  New-Password {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(HelpMessage="Define length of the password")]
        [int]$MaxLength = 18
    )
        
    Write-Debug "Provided Max Length: $MaxLength"
    Write-Debug "Initialize Tokenset with Uppercase, Lowercase, Numeric & Special Character"
    $TokenSet = @{
        U = [Char[]]'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
        L = [Char[]]'abcdefghijklmnopqrstuvwxyz'
        N = [Char[]]'0123456789'
        S = [Char[]]'!@#$%&?,'
    }
    
    Write-Debug "Get Random Uppercase, Lowercase, Numeric & Special Character"
    $Upper      = Get-Random -Count 5 -InputObject $TokenSet.U
    $Lower      = Get-Random -Count 5 -InputObject $TokenSet.L
    $Number     = Get-Random -Count 5 -InputObject $TokenSet.N
    $Special    = Get-Random -Count 5 -InputObject $TokenSet.S
    
    Write-Verbose "Creating password with Uppercase, Lowercase, Numeric & Special Character"
    $StringSet = $Upper + $Lower + $Number + $Special
    
    Write-Verbose "Password Generated"
    (Get-Random -Count $MaxLength -InputObject $StringSet) -join ''
}

Write-Debug "Function New-Password Exported from Module"
Export-ModuleMember New-Password