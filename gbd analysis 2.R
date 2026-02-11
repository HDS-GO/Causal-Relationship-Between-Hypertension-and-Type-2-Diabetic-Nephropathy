install.packages("jsonlite",type="source")
# 安装依赖包
options(timeout=1000000)
install.packages("RStata")
install.packages("broom")
install.packages("colorfindr")
install.packages("configr")
install.packages("do")
install.packages("doParallel")
install.packages("epitools")
install.packages("ggnewscale")
install.packages("ggpmisc")
install.packages("ggrepel")
install.packages("ggsci")
install.packages("patchwork")
install.packages("sf")
install.packages("snow")
install.packages("snowfall")
install.packages("tidytable")
install.packages("FactoMineR")

library(easyGBDR)
install.packages('writexl')
library(easyGBDR)
GBD_edition(2021)
GBD_edition(2021)
?GBDread
setwd("C:\\Users\\14646\\Desktop\\NEWhu\\Fig2")

GBD_edition(edition = 2021)#2019/2021


mapdata <- GBDread(folder = T,
                   foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig2")

mapdata_2021_ASMR <- subset(mapdata, 
                            year =='2021' &
                              measure == 'Deaths' &
                              age == 'Age-standardized'&
                              metric == 'Rate')

mapdata_2021_ASMR$val2 <- Quantile(mapdata_2021_ASMR$val,n=6)
class(mapdata_2021_ASMR$val2)
unique((mapdata_2021_ASMR$val2))
map_2021_M <- ggGBDmap(
  mapdata_2021_ASMR,
  variable="val2",
  color = "scale_fill_manual(values=c('#ebcce2','#dda1be','#c87d98','#b25f79','#9b3f5c','#832440')) + 
  scale_color_manual(values=c('#ebcce2','#dda1be','#c87d98','#b25f79','#9b3f5c','#832440'))",
  guide_name = NULL
)
print(map_2021_M)
library(ggplot2)
ggsave("map_2021_M.pdf", width = 12, height = 9, plot = map_2021_M, dpi = 300)
ggsave("map_2021_M.png", width = 12, height = 9, plot = map_2021_M, dpi = 300)




install.packages("ggplot2")
library(ggplot2)
GBD_edition(edition = 2021)

#读取数据
mapdata <- GBDread(folder = T,
                   foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig2")

mapdata_2021_ASMR <- subset(mapdata, 
                            year =='1990' &
                              measure == 'Deaths' &
                              age == 'Age-standardized'&
                              metric == 'Rate')

mapdata_2021_ASMR$val2 <- Quantile(mapdata_2021_ASMR$val,n=6)
class(mapdata_2021_ASMR$val2)
unique((mapdata_2021_ASMR$val2))
map_2021_M <- ggGBDmap(
  mapdata_2021_ASMR,
  variable="val2",
  color = "scale_fill_manual(values=c('#ebcce2','#dda1be','#c87d98','#b25f79','#9b3f5c','#832440')) + 
  scale_color_manual(values=c('#ebcce2','#dda1be','#c87d98','#b25f79','#9b3f5c','#832440'))",
  guide_name = NULL
)
print(map_2021_M)
library(ggplot2)
ggsave("map_1990_M.pdf", width = 12, height = 9, plot = map_2021_M, dpi = 300)
ggsave("map_1990_M.png", width = 12, height = 9, plot = map_2021_M, dpi = 300)
install.packages("ggplot2")
library(ggplot2)




mapdata <- GBDread(folder = T,
                   foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig2")
mapdata_1990_ASMR <- subset(mapdata, 
                            year =='2021' &
                              measure == 'DALYs (Disability-Adjusted Life Years)' &
                              age == 'Age-standardized'&
                              metric == 'Rate')

mapdata_1990_ASMR$val2 <- Quantile(mapdata_1990_ASMR$val,n=6)
class(mapdata_1990_ASMR$val2)
unique((mapdata_1990_ASMR$val2))
map_1990_D <- ggGBDmap(
  mapdata_1990_ASMR,
  variable="val2",
  color = "scale_fill_manual(values=c('#a8dde1','#75b5dc','#478ecc','#326db6','#2c4ca0','#313772')) + 
  scale_color_manual(values=c('#a8dde1','#75b5dc','#478ecc','#326db6','#2c4ca0','#313772'))",
  guide_name = NULL
)
print(map_1990_D)
ggsave("map_2021_D.pdf", width = 12, height = 9, plot = map_1990_D, dpi = 300)
ggsave("map_2021_D.png", width = 12, height = 9, plot = map_1990_D, dpi = 300)


mapdata <- GBDread(folder = T,
                   foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig2")
mapdata_1990_ASMR <- subset(mapdata, 
                            year =='1990' &
                              measure == 'DALYs (Disability-Adjusted Life Years)' &
                              age == 'Age-standardized'&
                              metric == 'Rate')

mapdata_1990_ASMR$val2 <- Quantile(mapdata_1990_ASMR$val,n=6)
class(mapdata_1990_ASMR$val2)
unique((mapdata_1990_ASMR$val2))
map_1990_D <- ggGBDmap(
  mapdata_1990_ASMR,
  variable="val2",
  color = "scale_fill_manual(values=c('#a8dde1','#75b5dc','#478ecc','#326db6','#2c4ca0','#313772')) + 
  scale_color_manual(values=c('#a8dde1','#75b5dc','#478ecc','#326db6','#2c4ca0','#313772'))",
  guide_name = NULL
)
print(map_1990_D)
ggsave("map_1990_D.pdf", width = 12, height = 9, plot = map_1990_D, dpi = 300)
ggsave("map_1990_D.png", width = 12, height = 9, plot = map_1990_D, dpi = 300)


ggsave("Humap_2021_D.pdf", width = 12, height = 9, plot = map_1990_D, dpi = 300)


