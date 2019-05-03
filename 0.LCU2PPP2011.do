local country "ury" 
local year=2017
local base "country(`country') years(2017) cpippp(ipc_sedlac ipc05_sedlac ppp05 ipc11_sedlac ppp11) clear"

* 1. call you database with cpi and ppp information. 
`base'
* 2. LCU is expresed in USD PPP 2011 with the following formula:
** gen double ipcf_ppp11 = ((ipcf*ipc11_sedlac)/ipc_sedlac)/(ppp11*conversion)
*3. The conversion factor can be calculated as:
qui gen double factor=((ipc11_sedlac)/ipc_sedlac)/(ppp11*conversion)
cap sum factor
local factor=`r(mean)'

*4. lines that to convert
local montevideo=12357
local urbano=8098
local rural=5427
*5. result
noi di "1 peso uruguayo de 2017 = `=1*`factor'' ppp2011"
noi di "Montevideo  `montevideo' pesos uruguayos de 2017 -> `=`montevideo'*`factor'/(365/12)' ppp2011 al mes"
noi di "Interior urbano `urbano' pesos uruguayos de 2017 -> `=`urbano'*`factor'/(365/12)' ppp2011 al mes"
noi di "Interior rural `rural' pesos uruguayos de 2017 -> `=`rural'*`factor'/(365/12)' ppp2011 al mes"

exit
*fin
