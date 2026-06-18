## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(collapse = TRUE, comment = "#>", eval = FALSE)

## -----------------------------------------------------------------------------
# library(bayesianOU)
# 
# # Two-level fit (market phi = Y, constructed production index = X, G' driver):
# fit <- fit_ou_nested(
#   Y = Y, X = X, TMG = TMG, COM = COM, CAPITAL_TOTAL = K,
#   n_levels = 2, Gprime = Gprime,
#   theta_separation = "soft", k_uncertainty = "meas",
#   chains = 4, iter = 4000, warmup = 2000
# )
# print(fit)              # separation evidence, reversion-speed ranges, MCMC health
# summary(fit)            # Level-2 parameter table + OOS metrics
# plot(fit, type = "phi") # latent production price with credible band
# plot(fit, type = "mu")  # G'-driven Level-2 mean trajectory

## -----------------------------------------------------------------------------
# fit_recon <- fit_ou_nested(
#   Y = Y, X = X, TMG = TMG, COM = COM, CAPITAL_TOTAL = K,
#   n_levels = 2, Gprime = Gprime,
#   k_uncertainty = "recon", k_cost = k_cost,   # cost price c + v (raw units)
#   priors = list(sigma_K_recon = 0.10)
# )

## -----------------------------------------------------------------------------
# ou_level_spec("canonical")   # Level 1 full, Level 2 lean (linear Gaussian OU)
# ou_level_spec("both_full")   # both levels full
# ou_level_spec("both_lean")   # both levels lean
# ou_level_spec("n1_lean")     # Level 1 lean, Level 2 lean
# 
# # Fit a configuration:
# fit_bf <- fit_ou_nested(Y, X, TMG, COM, K, n_levels = 2, Gprime = Gprime,
#                         level_spec = ou_level_spec("both_full"))

## -----------------------------------------------------------------------------
# s <- summary(fit_bf)
# s$level2_table          # now includes a3_p and nu_p rows when present
# s$sigma_p_t             # time-varying Level-2 SV scale (median + bands), or NULL
# plot(fit_bf, type = "sv_p")   # sigma_p(t) with credible band (when l2_sv is on)

## -----------------------------------------------------------------------------
# # Level-3 fit: production gravitates around the value anchor V = k_cost + EBO.
# fit3 <- fit_ou_nested(
#   Y = Y, X = X, TMG = TMG, COM = COM, CAPITAL_TOTAL = K,
#   n_levels = 3, Gprime = Gprime,
#   V_value = k_cost + EBO,          # direct price c + v + p (DIRECT construction)
#   sigma_phi_meas_fixed = 0.05      # K-deterministic anchor (D-IMPL-9.4)
# )
# summary(fit3)$level2_table         # now carries the m_v row (value coupling)

## -----------------------------------------------------------------------------
# mi3 <- fit_ou_nested_mi(
#   phi_draws = phi_draws, X = X, TMG = TMG, COM = COM, CAPITAL_TOTAL = K,
#   Gprime = Gprime, V_value = k_cost + EBO, n_levels = 3, M = 25,
#   sigma_phi_meas_fixed = 0.05
# )
# mi3$rubin[mi3$rubin$parameter == "m_v", ]   # Rubin-pooled value coupling

