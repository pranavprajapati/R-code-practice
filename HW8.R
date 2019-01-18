
library(GPArotation)
library(psych)
myd <- read_xls("/Users/pranavprajapati/Desktop/Depression.xls")
attach(myd)
x <- cbind(C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12,C13,C14,C15,C16,C17,C18,C19,C20)

summary(x)
cor(x)

pc <- principal(x,nfactors = 4,rotate = "varimax")
pc
summary(pc)
loadings(pc)

f1 <- principal(x,nfactors = 4,rotate = "quartimin")
f1
summary(f1)
loadings(f1)
i_pc <- fa(x,nfactors = 4,rotate = "varimax")
i_pc

i_f1 <- fa(x,nfactors = 4,rotate = "quartimin")
i_f1

