function [data, auxData, metaData, txtData, weights] = mydata_Sarpa_salpa

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Sarpa_salpa'; 
metaData.species_en = 'Dreamfish'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 01 28];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 28]; 

%% set data
% zero-variate data

data.am = 6*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'WaltBeck1997';   
  temp.am = C2K(18.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16.5;   units.Lp  = 'cm';  label.Lp  = 'total length st puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 51;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*.08^3';
data.Wwp = 61.5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.03, see F1';
data.Wwi = 1.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.03, see F1';

data.Ri  = 5e5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), fork length (cm)
0.014	6.920
0.014	4.078
0.014	4.281
0.014	4.585
0.014	4.839
0.014	5.093
0.014	5.397
0.014	5.499
0.014	5.702
0.014	5.753
0.014	5.956
0.014	6.108
0.014	6.260
0.014	6.565
0.957	12.825
0.970	12.673
0.970	13.282
0.970	13.384
0.984	10.237
0.984	13.587
0.984	13.638
0.984	13.891
0.984	14.501
0.984	15.414
0.998	11.760
0.998	12.369
0.998	16.887
1.011	11.405
1.011	11.912
1.011	12.014
1.025	9.121
1.025	11.202
1.995	13.604
1.995	16.294
1.995	16.447
1.995	16.700
1.995	17.056
1.995	17.157
1.995	17.157
1.995	18.528
1.995	19.188
1.995	19.442
1.995	19.594
1.995	20.051
1.995	20.507
2.009	14.264
2.009	14.873
2.009	15.939
2.009	17.868
2.009	17.919
2.009	18.325
2.009	18.579
2.009	18.985
2.023	15.280
2.023	15.584
2.938	24.534
2.966	23.468
2.993	15.956
2.993	16.159
2.993	16.514
2.993	20.829
2.993	21.692
2.993	22.098
2.993	22.656
3.007	17.733
3.007	17.885
3.007	18.494
3.007	19.103
3.007	19.256
3.007	19.408
3.007	19.611
3.007	19.814
3.007	20.677
3.007	21.185
3.007	21.286
3.021	16.768
3.021	17.530
3.021	18.241
3.021	18.900
3.021	20.170
3.964	18.104
3.964	23.383
3.977	18.358
3.977	18.815
3.977	19.678
3.977	20.389
3.977	20.592
3.977	20.846
3.977	21.404
3.977	21.607
3.977	21.658
3.977	22.724
3.977	24.602
3.991	19.171
3.991	19.526
3.991	20.135
3.991	21.049
3.991	22.166
3.991	22.470
4.005	24.146
4.005	25.465
4.961	23.248
4.961	23.603
4.975	19.390
4.989	21.624
4.989	21.726
4.989	21.827
4.989	21.929
4.989	22.030
4.989	22.030
4.989	22.436
4.989	22.842
5.002	21.523
5.002	21.726
5.002	24.467
5.016	20.102
5.016	20.559
5.016	20.914
5.016	21.168
5.016	21.269
5.016	24.772
5.016	25.127
6.014	21.134
6.014	24.586
6.014	25.804
6.014	27.682
6.027	20.119]; 
data.tL(:,1) = (0.5 + data.tL(:,1)) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2) * 1.09; % convert fork length to total length from photo
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WaltBeck1997';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01259*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase';
F2 = 'protogynous sequential hermaphrodite. Sex change occurs at 25.0 cm TL and 3.75 years of age';
metaData.bibkey.F2 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '79PJZ'; % Cat of Life
metaData.links.id_ITIS = '182942'; % ITIS
metaData.links.id_EoL = '46579976'; % Ency of Life
metaData.links.id_Wiki = 'Sarpa_salpa'; % Wikipedia
metaData.links.id_ADW = 'Sarpa_salpa'; % ADW
metaData.links.id_Taxo = '186591'; % Taxonomicon
metaData.links.id_WoRMS = '127064'; % WoRMS
metaData.links.id_fishbase = 'Sarpa-salpa'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sarpa_salpa}}';
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
bibkey = 'WaltBeck1997'; type = 'article'; bib = [ ...  
'author = {B. A. van der Walt and L. E. Beckley}, ' ...
'year = {1997}, ' ...
'title  = {Age and growth of \emph{Sarpa salpa} ({P}isces: {S}paridae) off the east coast of {S}outh {A}frica}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {31}, ' ...
'pages = {241-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Sarpa-salpa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

