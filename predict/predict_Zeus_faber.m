function [prdData, info] = predict_Zeus_faber(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
        
  % compute temperature correction factors
  TC_ab = tempcorr(temp.ah, T_ref, T_A);
  TC_ap = tempcorr(temp.ap, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_GSI = tempcorr(temp.GSI, T_ref, T_A);
  TC_tL = tempcorr(temp.tL_f, T_ref, T_A);
  
% zero-variate data

  % life cycle
  pars_tp = [g; k; l_T; v_Hb; v_Hp];               % compose parameter vector
  [t_p, t_b, l_p, l_b, info] = get_tp(pars_tp, f); % -, scaled times & lengths at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  aT_b = t_b/ k_M/ TC_ab;           % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  aT_p = t_p/ k_M/ TC_ap;           % d, age at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length at f
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  Ww_i = L_i^3 * (1 + f * w);       % g, ultimate wet weight 
 
  % reproduction
  GSI = TC_GSI * 365 * k_M * g/ f^3/ (f + kap * g * y_V_E);
  GSI = GSI * ((1 - kap) * f^3 - k_M^2 * g^2 * k_J * U_Hp/ v^2);% mol E_R/ mol W

  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % males
  p_Am_m = z_m * p_M/ kap;         % J/d.cm^2, {p_Am} max spec assimilation flux for male
  E_m_m = p_Am_m/ v;               % J/cm^3, [E_m] reserve capacity for male
  m_Em_m = y_E_V * E_m_m/ E_G;     % mol/mol, reserve capacity for male
  g_m = E_G/ kap/ E_m_m;           % -, energy investment ratio for male
  w_m = m_Em_m * w_E/ w_V;         % -, contribution of reserve to weight for male
  L_mm = kap * p_Am_m/ p_M;       % cm, maximum structural length for male
   
  % pack to output
  prdData.ah = aT_b;
  prdData.ap = aT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.Wwi = Ww_i;
  prdData.GSI = GSI;
  
  % uni-variate data
  
  % time-length 
  % females
  f = f_tL; pars_lb = [g; k; v_Hb];                           % compose parameters
  ir_B = 3/ k_M + 3 * f * L_m/ v; rT_B = TC_tL/ ir_B;         % d, 1/von Bert growth rate
  Lw_i = (f * L_m - L_T)/ del_M;                              % cm, ultimate physical length at f
  Lw_b = get_lb(pars_lb, f) * L_m/ del_M;                     % cm, physical length at birth at f
  ELw_f = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_f(:,1));    % cm, expected physical length at time
  % males
  pars_lb = [g_m; k; v_Hb];                                   % compose parameters
  ir_B = 3/ k_M + 3 * f * L_mm/ v; rT_B = TC_tL/ ir_B;        % d, 1/von Bert growth rate
  Lw_im = (f * L_mm - L_T)/ del_M;                            % cm, ultimate physical length at f
  Lw_bm = get_lb(pars_lb, f) * L_mm/ del_M;                   % cm, physical length at birth at f
  ELw_m = Lw_im - (Lw_im - Lw_bm) * exp( - rT_B * tL_m(:,1)); % cm, expected physical length at time

  % length-weight
  EWw_f = (LW_f(:,1) * del_M).^3 * (1 + f * w);               % g, expected wet weight at time
  EWw_m = (LW_m(:,1) * del_M).^3 * (1 + f * w_m);             % g, expected wet weight at time

  % pack to output
  prdData.tL_m = ELw_m;
  prdData.tL_f = ELw_f;
  prdData.LW_m = EWw_m;
  prdData.LW_f = EWw_f;