@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist C:\WA-GW\Xampp\hypersonic\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\server\hsql-sample-database\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\ingres\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\ingres\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\mysql\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\mysql\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\postgresql\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\postgresql\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\apache\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\apache\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\openoffice\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\openoffice\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\apache-tomcat\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\apache-tomcat\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\resin\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\resin\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\jboss\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\jboss\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\jetty\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\jetty\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\subversion\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\subversion\scripts\ctl.bat START)
rem RUBY_APPLICATION_START
if exist C:\WA-GW\Xampp\lucene\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\lucene\scripts\ctl.bat START)
if exist C:\WA-GW\Xampp\third_application\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\third_application\scripts\ctl.bat START)
goto end

:stop
echo "Stopping services ..."
if exist C:\WA-GW\Xampp\third_application\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\third_application\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\lucene\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\lucene\scripts\ctl.bat STOP)
rem RUBY_APPLICATION_STOP
if exist C:\WA-GW\Xampp\subversion\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\subversion\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\jetty\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\jetty\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\hypersonic\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\server\hsql-sample-database\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\jboss\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\jboss\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\resin\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\resin\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\apache-tomcat\scripts\ctl.bat (start /MIN /B /WAIT C:\WA-GW\Xampp\apache-tomcat\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\openoffice\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\openoffice\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\apache\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\apache\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\ingres\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\ingres\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\mysql\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\mysql\scripts\ctl.bat STOP)
if exist C:\WA-GW\Xampp\postgresql\scripts\ctl.bat (start /MIN /B C:\WA-GW\Xampp\postgresql\scripts\ctl.bat STOP)

:end

