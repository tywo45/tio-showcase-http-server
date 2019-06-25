rem -Xms64m -Xmx2048m

@echo off
setlocal & pushd
set APP_ENTRY=org.tio.http.server.showcase.HttpServerShowcaseStarter
set BASE=%~dp0
set CP=%BASE%\config;%BASE%\lib\*
java -Xverify:none -Xms64m -Xmx256m -XX:+HeapDumpOnOutOfMemoryError -Dtio.default.read.buffer.size=512 -XX:HeapDumpPath=/java-t-io-im-server-pid.hprof -cp "%CP%" %APP_ENTRY%
endlocal & popd
