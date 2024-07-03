function [prdData, info] = predict_Arnoglossus_laterna(par, data, auxData) 
  
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
  aT_b = t_b/ k_M/ TC_ab;              % d, age at birth at f, temp corrected

  % metam
  L_j = L_m * l_j;                     % cm, structural length at metam
  Lw_j = L_j/ del_M;                   % cm, total length at metam
  
  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length

  % reproduction 
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp]; % compose parameter vector
  RT_i = TC * reprod_rate_j(L_i, f, pars_R);             % #/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%% pack to output
  prdData.ab = aT_b;
  prdData.am = aT_m;
  prdData.Lj = Lw_j;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Ri = RT_i;
  
%% uni-variate data

  % time-length 
  f = f_tL;[t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  kT_M = k_M * TC; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; tT_j = (t_j - t_b)/ kT_M;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M;  
  % time-weight
  EWw = L.^3 * (1 + f * w);
  
  % length-weight
  EWw_L = (LW(:,1) * del_M).^3 * (1 + f * w);
  
  
%% pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;  
  prdData.LW = EWw_L;