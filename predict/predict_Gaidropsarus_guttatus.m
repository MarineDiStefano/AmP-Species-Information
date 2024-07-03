function [prdData, info] = predict_Gaidropsarus_guttatus(par, data, auxData) 
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
%% compute temperature correction factors
  TC    = tempcorr(temp.am, T_ref, T_A);

  %% zero-variate data
  
  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, r_j, r_B, info] = get_tj(pars_tj, f);

  % birth
  L_b = L_m * l_b;                     % cm, structural, total length at birth
  Ww_b = L_b^3 * (1 + f * w);          % g, wet weight at birth at f

  % metam
  s_M = l_j/ l_b;                      % -, acceleration factor

  % puberty and ultimate size
  L_p = l_p * L_m; Lw_p = L_p/ del_M;  % cm, structural, total length at puberty
  Ww_p = L_p^3 * (1 + f * w);          % g, wet weight at puberty
  tT_p = (t_p - t_b)/ k_M/ TC;         % d, age at puberty
  
  % ultimate size
  L_i = L_m * l_i; Lw_i = L_i/ del_M;  % cm, ultimate structural, total length
  Ww_i = L_i^3 * (1 + f * w);          % g, ultimate wet weight

  % reproduction
  GSI = TC * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = 100 * GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2/ s_M^2); % mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
%% pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
%% uni-variate data

  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B] = get_tj(pars_tj, f);
  rT_B = TC * rho_B * k_M; rT_j = TC * rho_j * k_M; tT_j = (t_j - t_b)/ k_M/ TC;
  L_b = L_m * l_b;  L_j = L_m * l_j; L_i = L_m * l_i;
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, structural length at time
  tLw= L/ del_M;
  
%% pack to output
  prdData.tL = tLw;

