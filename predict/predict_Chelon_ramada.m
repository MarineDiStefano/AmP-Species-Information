function [prdData, info] = predict_Chelon_ramada(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC = tempcorr(temp.am, T_ref, T_A); kT_M = k_M * TC;
  
  % zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Ww_b = L_b^3 * (1 + f * w);       % g, wet weight at birth

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 * (1 + f * w);       % g, wet weight at puberty

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC * reprod_rate(L_i, f, pars_R);   % #/d, max reproduction rate 

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ kT_M;                     % d, mean life span at T
  
  % males
  p_Amm = z_m * p_M/ kap;              % J/d.cm^2, {p_Am} max spec assimilation flux for males
  E_m_m = p_Amm/ v;                    % J/cm^3, [E_m] reserve capacity for males
  g_m = E_G/ kap/ E_m_m;               % -, energy investment ratio for males
  m_Em_m = y_E_V * E_m_m/ E_G;         % mol/mol, reserve capacity 
  w_m = m_Em_m * w_E/ w_V;             % -, contribution of reserve to weight
  L_mm = v/ k_M/ g_m;                  % cm, maximum structural length for males
  L_im = L_mm * f; Lw_im = L_im/ del_M;% cm,  ult total length
  Ww_im = L_im^3 * (1 + f * w_m);      % g, ult wet weight
  
  % pack to output
  prdData.am = aT_m;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Lim = Lw_im;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Wwim = Ww_im;
  prdData.Ri = RT_i;
  
  % uni-variate data
  
  % time-length 
  L_b = L_m * get_lb ([g; k; v_Hb], f_tL); L_i = L_m * f_tL; % cm, struct lengths
  rT_B = kT_M/ 3/ (1 + f_tL/ g);                             % 1/d, von Bert growth rate
  ELw_f = (L_i - (L_i - L_b) * exp( - rT_B * tL_f(:,1)))/ del_M; % cm, total length 
  %
  L_bm = L_mm * get_lb ([g_m; k; v_Hb], f_tL); L_im = L_mm * f_tL; % cm, struct lengths
  rT_Bm = kT_M/ 3/ (1 + f_tL/ g_m);                             % 1/d, von Bert growth rate
  ELw_m = (L_im - (L_im - L_bm) * exp( - rT_Bm * tL_m(:,1)))/ del_M; % cm, total length 
  
  
  % pack to output
  prdData.tL_f = ELw_f;
  prdData.tL_m = ELw_m;
  