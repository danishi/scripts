::**************************************************
:: Select`Case•¶
::**************************************************
@echo off

set Case=?
set /p Case=?

:Select
goto Case%Case%

	:Case1
	echo case1
	goto CaseEnd

	:Case2
	echo case2
	goto CaseEnd

	:Case3
	echo case3
	goto CaseEnd

	:Case?
	echo case?
	goto CaseEnd

:CaseEnd

pause > nul
