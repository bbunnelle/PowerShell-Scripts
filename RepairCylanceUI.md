# Repair Cylance UI Help

If you have deployed Cylance Anti-Virus in your environment with the parameter "LAUNCHAPP=0" (No UI), this "Function" will help restore the UI.

This script has to be ran with "NT AUTHORITY\SYSTEM" permissions or it will not work due to the nature of the registry hive permissions for Cylance.

Due to the scope of this "Function" and the requirement to run as "NT AUTHORITY\SYSTEM", you will need to Dot-Source this script.

## Example:
###### . '.\RepairCylanceUI.ps1' Repair-CylanceUI -UIMode Full