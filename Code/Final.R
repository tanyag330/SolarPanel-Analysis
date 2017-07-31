getwd()

# library
library(ggplot2)
library(reshape2)

solar<-read.csv("AllSolar.csv")
d<-read.csv("AllRural11.csv")

#All States Non Renewable
dm<-melt(data = d,id.vars = "AreaName",measure.vars = c("Eper","Kper"))
ggplot(data=dm,aes(x=AreaName,y=value,fill=variable))+ggtitle("Percentage of Households in Rural India using Non-Renewable Energy")+geom_bar(stat = "identity",color="Black")+ylab("Household Percentage")+xlab("States in India")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))+  scale_colour_gradientn(colours=rainbow(1))+scale_fill_discrete(labels=c("Electricity", "Kerosene"),name="Ligthing Source")+coord_flip()


# All states Solar
ggplot(data=solar,aes(x=AreaName,y=Sper))+ggtitle("Percentage of Households in Rural India using Solar Energy")+geom_bar(stat = "identity",fill="Yellow1",color="Black")+ylab("Household Percentage")+xlab("States in India")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))+ coord_flip()

#All states No lighting
ggplot(data=d,aes(x=AreaName,y=Nper))+ggtitle("Percentage of Households having No source of Lighting in Rural India")+geom_bar(stat = "identity",fill="Black",color="Dark Grey")+ylab("Household Percentage")+xlab("States in India")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))+ coord_flip()

#JK Solar
jk<-read.csv("JKDistrict.csv")

ggplot(data=jk,aes(x=DistrictName,y=Sper))+ggtitle("Percentage of Households in Rural J&K using Solar Energy")+geom_bar(stat = "identity",fill="Yellow1",color="Black")+ylab("Household Percentage")+xlab("Districts in J&K")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))+ coord_flip()

#All Districts No lighting
ggplot(data=jk,aes(x=DistrictName,y=Nper))+ggtitle("Percentage of Households having No source of Lighting in Rural J&K")+geom_bar(stat = "identity",fill="Black",color="Dark Grey")+ylab("Household Percentage")+xlab("Districts in J&K")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))+ coord_flip()

#Poonch Sub-districts
p<-read.csv("Poonch.csv")

frst<-ggplot(data=p,aes(x=AreaName,y=Sper))+ggtitle("Percentage of Households in Rural Poonch using Solar Energy")+geom_bar(stat = "identity",fill="Gold",color="Black",width = 0.5)+ylab("Household Percentage")+xlab("Districts in Poonch")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))

#All Districts No lighting
sec<-ggplot(data=p,aes(x=AreaName,y=Nper))+ggtitle("Percentage of Households having No source of Lighting in Rural Poonch")+geom_bar(stat = "identity",fill="Black",color="White",width = 0.5)+ylab("Household Percentage")+xlab("Districts in Poonch")+theme_minimal()+   theme(plot.title = element_text(color="Black", face="bold", size=20, hjust=0,vjust = 0)) +  theme(axis.title = element_text(color="Black", size=15))

gridExtra::grid.arrange(frst,sec)