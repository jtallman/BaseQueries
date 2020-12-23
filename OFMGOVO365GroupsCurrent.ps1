#* FileName: OFMGOVO365Groups.ps1
#*=============================================================================
#* Created: 4/6/2020
#* Author: Alex Tate
#* Company: OFM
#* Requirements: Active Directory module
#*=============================================================================
#* Purpose: This script queries all eclient o365 groups and store them in a location on filedepot.
#*=============================================================================
#*=============================================================================
#* The Section below declares all variables that will be used in the script
#*=============================================================================

#Create Array with all OFM/GOV o365 groups
$o365groups = @()
#Populates Array
$o365groups += "U-S-eClient-U-OFM-DYN365-GOVCRMS-PR-Instance"
$o365groups += "U-S-eClient-U-OFM-DYN365-GOVCRMS-PR-Instance"
$o365groups += "U-S-eClient-U-OFM-DYN365-Enterprise-Case-Management-GOV-Lic"
$o365groups += "U-S-eClient-U-OFM-M365-Power-BI-Pro-for-Gov-VSE-Lic"
$o365groups += "U-S-eClient-U-OFM-DYN365-OFMSHR-Instance-DEV"
$o365groups += "U-S-eClient-U-OFM-DYN365-Enterprise-Team-Member-GOV-Lic"
$o365groups += "U-S-eClient-U-OFM-DYN365-Enterprise-Customer-Engagement-GOV-L"
$o365groups += "U-S-eClient-U-OFM-M365-G3-Lic"
$o365groups += "U-S-eClient-U-OFM-Azure MFA Users"
$o365groups += "U-S-eClient-U-OFM-DYN365-GOVCRMS-Instance-DEV"
$o365groups += "U-S-eClient-U-OFM-DYN365-OCO-Instance"
$o365groups += "U-S-eClient-U-OFM-DYN365-OFMSHR-Instance-QA"
$o365groups += "U-S-eClient-U-OFM-M365-Power-BI-Pro-for-Gov-Lic"
$o365groups += "U-S-eClient-U-OFM-DYN365-OFMSHR-Instance-COP"
$o365groups += "U-S-eClient-U-OFM-DYN365-OFMSHR-Instance-Production"
$o365groups += "U-S-eClient-U-OFM-M365-SharePoint-Admins"
$o365groups += "U-S-eClient-U-OFM-M365-Win10-Lic"
$o365groups += "U-S-eClient-U-OFCO-O365-DYN365-Production"
$o365groups += "U-S-eClient-U-OFCO-O365-DYN365-Sandbox"
$o365groups += "U-S-eClient-U-OFM-M365-G5-ATA"
$o365groups += "U-S-eClient-U-OFM-M365-G5-EMSPremium_GOV"
$o365groups += "U-S-eClient-U-OFM-M365-G5-ENTERPRISEPREMIUM_GOV"
$o365groups += "U-S-eClient-U-OFM-M365-G5-ADALLOM_STANDALONE"

#Path to save
$path = "\\encmsoly1024\ofm\OFM\_Common\Purchasing, IT Software\Software Asset Management\AD Security Groups\Current"

#Store the date. Will be appended to file name not currently used
#$date = get-date -uformat "%m-%d-%y"
#Foreach loop that retrieves all members from each group. Creates a file for each group named with format groupname.csv
foreach($o365group in $o365groups)
            {
                $members = ""
                #If file is open this will error
                new-item -path "$path\$o365group.csv" -Force
                
                write-host Getting $o365group members -ForegroundColor Cyan
                get-ADGroupMember $o365group -Recursive|select name, samaccountname|export-csv "$path\$o365group.csv" -NoTypeInformation
            }

start "\\encmsoly1024\ofm\OFM\_Common\Purchasing, IT Software\Software Asset Management\AD Security Groups\Current"
