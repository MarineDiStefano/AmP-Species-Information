function [data, auxData, metaData, txtData, weights] = mydata_Symphodus_melops

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Symphodus_melops'; 
metaData.species_en = 'Corkwing wrasse'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 15]; 

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(10.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 8.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
  comment.Lp = '7 to 10 cm';
data.Li  = 28;    units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';

data.GSI = 0.16;  units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'SayeGibs1996';   
  temp.GSI = C2K(10.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
    0  4.63
    1  8.65
    2 12.07
    3 13.80
    4 15.56
    5 17.03
    6 18.10
    7 20.30];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SayeGibs1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
    0  4.59
    1  9.64
    2 13.80
    3 15.96
    4 18.21
    6 21.20];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SayeGibs1996';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g) 
    0  1.1
    1  7.7
    2 22.7
    3 33.6
    4 48.9
    5 69.5
    6 76.5
    7 90.0];
data.tW_f(:,1) = 365 * (.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10.5);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SayeGibs1996';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g)
    0   1.1
    1  11.0
    2  35.7
    3  55.4
    4  79.3
    6 121.8];
data.tW_m(:,1) = 365 * (.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10.5);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SayeGibs1996';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.kap = 5 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
D2 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'length weight: Ww in g = 0.00912*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'It is today heavily exploited for the use in aquaculture to remove salmon louse (Lepeophtheirus salmonis)';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '53PK9'; % Cat of Life
metaData.links.id_ITIS = '614239'; % ITIS
metaData.links.id_EoL = '46571682'; % Ency of Life
metaData.links.id_Wiki = 'Symphodus_melops'; % Wikipedia
metaData.links.id_ADW = 'Symphodus_melops'; % ADW
metaData.links.id_Taxo = '169984'; % Taxonomicon
metaData.links.id_WoRMS = '273571'; % WoRMS
metaData.links.id_fishbase = 'Symphodus-melops'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Symphodus_melops}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SayeGibs1996'; type = 'Article'; bib = [ ... 
'author = {M. D. J. Sayer and R. N. Gibson and R. J. A. Atkinson}, ' ... 
'year = {1996}, ' ...
'title = {Growth, diet and condition of corkwing wrasse and rock cook on the west coast of {S}cotland}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {49}, ' ...
'pages = {76-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Symphodus-melops.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

