function [prdData, info] = predict_Merluccius_merluccius(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC    = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth

  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;         % d, age at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction at 78 cm
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(78 * del_M, f, pars_R);          % reproduction rate for fish of 78 cm

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
     
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  pars_tjm = [g_m k l_T v_Hb v_Hj v_Hpm];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  tT_pm = (t_p- t_b)/ k_M/ TC;         % d, time since birth at puberty
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M; % cm, total length at puberty

  % pack to output
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.tp = tT_p;
  prdData.tpm = tT_pm;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Lpm = Lw_pm;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  
 % uni-variate data

  % time-length 
  % females
  f = f_tL;
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL_f(:,1) * rT_j/ 3) .* (tL_f(:,1) < tT_j);
  L = L + (tL_f(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_f(:,1) - tT_j))); % cm, expected length at time
  tLw_f = L/ del_M;
  % males
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tjm, f);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_mm * l_b;  L_j = L_mm * l_j; L_i = L_mm * l_i;
  L = L_b * exp(tL_m(:,1) * rT_j/ 3) .* (tL_m(:,1) < tT_j);
  L = L + (tL_m(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL_m(:,1) - tT_j))); % cm, expected length at time
  tLw_m = L/ del_M;
  
% LW
  EWw = (LW(:,1) * del_M) .^ 3 * (1 + f * w); % g, wet weight 
  
%% pack to output
  prdData.tL_f = tLw_f;
  prdData.tL_m = tLw_m;
  prdData.LW = EWw;
