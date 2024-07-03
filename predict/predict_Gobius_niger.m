function [prdData, info] = predict_Gobius_niger(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);

  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth at f 

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * w);        % g, wet weight at puberty 
  tT_p = (t_p-t_b)/ k_M/ TC;        % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);                % #/d, ultimate reproduction rate at T

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC;                  % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;             % J/d.cm^2, {p_Am} spec assimilation flux
  E_m_m = p_Am_m/ v;                   % J/cm^3, reserve capacity [E_m]
  g_m = E_G/ (kap* E_m_m);             % -, energy investment ratio
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, max struct length
  L_bm = l_b * L_mm;                   % cm, struct length, birth & ultimate
  L_im = f * L_mm; Lw_im = L_im/ del_M; 
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ultimate wet weight
  L_pm = L_mm * l_p; Lw_pm = L_pm/ del_M;  % cm, total length
  Ww_pm = L_pm^3 * (1 + f * w_m);      % g, ultimate wet weight

  % pack to output
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lp = Lw_pm;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_pm;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  % time-weight: varying body temp
  f = f_tL; l_b = get_lb([g k v_Hb], f); L_b = L_m * l_b; L_i = f * L_m;
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC/ ir_B;  % d, 1/von Bert growth rate
  L = L_i - (L_i - L_b) * exp(- rT_B * tL_f(:,1));  % cm, structural length at time
  ELw_f = L/ del_M;                                 % cm, total length females
  %
  L_bm = L_mm * l_b; L_im = f * L_mm;
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC/ ir_B; % d, 1/von Bert growth rate
  L = L_im - (L_im - L_bm) * exp(- rT_B * tL_m(:,1)); % cm, structural length at time
  ELw_m = L/ del_M;                                 % cm, total length males

  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  