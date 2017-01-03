clc;
h = actxserver('WScript.Shell');
h.Run('MediaPortal'); %Invokes notepad.exe
pause(20); %Waits for the application to load.
h.AppActivate('MediaPortal'); %Brings notepad to focus
h.SendKeys('{UP}'); %Sends keystrokes
pause(5);
h.SendKeys('~');
pause(10);
h.SendKeys('%{F4}');