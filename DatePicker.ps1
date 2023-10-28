Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object Windows.Forms.Form 
$form.StartPosition = [Windows.Forms.FormStartPosition]::CenterScreen
$form.Size = New-Object Drawing.Size 250,400
$form.Text = 'Select a Date'

$calendar = New-Object Windows.Forms.MonthCalendar
$calendar.ShowTodayCircle = $true
$calendar.MaxSelectionCount = 1
$calendar.Size = New-Object Drawing.Size 200,300
$form.Controls.Add($calendar)

$okButton = New-Object Windows.Forms.Button
$okButton.Location = New-Object Drawing.Point 5, 310
$okButton.Size = New-Object Drawing.Size 75, 23
$okButton.Text = 'Select'
$okButton.DialogResult = [Windows.Forms.DialogResult]::OK

$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object Windows.Forms.Button
$cancelButton.Location = New-Object Drawing.Point 106, 310
$cancelButton.Size = New-Object Drawing.Size 75, 23
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [Windows.Forms.DialogResult]::Cancel

$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$result = $form.ShowDialog()

if ($result -eq [Windows.Forms.DialogResult]::OK) {
    $date = $calendar.SelectionStart
    [DateTime] $date
}