$Header = @"
<style>
TABLE {border-width: 1px;border-style: solid;border-color: black;border-collapse: collapse;}
TH {border-width: 1px;padding: 3px;border-style: solid;border-color: black;background-color: #6495ED;}
TD {border-width: 1px;padding: 3px;border-style: solid;border-color: black;}
TR:Nth-Child(Even) {Background-Color: #dddddd;}
TR:Hover TD {Background-Color: #C1D5F8;}
</style>
<title>
Last 7 Days EVENT LOG ERRORS
</title>
"@
$pre = "Last 7 days"

get-EventLog -ComputerName pdc,dcx,sql,mail -LogName System -EntryType error -after ((get-date).date.AddDays(-7)) | Group-Object eventid, MachineName, Message |select Count,Name| sort count -Descending | ConvertTo-Html -Head $Header | Out-File \\nas\it\james\OUTFILE\testoutput.html


