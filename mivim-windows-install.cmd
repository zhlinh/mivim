REM    Copyright 2015 zhlinh
REM
REM     Have fun with Vim
REM
REM		  .............
@if not exist "%HOME%" @set HOME=%USERPROFILE%
@set APP_PATH=%cd%
call mklink "%HOME%\_vimrc" "%APP_PATH%\.vimrc"
call mklink /J "%HOME%\.vim" "%APP_PATH%\.vim" 	
IF NOT EXIST "%APP_PATH%\.vim\bundle" (
    call mkdir "%APP_PATH%\.vim\bundle"
)
IF NOT EXIST "%APP_PATH%\.vim\bundle\vundle" (
	echo "Instlling Vundle"
    call git clone https://github.com/gmarik/vundle.git "%HOME%\.vim\bundle\vundle"
)

call vim -u "%APP_PATH%\.vimrc" +BundleInstall! +BundleClean +qall
