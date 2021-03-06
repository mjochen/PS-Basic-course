function Get-Input($message, $minimum = 1, $maximum = 100) {
    [int] $intResult = 0;

    do {
        do {
            $result = Read-Host ($message)
        }
        while (![Int]::TryParse($result, [ref]$intResult));
    }
    while ($intResult -lt $minimum -or $intResult -gt $maximum);

    return $intResult
}

cls

$grades = Get-Input "Give the total of all grades"
$courses = Get-Input "Give the number of courses the student took" -minimum 2 -maximum 20

"The average result is {0:N2}." -f ($grades / $courses)
