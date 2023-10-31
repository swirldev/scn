

# setwd("D:\\D\\Recovered NTFS Partition @ 0\\econometrics doc\\Economic Lecture note")
# sim_data=read.csv(file="sim.csv",header=T,sep=",")
## sim=sim_data
# sim_data=sim
sim_data=sim_data[,-1]
sim_data=log(sim_data)
##sim_data$year=sim$year


we have a data on some characteristics of the wine industry in Australia, saved as 'win'.It is assumed that a reasonable demand-supply model for the industry would be (where all variables are in logs)':'Demand equation [Q_t=a0+a1PW_t+a2PB_t+a3Y_t+a4A_t+u_t], Supply equation[Q_t=b0+b1PW_t+b2S_t+v_t] where Q is real per capita consumption of wine, PW is the price of wine relative to CPI, PB is the price of beer relative to CPI, Y is real per capita disposable income, A is real per capita advertising expenditure, and S is index of storage costs.Here 'Q' and 'PW' are the two endogenous variables while the rest are exogenous variables.   
                                                                                                                                                                 


names(sim_data)=c("Qt","S","PW","PB","A","Y","year")
d=sim_data
attach(d)

head(d,2)

# 1. Estimation of supply fuction, use PB(price of beer )as IV
#step1:regress PW on PB and S
IV_of_PW=lm(PW~PB+S)

######## step2: get the predicted value of PW from step1
IV_of_PW_ftd=fitted(IV_of_PW)

######final step: regress Qt on IV_of_PW_ftd and S
SupplyM=lm(Qt~IV_of_PW_ftd+S)
summary(SupplyM)

#####   2 use A as IV
##### # Step1:regress PW on A & S

IV_of_PW_from_A=lm(PW~A+S)
IV_of_PW_from_A_ftd=fitted(IV_of_PW_from_A)

######step2:regress Qt on pw_fitted_Adv & S
SupplyM2=lm(Qt~IV_of_PW_from_A_ftd+S)
summary(SupplyM2)

################   3 use Y as IV

######step1:regress PW on Y & S
IV_of_PW_from_Y=lm(PW~Y+S)
IV_of_PW_from_Y_ftd=fitted(IV_of_PW_from_Y)

##########step2:regress Qt on IV_of_PW_from_Y_ftd & S
SupplyM3=lm(Qt~IV_of_PW_from_Y_ftd+S)
summary(SupplyM3)

# Estimation of demand equation, exactly identfied
# hence, only 1 IV, i.e., storage cost(S)
#1. regress price of wine(PW) on S(IV),PB,Y,A

IV_demand_PW_2SL<-lm(PW~S+PB+Y+A)
IV_demand_PW_2SL_ftd<-fitted(IV_demand_PW_2SL)


#step2:regress Qt on pw_fitted_storage, PB,Y,A
DemandMod<-lm(Qt~IV_demand_PW_2SL_ftd+PB+Y+A)
summary(DemandMod) 
library(car)
vif(DemandMod)

############### however there is MC b/n Y &A
#######  Let's drop A
DemandMod<-lm(Qt~IV_demand_PW_2SL_ftd+PB+Y)
summary(DemandMod) 
vif(DemandMod)

#        B Estimation using 2SLS method
# Applicable for over estimation
#1.estiamte the reduced form by OLS and obtain predicted_y
#2.Replace the endogenous in the right hand side of Structural_EM by predicted_y
# and then apply OLS

# step1:

# Suppy Function
#           
#            reg_pw_2SL=lm(PW~S+PB+A+Y)
#            reg_pw_2SL_f=fitted(reg_pw_2SL)
#             a$reg_pw_2SL_f=reg_pw_2SL_f
#             reg_supply_Model=lm(Qt~reg_pw_2SL_f+S)
#             summary(reg_supply_Model)


Demand Function
#               reg_demand=lm(Qt~reg_pw_2SL_f+PB+Y+A)
#                 vif(reg_demand)
MC==>Remove A
#            reg_demand=lm(Qt~reg_pw_2SL_f+PB+Y)
#            summary(reg_demand)
Hence You get Same result with INSTRUMENTAL METHOD OF ESTIMATION(IV)) for Exactly Identfied Model














