function [prdData, info] = predict_Uranoscopus_scaber(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = TC * k_M;
  
% zero-variate data

  % life cycle
  pars_tj = [g k l_T v_Hb v_Hj v_Hp];
  [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f
  
  % metam
  tT_j = (t_j - t_b)/ kT_M;         % d, time since birth at metam
  L_j = l_j * L_m;                  % cm, structural length at metam
  
  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 

  % ultimate
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  
  % length-fecundity
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hj; U_Hp];              % compose parameter vector at T
  EN_L = 365 * TC * reprod_rate_j(LN(:,1) * del_M, f, pars_R);               % #, fecundity
  EN_W = 365 * TC * reprod_rate_j((WN(:,1)/ (1 + f * w)).^(1/3), f, pars_R); % #, fecundity
  
  % time-length 
  f = f_tL; [t_j, t_p, t_b, l_j, l_p, l_b, l_i, rho_j, rho_B, info] = get_tj(pars_tj, f);
  L_b = L_m * l_b; L_i = L_m * l_i; rT_B = rho_B * kT_M; rT_j = rho_j * kT_M; 
  L = L_b * exp(tL(:,1) * rT_j/ 3) .* (tL(:,1) < tT_j);
  L = L + (tL(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tL(:,1) - tT_j))); % cm, expected length at time
  ELw = L/ del_M; % cm, total length
  % time-weight
  L = L_b * exp(tW(:,1) * rT_j/ 3) .* (tW(:,1) < tT_j);
  L = L + (tW(:,1) >= tT_j) .* (L_i - (L_i - L_j) * exp( - rT_B * (tW(:,1) - tT_j))); % cm, expected length at time
  EWw = L.^3 * (1 + f * w); % g, wet weight
  
  %% pack to output
  prdData.tL = ELw;
  prdData.tW = EWw;
  prdData.LN = EN_L;
  prdData.WN = EN_W;

