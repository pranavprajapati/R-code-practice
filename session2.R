myfirstname <- "Pranav"
mylastname <- "Prajapati"
myfirstlast <- c(myfirstname,mylastname)
avector <- c(1,2,3,4)
names(avector) <- c("one","two","three","four")
avector
typeof(avector)
elementnames <- names(avector)
x <-1:9
mode(x)
typeof(x)
length(x)
?factor()
cat <- c("good","bad","good","bad","bad","bad","good")
typeof(cat)
cat2 <- factor(cat)
cat2
typeof(cat2)
cat3 <- as.integer(cat)
cat4 <- as.integer(cat2)
cat5 <- factor(cat, levels = (c("good","bad")))
cat5
catnumb <- as.numeric(cat5)
days <- c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday")
days_factor <- factor(days)
days_factor <-factor(days, levels = c("Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"))
days_factor
