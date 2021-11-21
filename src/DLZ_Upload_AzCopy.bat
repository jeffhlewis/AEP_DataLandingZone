@echo off

rem -----=====-----=====-----=====-----=====-----=====-----=====
rem Uploads a single file from a local file store to an 
rem Adobe Experience Platform Data Landing Zone using
rem the Azure AzCopy utility. Assumes you have PATH vars
rem set for AzCopy (otherwise path to azcopy.exe is 
rem required).
rem 
rem Note that certain characters in the sas URI (i.e., "%")
rem must be properly escaped.
rem 
rem Author:     Jeff Lewis (jeflewis@adobe.com)
rem Created On: 2021-11-21
rem -----=====-----=====-----=====-----=====-----=====-----=====

set sasUri=<FULL SAS URI, PROPERLY ESCAPED>
set srcFilePath=<PATH TO LOCAL FILE(S); WORKS WITH WILDCARD PATTERNS>

azcopy copy "%srcFilePath%" "%sasUri%" --overwrite=true --recursive=true
