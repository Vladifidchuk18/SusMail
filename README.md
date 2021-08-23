C2 over Microsofts' Outlook based on Octopus as backend

# What is Octopus ? ![](https://img.shields.io/badge/python-3-yellow)
  Octopus is an open source, pre-operation C2 server based on python which can control an Octopus powershell agent through HTTP/S.

'SusMail' leverages the Outlook Application Interface (COM Interface) to execute shellcode on a system based on a specific trigger subject line. By utilizing the Microsoft.Office.Interop.Outlook namespace, developers can represent the entire Outlook Application. 



# About the PowerShell agent 
This is gonna ran on the victim's machine(inside the internal organization):
just run the script: ```./AllInOne.ps1```




# Requirements & Pre-requisites & installation

1. Machine that will hold the backend based on Octupus(python) - You can install all  Octopus' requirements via :

```pip install -r requirements.txt```

You have to change the next details before you start:
* change the $username and $password ```./agents/agent.ps1.oct ```
* erasing all the emails from the inbox
* permit email account communication with low security apps
if there any problem with it:
https://support.google.com/mail/answer/7126229?visit_id=637650667152983230-1024873670&rd=2#cantsignin&zippy=%2C%D7%9C%D7%90-%D7%94%D7%A6%D7%9C%D7%97%D7%AA%D7%99-%D7%9C%D7%94%D7%99%D7%9B%D7%A0%D7%A1-%D7%9C%D7%AA%D7%95%D7%9B%D7%A0%D7%AA-%D7%94%D7%90%D7%99%D7%9E%D7%99%D7%99%D7%9C-%D7%A9%D7%9C%D7%99


`./octopus.py`

You will by greeted with the following once you run it :

```
┌─[askar@hackbook]─[/opt/redteaming/Octopus]
└──╼ $python3 octopus.py



      ___           ___                       ___           ___         ___           ___
     /  /\         /  /\          ___        /  /\         /  /\       /__/\         /  /\
    /  /::\       /  /:/         /  /\      /  /::\       /  /::\      \  \:\       /  /:/_
   /  /:/\:\     /  /:/         /  /:/     /  /:/\:\     /  /:/\:\      \  \:\     /  /:/ /\
  /  /:/  \:\   /  /:/  ___    /  /:/     /  /:/  \:\   /  /:/~/:/  ___  \  \:\   /  /:/ /::\
 /__/:/ \__\:\ /__/:/  /  /\  /  /::\    /__/:/ \__\:\ /__/:/ /:/  /__/\  \__\:\ /__/:/ /:/\:\
 \  \:\ /  /:/ \  \:\ /  /:/ /__/:/\:\   \  \:\ /  /:/ \  \:\/:/   \  \:\ /  /:/ \  \:\/:/~/:/
  \  \:\  /:/   \  \:\  /:/  \__\/  \:\   \  \:\  /:/   \  \::/     \  \:\  /:/   \  \::/ /:/
   \  \:\/:/     \  \:\/:/        \  \:\   \  \:\/:/     \  \:\      \  \:\/:/     \__\/ /:/
    \  \::/       \  \::/          \__\/    \  \::/       \  \:\      \  \::/        /__/:/
     \__\/         \__\/                     \__\/         \__\/       \__\/         \__\/




 Octopus C2 | Control your shells


Octopus >>

```
# Usage

> listen_http 0.0.0.0 8080 <your_domain> 10 comments1.php <listener_name>
> generate_powershell <listener_name>


*Now copy the first IEX and run it from machine that has access to your gmail account


> (after connection established): 
> interact 1
* And you will able to run os PS commands




# Credits
based on Octopus Project, thanks for * [mhaskar](https://github.com/mhaskar/Octopus)


