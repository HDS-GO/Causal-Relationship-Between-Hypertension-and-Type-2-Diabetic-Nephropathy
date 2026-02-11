setwd("C:\\Users\\14646\\Desktop\\NEWhu\\Fig1") 
library(dplyr)                            
library(ggplot2)
library(flextable)
library(officer)



his_fig <- GBDread(folder = T,
                   foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig1")
hisM2021_fig1 <- subset(his_fig,
                        measure== 'Deaths' &
                          metric != 'Percent' &
                          year==2021 &
                          age != 'Age-standardized' &
                          age != 'All ages'
)
hisM2021_fig2 <- GBD_factor(hisM2021_fig1)

Fig_hisM2021<-ggDx(hisM2021_fig2,x_axis='age',ratio='auto') +
  facet_grid(.~location)+
  scale_fill_manual(values = c("#A0A0A4", "#FD9F02","#004080")) +
  scale_color_manual(values = c("#9A9B9D", "#FD9F02","#004080"))  
print(Fig_hisM2021)
ggsave("Fig_hisM2021.pdf", width = 12, height = 9, plot = Fig_hisM2021, dpi = 300)

hisD2021_fig1 <- subset(his_fig,
                        measure== 'DALYs (Disability-Adjusted Life Years)' &
                          metric != 'Percent' &
                          year==2021 &
                          age != 'Age-standardized' &
                          age != 'All ages')
hisD2021_fig2 <- GBD_factor(hisD2021_fig1)
Fig_hisD2021<-ggDx(hisD2021_fig2,x_axis='age',ratio='auto') +
  facet_grid(.~location)+
  scale_fill_manual(values = c("#A0A0A4", "#FD9F02","#004080")) +
  scale_color_manual(values = c("#9A9B9D", "#FD9F02","#004080"))  
ggsave("Fig_hisD2021.pdf", width = 12, height = 9, plot = Fig_hisD2021, dpi = 300)

hisM1990_fig1 <- subset(his_fig,
                        measure== 'Deaths' &
                          metric != 'Percent' &
                          year==1990 &
                          age != 'Age-standardized' &
                          age != 'All ages')
hisM1990_fig2 <- GBD_factor(hisM1990_fig1)
Fig_hisM1990<-ggDx(hisM1990_fig2,x_axis='age',ratio='auto') +
  facet_grid(.~location)+
  scale_fill_manual(values = c("#a30543", "#80cba4","#fbda83")) +
  scale_color_manual(values = c("#a30543", "#80cba4","#fbda83")) 
print(Fig_hisM1990)
ggsave("Fig_hisM1990.pdf", width = 12, height = 9, plot = Fig_hisM1990, dpi = 300)
ggsave("Fig_hisM1990.png", width = 12, height = 9, plot = Fig_hisM1990, dpi = 300)

hisD1990_fig1 <- subset(his_fig,
                        measure== 'DALYs (Disability-Adjusted Life Years)' &
                          metric != 'Percent' &
                          year==1990 &
                          age != 'Age-standardized' &
                          age != 'All ages')
hisD1990_fig2 <- GBD_factor(hisD1990_fig1)
Fig_hisD1990<-ggDx(hisD1990_fig2,x_axis='age',ratio='auto') +
  facet_grid(.~location)+
  scale_fill_manual(values = c("#a30543", "#80cba4","#fbda83")) +
  scale_color_manual(values = c("#a30543", "#80cba4","#fbda83")) 
print(Fig_hisD1990)
ggsave("Fig_hisD1990.pdf", width = 12, height = 9, plot = Fig_hisD1990, dpi = 300)
ggsave("Fig_hisD1990.png", width = 12, height = 9, plot = Fig_hisD1990, dpi = 300)
