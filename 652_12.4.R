
library(ggplot2)
lf$fcat[lf$fev1f <= 409] = 1 
lf$fcat[lf$fev1f > 409] = 0

lf$fcat <- as.numeric(lf$fcat)


model <- glm(fcat ~ hf + wf + af + fvcf,data = lf, family = 'binomial')
summary(model)

model.probs <- predict(model,type="response")
model.probs[1:5]


data_space <- ggplot(data = lf, aes(y = fcat, x = fvcf)) + 
  geom_jitter(width = 0, height = 0.05, alpha = 0.5)

data_space +
  geom_smooth(method = "glm", se = FALSE, method.args = list(family = "binomial"))
