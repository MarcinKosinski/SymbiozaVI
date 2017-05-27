library(ROCR)
pred <- prediction( scory[,2], df2$Is_Programmist)
perf <- performance(pred,"tpr","fpr")
plot(perf, colorize=T)

mojePredykcje <- ifelse(scory[,2] > 0.5, "To programista", "Nie jest programista")

table(mojePredykcje, df2$Is_Programmist)

## Regresja logistyczna

model <- glm(Is_Programmist ~ ., data=df[,wspolneKolumny[-1]], family = "binomial")
summary(model)

scoryGLM <- predict(model, df2[,-2], type = "response")

predGLM <- prediction( scoryGLM, df2$Is_Programmist)
perfGLM <- performance(predGLM,"tpr","fpr")
plot(perf, colorize=T)
plot(perfGLM, colorize=T, add=TRUE)