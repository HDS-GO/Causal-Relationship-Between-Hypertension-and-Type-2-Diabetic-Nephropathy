setwd("C:\\Users\\14646\\Desktop\\NEWhu\\Fig5")
df <- GBDread(folder = T,
              foldername = "C:\\Users\\14646\\Desktop\\NEWhu\\Fig5")
bapc_results <- GBDbapc_prediction(
  data = df,
  measure_name = "Deaths",
  cause_name = "Chronic kidney disease due to diabetes mellitus type 2",
  location_name = c("Global"),
  rei_name = "High systolic blood pressure",
  By_sex = T,
  predyear = 2045,
  full_age_adjusted = F,
  rate_lessen = NULL,
  pop_predict = "GBD"
)


age_colors_gradient_reversed <-  c(
  "#D60000", 
  "#DC2626",  
  "#E54B4B",  
  "#F6803B", 
  "#FFB300",  
  "#C6EFCE",  
  "#98D8C8", 
  "#6ABF69",  
  "#3D9F3D", 
  "#1F7F1F",  
  "#4C6C9E",  
  "#5B8CA0", 
  "#6C94BE", 
  "#7D9AC7",
  "#947CAB"
 
)


preageD <- ggprediction_age_Dx(
  bapc_results,
  ratio = 'auto',
  CI = T,
  predict_start = 2022,
  group_name = "age",
  location_name = "Global",
  measure_name = "Deaths",
  cause_name = "Chronic kidney disease due to diabetes mellitus type 2",
  rei_name = "High systolic blood pressure",
  sex_name = "Both",
  age_name = c('25 to 29','30 to 34','35 to 39','40 to 44','45 to 49','50 to 54','55 to 59','60 to 64','65 to 69','70 to 74','75 to 79','80 to 84','85 to 89','90 to 94','95 plus')
) + 
  facet_wrap(.~sex) +
  scale_color_manual(values = age_colors_gradient_reversed) +
  scale_fill_manual(values = age_colors_gradient_reversed) 
library(ggplot2)
print(preageD)
ggsave("preageM.png", width = 12, height = 8, plot = preageD, dpi = 300)
ggsave("preagem.pdf", width = 12, height = 8, plot = preageD, dpi = 300)


bapc_results2 <- GBDbapc_prediction(
  data = df,
  measure_name = "DALYs (Disability-Adjusted Life Years)",
  cause_name = "Chronic kidney disease due to diabetes mellitus type 2",
  location_name = c("Global"),
  rei_name = "High systolic blood pressure",
  By_sex = T,
  predyear = 2045,
  full_age_adjusted = F,
  rate_lessen = NULL,
  pop_predict = "GBD"
)
preageD <- ggprediction_age_Dx(
  bapc_results2,
  ratio = 'auto',
  CI = T,
  predict_start = 2022,
  group_name = "age",
  location_name = "Global",
  measure_name = "DALYs (Disability-Adjusted Life Years)",
  cause_name = "Chronic kidney disease due to diabetes mellitus type 2",
  rei_name = "High systolic blood pressure",
  sex_name = "Both",
  age_name = c('25 to 29','30 to 34','35 to 39','40 to 44','45 to 49','50 to 54','55 to 59','60 to 64','65 to 69','70 to 74','75 to 79','80 to 84','85 to 89','90 to 94','95 plus')
) + 
  facet_wrap(.~sex) +
  scale_color_manual(values = age_colors_gradient_reversed) +
  scale_fill_manual(values = age_colors_gradient_reversed) 
library(ggplot2)
print(preageD)
ggsave("preageD.png", width = 12, height = 8, plot = preageD, dpi = 300)
ggsave("preageD.pdf", width = 12, height = 8, plot = preageD, dpi = 300)

age_colors_gradient_reversed <-  c(
  "#FF9999", 
  "#FF7A7A",  
  "#FF5555",  
  "#FFD97D", 
  "#FFE08C",  
  "#E8FF8C",  
  "#C8FF8C", 
  "#B2FFB2",  
  "#80FFD9",  
  "#40C4FF", 
  "#20B2FF",  
  "#6688FF",  
  "#9478FF",  
  "#B886C3", 
  "#D6B4E6" ,
  "#E0C3F0",
  "#F0C3FF"
)


preageD2 <- ggprediction_age_Dx(
  bapc_results2,
  ratio = 'auto',
  CI = T,
  predict_start = 2022,
  group_name = "age",
  location_name = "Global",
  measure_name = "DALYs (Disability-Adjusted Life Years)",
  cause_name = 'Chronic kidney disease due to hypertension',
  rei_name = NULL,
  sex_name = "Both",
  age_name = c('15 to 19','20 to 24','25 to 29','30 to 34','35 to 39','40 to 44','45 to 49','50 to 54','55 to 59','60 to 64','65 to 69','70 to 74','75 to 79','80 to 84','85 to 89','90 to 94','95 plus')
) + 
  facet_wrap(.~sex) +
  scale_color_manual(values = age_colors_gradient_reversed) +
  scale_fill_manual(values = age_colors_gradient_reversed) 
library(ggplot2)
print(preageD2)
ggsave("preageD.png", width = 12, height = 8, plot = preageD2, dpi = 300)
ggsave("preageD.pdf", width = 12, height = 8, plot = preageD2, dpi = 300)

