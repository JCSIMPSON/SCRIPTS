# Catchphrase99 Decline Script - https://community.spiceworks.com/topic/2257360-reset-approval-status-of-all-updates-in-wsus


#decline Itanium, ARM64, and Previews
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Itanium*' -or $_.Update.Title -like '*ARM64*' -or $_.Update.Title -like '*Preview*'} | Deny-WsusUpdate

#decline all non-English updates
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*ar-sa*' -or $_.Update.Title -like '*bg-bg*' -or $_.Update.Title -like '*cs-cz*' -or $_.Update.Title -like '*da-dk*' -or $_.Update.Title -like '*de-de*' -or $_.Update.Title -like '*el-gr*' -or $_.Update.Title -like '*en-gb*' -or $_.Update.Title -like '*es-es*' -or $_.Update.Title -like '*es-mx*' -or $_.Update.Title -like '*et-ee*' -or $_.Update.Title -like '*fi-fi*' -or $_.Update.Title -like '*fr-ca*' -or $_.Update.Title -like '*fr-fr*' -or $_.Update.Title -like '*he-il*' -or $_.Update.Title -like '*hr-hr*' -or $_.Update.Title -like '*hu-hu*' -or $_.Update.Title -like '*it-it*' -or $_.Update.Title -like '*ja-jp*' -or $_.Update.Title -like '*ko-kr*' -or $_.Update.Title -like '*lt-lt*' -or $_.Update.Title -like '*lv-lv*' -or $_.Update.Title -like '*nb-no*' -or $_.Update.Title -like '*nl-nl*' -or $_.Update.Title -like '*pl-pl*' -or $_.Update.Title -like '*pt-br*' -or $_.Update.Title -like '*pt-pt*' -or $_.Update.Title -like '*ro-ro*' -or $_.Update.Title -like '*ru-ru*' -or $_.Update.Title -like '*sk-sk*' -or $_.Update.Title -like '*sl-si*' -or $_.Update.Title -like '*sr-latn-rs*' -or $_.Update.Title -like '*sv-se*' -or $_.Update.Title -like '*th-th*' -or $_.Update.Title -like '*tr-tr*' -or $_.Update.Title -like '*uk-ua*' -or $_.Update.Title -like '*zh-cn*' -or $_.Update.Title -like '*zh-hk*' -or $_.Update.Title -like '*zh-tw*'} | Deny-WsusUpdate

#decline Edge Dev and Beta
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Microsoft Edge-Beta*' -or $_.Update.Title -like '*Microsoft Edge-Dev*'} | Deny-WsusUpdate

#decline unused Windows 7 versions
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Windows 7*'} | Deny-WsusUpdate
#Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Windows 7 for x86*'} | Deny-WsusUpdate

#decline unused SQL versions
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*SQL Server 2016 Service Pack 1*'} | Deny-WsusUpdate

#decline unused Windows 10 versions
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Windows 10 Version 1507*' -or $_.Update.Title -like '*Windows 10 Version 1511*' -or $_.Update.Title -like '*Windows 10 Version 1607*' -or $_.Update.Title -like '*Windows 10 Version 1703*'} | Deny-WsusUpdate
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Windows 10 Version 1709 for x86*' -or $_.Update.Title -like '*Windows 10 Version 1803 for x86*' -or $_.Update.Title -like '*Windows 10 Version 1809 for x86*'} | Deny-WsusUpdate
Get-WsusUpdate -Approval UnApproved | Where{$_.Update.Title -like '*Windows Server 2016 (1709)*' -or $_.Update.Title -like '*Windows Server 2016 (1803)*'} | Deny-WsusUpdate
