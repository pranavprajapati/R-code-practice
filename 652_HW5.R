library(MASS)

m_lda <- lda(chronic ~ age + edu + income + dep + reg , data= Depression)
m_log <- glm(chronic ~ age + edu + income + dep + reg , data= Depression , family = 'binomial')

age<- c(34)
edu <- c(3)
income <- c(20)
dep <- c(0)
reg<- c(1)
new_entry <- data.frame(age,edu,income,dep,reg)

p_lda <- predict(m_lda, new_entry) 
p_lda 
p_log <- predict(m_log, new_entry, type="response") 
p_log

library(class)

train_knn <- data.frame(Depression$age,Depression$edu, Depression$income, Depression$dep,Depression$reg)
p_knn <- knn(train = train_knn, test = new_entry, cl = Depression$chronic)
p_knn


library(naivebayes)

nd <- data.frame(Depression)
nd$age <- as.factor(nd$age)
nd$edu <- as.factor(nd$edu)
nd$dep <- as.factor(nd$dep)
nd$income <- as.factor(nd$income)
nd$reg <- as.factor(nd$reg)
nd$chronic <- as.factor(nd$chronic)

m_nb <- naive_bayes(chronic ~ age + edu + income + dep + reg , data= nd)
m_nb
p_nb <- predict(m_nb, new_entry) 
p_nb
