REM          Copyright 2015 zhlinh
REM
REM           Have fun with Vim
REM
REM << Be the change you want to see the world >>
@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%
@set APP_PATH=%cd%
IF EXIST "%HOME%\_vimrc" (
    call del "%HOME%\_vimrc"
)
IF EXIST "%HOME%\.vimrc.bundles" (
    call del "%HOME%\.vimrc.bundles"
)
IF EXIST "%HOME%\.vim" (
    call rd /Q "%HOME%\.vim"
)

call mklink "%HOME%\_vimrc" "%APP_PATH%\.vimrc"
call mklink "%HOME%\.vimrc.bundles" "%APP_PATH%\.vimrc.bundles"
call mklink /J "%HOME%\.vim" "%APP_PATH%\.vim"
IF NOT EXIST "%APP_PATH%\.vim\bundle" (
    call mkdir "%APP_PATH%\.vim\bundle"
)
IF NOT EXIST "%APP_PATH%\.vim\bundle\vundle" (
    @echo Instlling Vundle...
    call git clone https://github.com/VundleVim/Vundle.vim "%HOME%\.vim\bundle\Vundle.vim"
)

call vim -u "%APP_PATH%\.vimrc" +BundleInstall! +BundleClean +qall
@echo Installation completed!
@pause
