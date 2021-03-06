Get-Process notepad | Stop-Process

$a = Get-Process

notepad

$b = Get-Process

Compare-Object -ReferenceObject $a -DifferenceObject $b
# difference: a doesn't have notepad, b does

notepad

$a = Get-Process

# paste large amounts of text in notepad

$b = Get-Process

Compare-Object -ReferenceObject $a -DifferenceObject $b
# no difference

$a | Where-Object name -EQ notepad
$b | Where-Object name -EQ notepad

# ...although the second notepad has more handles, and memory, and...

# to compare 2 objects, we can use CompareTo

# get only the (changed) notepad process
$n1 = $a | Where-Object name -EQ notepad
$n2 = $b | Where-Object name -EQ notepad

Compare-Object $n1 $n2 -IncludeEqual

# but only on types that have implemented this: strings, ints, ...

$n1.name | Get-Member

$n2.Handles.CompareTo($n1.Handles)
# -1 => n2 is larger

Compare-Object $n1 $n2 -Property name -IncludeEqual
Compare-Object $n1 $n2 -Property handles -IncludeEqual
# also works, but stil only one property at a time

# You can always write a function to check all properties...

function CompareProps($a, $b)
{
$props = $a | Get-Member -MemberType Property # | Select-Object -First 5

$return = New-Object psobject

foreach($property in $props)
{
$name = $property.Name

Add-Member -InputObject $return -MemberType NoteProperty -Name $name -Value ($a."$name", $b."$name")
}
return $return;
}

function CompareObj($a, $b)
{
$compObj = CompareProps -a $a -b $b

$props = $compObj | Get-Member -MemberType Properties # | Select-Object -First 5
$return = $true

foreach($property in $props)
{

if((Compare-Object $a $b -Property $property.name -ErrorAction SilentlyContinue ).length -NE 0)
{
Write-Host "Not equal: "$property.name
$return = $false
}
else
{
Write-Host "Equal: "$property.name
}

}
return $return;
}

CompareProps -a $n1 -b $n2
CompareObj -a $n1 -b $n2

# improvements: only show output if verbose-level is high enough

