#Load COS7_Lifetime dataset (COS7_Lifetime.csv file)
data <- read.csv(file.choose(), header = T)
data
#Plot violin splot with jitter and swap the positions of the x-label 
ggplot(data, aes(Conditions, Lifetime.s, col=as.factor(Replicate))) +
  geom_violin(col="orange") +
  scale_x_discrete(limits=c("Bef", "Aft")) +
  geom_point(position = position_jitter(0.2)) +
  scale_color_discrete(name="Replicate")
#assign plot to myplot2
myplot2 <- ggplot(data, aes(Conditions, Lifetime.s, col=as.factor(Replicate))) +
  geom_violin(col="orange") +
  scale_x_discrete(limits=c("Bef", "Aft")) +
  geom_point(position = position_jitter(0.2))+
  scale_color_discrete(name="Replicate")
#customising plot and finishing touch...
myplot2 + theme(panel.background = element_rect(fill = "white"),
                axis.line.x.bottom = element_line(colour = "black", size = 0.5),
                axis.line.y.left = element_line(colour = "black", size = 0.5),
                axis.title.x = element_text(size=15),
                axis.title.y.left = element_text(size=15),
                axis.text.x = element_text(size=10),
                axis.text.y = element_text(size=10))+
  labs(x="Conditions", y="Life time(s)")
#Saving plot
setwd("~/Desktop")
ggsave("COS7_LanA_Lifetimes.tiff", width = 8, height = 5)
