# ==============================================================================
# Script: Mendelian Randomization Analysis (HTN -> DN)
# Based on manuscript: "Causal Relationship Between Hypertension and Type 2 Diabetic Nephropathy"
# Software version: R 4.4.1 [cite: 86]
# ==============================================================================

# 1. Load required packages
library(TwoSampleMR)
library(MRPRESSO)
library(BWMR) # Requires installation via devtools/remotes
library(ggplot2)

# ==============================================================================
# Step 1: Exposure Data Extraction (Hypertension)
# Source: IEU Open GWAS (ID: GCST90038604) [cite: 351]
# Thresholds: P < 5e-8, r2 < 0.001, kb = 10000 [cite: 66, 67]
# ==============================================================================

# Option A: Extract directly from IEU Server
exposure_dat <- extract_instruments(
  outcomes = "GCST90038604",
  p1 = 5e-8,
  clump = TRUE,
  r2 = 0.001,
  kb = 10000
)

# Option B: Load from local summary statistics (Uncomment if using local file)
# exposure_dat <- read_exposure_data(
#   filename = "hypertension_gwas.txt",
#   sep = "\t",
#   snp_col = "SNP", beta_col = "BETA", se_col = "SE",
#   effect_allele_col = "A1", other_allele_col = "A2",
#   eaf_col = "EAF", pval_col = "P"
# )
# exposure_dat <- clump_data(exposure_dat, clump_r2 = 0.001, clump_kb = 10000)

# ==============================================================================
# Step 2: Outcome Data Extraction (Diabetic Nephropathy)
# Source: IEU Open GWAS (ID: GCST90018832) [cite: 351]
# ==============================================================================

outcome_dat <- extract_outcome_data(
  snps = exposure_dat$SNP,
  outcomes = "GCST90018832",
  proxies = TRUE
)

# ==============================================================================
# Step 3: Harmonization and Filtering
# ==============================================================================

# Harmonise data: action = 3 (exclude palindromic SNPs) [cite: 72]
dat <- harmonise_data(
  exposure_dat = exposure_dat,
  outcome_dat = outcome_dat,
  action = 3
)

# Calculate F-statistic and exclude weak instruments (F > 10) [cite: 69, 70]
dat$F_stat <- dat$beta.exposure^2 / dat$se.exposure^2
dat <- subset(dat, F_stat > 10)

# Manually remove specific confounder SNPs if identified via PhenoScanner [cite: 71]
# dat <- subset(dat, !SNP %in% c("rs74439044", "rs1801253", "rs1275988")) [cite: 112]

print(paste("Number of SNPs used:", nrow(dat)))

# ==============================================================================
# Step 4: Main MR Analysis
# Methods: IVW (Primary), MR-Egger, Weighted Median, Weighted Mode, Simple Mode [cite: 74]
# ==============================================================================

mr_methods <- c(
  "mr_ivw",
  "mr_ivw_fe",
  "mr_egger_regression",
  "mr_weighted_median",
  "mr_weighted_mode",
  "mr_simple_mode"
)

res <- mr(dat, method_list = mr_methods)
res_or <- generate_odds_ratios(res)
print(res_or)

# ==============================================================================
# Step 5: Sensitivity Analysis
# ==============================================================================

# 1. Heterogeneity Test (Cochran's Q) [cite: 81]
het <- mr_heterogeneity(dat)
print(het)

# 2. Horizontal Pleiotropy Test (MR-Egger Intercept) [cite: 83]
pleio <- mr_pleiotropy_test(dat)
print(pleio)

# 3. Directionality Test (Steiger Filtering) [cite: 76]
steiger <- directionality_test(dat)
print(steiger)

# 4. MR-PRESSO (Outlier Detection) [cite: 85]
set.seed(12345)
presso <- run_mr_presso(
  BetaOutcome = "beta.outcome",
  BetaExposure = "beta.exposure",
  SdOutcome = "se.outcome",
  SdExposure = "se.exposure",
  OUTLIERtest = TRUE,
  DISTORTIONtest = TRUE,
  data = dat,
  NbDistribution = 1000,
  SignifThreshold = 0.05
)
print(presso)

# 5. Leave-one-out Analysis [cite: 84]
res_loo <- mr_leaveoneout(dat)

# ==============================================================================
# Step 6: Bayesian Weighted MR (BWMR)
# Used to verify causal relationship and adjust for pleiotropy [cite: 77]
# ==============================================================================

BetaX <- dat$beta.exposure
BetaY <- dat$beta.outcome
seX <- dat$se.exposure
seY <- dat$se.outcome

fit_bwmr <- BWMR(gamma = BetaX, Gamma = BetaY, sigma = seX, Sigma = seY)

print(paste("BWMR Beta:", fit_bwmr$beta))
print(paste("BWMR SE:", fit_bwmr$se_beta))
print(paste("BWMR P-value:", fit_bwmr$P_value))

# ==============================================================================
# Step 7: Visualization
# ==============================================================================

# Scatter Plot [cite: 124]
p1 <- mr_scatter_plot(res, dat)
print(p1[[1]] + theme_bw() + ggtitle("Scatter Plot: HTN on DN"))

# Funnel Plot [cite: 125]
res_single <- mr_singlesnp(dat)
p2 <- mr_funnel_plot(res_single)
print(p2[[1]] + theme_bw() + ggtitle("Funnel Plot"))

# Leave-one-out Plot [cite: 126]
p3 <- mr_leaveoneout_plot(res_loo)
print(p3[[1]] + theme_bw() + ggtitle("Leave-one-out Analysis"))