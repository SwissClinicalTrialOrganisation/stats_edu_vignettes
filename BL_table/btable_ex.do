*net install github, from("https://haghish.github.io/github/")
*github install CTU-Bern/btable
clear
cd "C:\Users\roumet\Documents\Clinical_Studies\SCTO\stats_edu_vignettes\BL_table\Table"

sysuse auto2

* Generate table
btable price mpg rep78 headroom, by(foreign) saving("excars") denom(nonmiss)
use "excars.dta", clear
*Format table

btable_format using "excars", clear drop(effect test)
export delimited "btab1.csv", replace novarnames

btable_format using "excars", clear descriptive(conti median [lq, uq]) drop(total effect info test)

btable_format using "excars", clear desc(conti median [lq, uq] mpg mean (sd)) drop(total effect info test)
export delimited "btab2.csv", replace novarnames


