


setwd("P:/MEL/Water Resources Team/Modelling and Assessment/Tools/Source/Data Updates/03 Inflows/2021/Analogue 2021/Tools/Analogue_Calculation")

Annual_Flow <- data.frame(read.csv("ANN_Data.csv"))

ANN_Data_3Antecedent <- data.frame(Annual_Flow[1:108,13],Annual_Flow[1:108,10:12])
colnames(ANN_Data_3Antecedent) <- c('Dec','Sep','Oct','Nov')

ANN_Data_11Antecedent <- data.frame(Annual_Flow[1:108,13],Annual_Flow[1:108,2:12])
colnames(ANN_Data_11Antecedent) <- c('Dec','Jan','Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul','Aug','Sep','Oct','Nov')

require(neuralnet)

MyANN_Fit_3Antecedent <-neuralnet(ANN_Data_3Antecedent, data=ANN_Data_3Antecedent, hidden=c(5,5),act.fct = "tanh",
                      linear.output = TRUE, stepmax = 1000000)

MyANN_Fit_11Antecedent <-neuralnet(ANN_Data_11Antecedent, data=ANN_Data_11Antecedent, hidden=c(5,5),act.fct = "tanh",
                                  linear.output = TRUE, stepmax = 1000000)

plot(MyANN_Fit_3Antecedent)

plot(MyANN_Fit_11Antecedent)


MyDecPrediction_3Antecedent=compute(MyANN_Fit_3Antecedent,Annual_Flow[109,2:12])

MyDec_3Antecedent <- MyDecPrediction_3Antecedent$net.result


MyDecPrediction_11Antecedent=compute(MyANN_Fit_11Antecedent,Annual_Flow[109,2:12])

MyDec_11Antecedent <- MyDecPrediction_11Antecedent$net.result



#Goulburn Vs 4 Major

setwd("C:\\Users\\jahanbah\\AppData\\Local\\Wathnet5\\Projects\\DOA_Jan2022")

Annual_Flow <- read.csv("Goulbvs4Major.csv")


ANN_Data <- data.frame(Annual_Flow[1:109,9],Annual_Flow[1:109,8])
colnames(ANN_Data) <- c('4Major','Goulburn')

require(neuralnet)

MyANN_Fit <-neuralnet(ANN_Data, data=ANN_Data, hidden=c(5,5),act.fct = "tanh",
                      linear.output = TRUE, stepmax = 1000000)


plot(MyANN_Fit_3Antecedent)

plot(MyANN_Fit_11Antecedent)


MyDecPrediction_3Antecedent=compute(MyANN_Fit_3Antecedent,Annual_Flow[109,2:12])

MyDec_3Antecedent <- MyDecPrediction_3Antecedent$net.result


MyDecPrediction_11Antecedent=compute(MyANN_Fit_11Antecedent,Annual_Flow[109,2:12])

MyDec_11Antecedent <- MyDecPrediction_11Antecedent$net.result



