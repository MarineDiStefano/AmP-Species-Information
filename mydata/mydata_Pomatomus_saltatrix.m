function [data, auxData, metaData, txtData, weights] = mydata_Pomatomus_saltatrix
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Pomatomidae';
metaData.species    = 'Pomatomus_saltatrix'; 
metaData.species_en = 'Bluefish'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MA', 'MI', 'MPS'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 05];

%% set data
% zero-variate data

data.ab = 1.96;   units.ab = 'd';   label.ab = 'life span';                 bibkey.ab = 'fishbase';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 12*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'RobiReis2009';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 0.92*30;   units.Lp  = 'cm';  label.Lp  = 'fork length at puberty';     bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on total length of 30 cm';
data.Li  = 0.92*130;     units.Li  = 'cm';  label.Li  = 'ultimate fork length of female';  bibkey.Li  = 'fishbase';
  comment.Li = 'based on total length of 130 cm';

data.Wwb = 5.2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 14.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';

data.Ri  = 1.24e6/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate at 54 cm'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since birth (yr), fork length (cm)
0.968	28.959
0.986	25.566
1.004	23.529
1.007	28.959
1.011	33.846
1.011	35.204
1.030	33.439
1.045	26.516
1.052	37.240
1.063	24.072
1.064	25.158
1.065	27.466
1.067	29.774
1.068	31.674
1.091	36.833
1.107	30.452
1.123	25.158
1.143	26.244
1.144	27.195
1.144	28.009
1.145	28.552
1.147	32.624
1.149	34.932
1.154	42.941
1.165	29.774
1.171	38.190
1.205	30.181
1.224	30.588
1.225	31.538
1.228	35.882
1.246	33.032
1.246	33.846
1.248	36.968
1.262	28.552
1.305	33.846
1.308	38.733
1.333	46.335
1.344	32.489
1.350	43.077
1.351	43.756
1.352	45.792
1.368	40.633
1.376	51.765
1.387	39.548
1.407	39.955
1.408	41.312
1.425	37.511
1.430	44.163
1.463	34.796
1.463	35.204
1.464	36.561
1.468	42.670
1.480	31.131
1.482	33.846
1.499	30.317
1.538	29.638
1.540	32.081
1.543	37.376
1.544	38.733
1.640	35.475
1.696	31.131
1.697	31.946
1.719	36.561
1.737	33.982
1.738	35.204
1.776	32.489
1.776	33.167
1.800	39.276
1.817	36.561
1.820	40.362
1.834	31.131
1.836	35.475
1.841	42.398
1.855	33.439
1.857	37.647
1.859	39.276
1.860	41.448
1.861	43.348
1.863	45.928
1.921	44.027
1.934	34.389
1.935	35.475
1.936	37.783
1.936	38.190
1.938	39.955
1.953	33.032
1.959	43.077
1.970	30.045
1.972	32.217
1.975	36.561
1.981	46.606
1.997	41.176
1.998	42.127
2.002	48.643
2.007	56.652
2.014	36.018
2.019	44.706
2.029	58.959
2.030	31.674
2.059	46.199
2.067	57.059
2.075	40.633
2.093	36.968
2.093	38.054
2.094	38.869
2.094	39.412
2.101	49.050
2.104	54.480
2.104	55.023
2.107	28.688
2.115	41.448
2.116	42.534
2.117	43.620
2.118	45.520
2.119	47.149
2.120	48.371
2.121	50.679
2.122	52.308
2.130	33.982
2.145	56.787
2.148	61.403
2.159	48.235
2.176	43.620
2.177	45.928
2.196	44.434
2.198	47.285
2.199	49.321
2.233	41.584
2.234	42.262
2.252	40.769
2.258	49.050
2.259	51.222
2.259	51.765
2.276	47.014
2.281	55.430
2.298	50.407
2.336	48.100
2.338	51.629
2.339	53.122
2.339	53.529
2.340	54.480
2.340	54.615
2.340	55.158
2.341	56.516
2.347	35.339
2.359	54.344
2.376	50.543
2.378	53.122
2.381	57.602
2.399	55.566
2.446	36.561
2.493	48.235
2.496	52.715
2.511	45.520
2.514	50.814
2.533	49.457
2.689	47.964
2.708	46.335
2.711	51.493
2.728	47.964
2.757	32.353
2.771	52.715
2.772	55.158
2.773	55.973
2.779	35.475
2.781	39.276
2.807	47.557
2.809	50.814
2.814	59.095
2.820	38.733
2.826	47.421
2.848	51.222
2.852	57.466
2.860	39.548
2.861	40.362
2.883	43.891
2.895	62.489
2.896	33.982
2.904	46.742
2.923	45.249
2.940	41.448
2.947	52.443
2.956	66.561
3.022	46.742
3.028	55.294
3.031	60.181
3.055	66.561
3.056	68.597
3.071	61.810
3.074	65.611
3.080	45.249
3.082	49.050
3.088	56.923
3.089	59.502
3.101	48.100
3.107	56.109
3.108	58.281
3.109	59.502
3.112	63.982
3.115	68.597
3.117	41.991
3.119	44.570
3.123	50.679
3.124	51.765
3.124	52.715
3.125	53.937
3.126	55.023
3.126	56.109
3.133	65.747
3.133	66.561
3.144	53.394
3.149	61.267
3.150	62.489
3.191	64.932
3.199	46.606
3.205	56.652
3.210	63.439
3.213	68.597
3.226	58.009
3.227	60.045
3.246	58.281
3.247	60.995
3.263	55.294
3.287	61.538
3.288	63.167
3.289	64.118
3.604	66.018
3.626	69.140
3.677	57.059
3.678	59.231
3.680	61.267
3.699	60.181
3.732	51.086
3.736	57.330
3.753	53.937
3.754	54.615
3.755	56.516
3.762	67.647
3.776	58.552
3.777	60.452
3.778	62.081
3.780	65.339
3.799	63.303
3.833	55.158
3.834	56.516
3.836	59.638
3.837	61.267
3.839	64.389
3.841	67.376
3.857	62.760
3.861	68.597
3.875	60.452
3.894	58.145
3.896	61.267
3.914	59.774
3.917	63.846
3.936	62.760
3.957	64.796
3.977	65.339
3.992	58.959
4.021	73.484
4.022	74.434
4.039	69.683
4.052	60.860
4.068	53.937
4.074	63.982
4.076	67.240
4.079	70.769
4.079	71.041
4.083	77.014
4.091	60.452
4.092	61.946
4.095	66.425
4.100	72.805
4.114	64.932
4.116	68.733
4.148	57.195
4.149	58.824
4.150	59.638
4.152	62.624
4.152	63.710
4.156	68.326
4.174	66.018
4.177	71.312
4.177	71.855
4.188	57.738
4.188	58.281
4.190	60.860
4.196	69.683
4.228	58.824
4.233	66.968
4.251	64.661
4.274	69.005
4.311	65.475
4.312	67.919
4.330	64.932
4.332	67.511
4.409	65.611
4.430	66.968
4.470	69.276
4.472	72.262
4.606	67.240
4.661	59.910
4.683	64.525
4.703	65.339
4.705	67.240
4.706	69.412
4.722	63.032
4.725	67.783
4.743	66.425
4.782	64.796
4.782	66.018
4.784	68.597
4.785	69.683
4.794	54.072
4.801	64.118
4.803	66.833
4.804	68.597
4.806	71.855
4.825	70.498
4.839	62.624
4.840	63.575
4.858	61.674
4.877	60.995
4.880	65.339
4.883	70.226
4.901	67.376
4.907	75.928
4.918	63.167
4.939	64.796
4.941	68.326
4.943	71.312
4.979	66.833
4.996	61.674
5.001	69.683
5.018	65.611
5.019	66.968
5.020	69.412
5.035	62.624
5.035	62.624
5.038	65.882
5.041	71.312
5.042	73.348
5.057	64.796
5.095	63.846
5.098	67.919
5.114	63.167
5.118	69.140
5.141	74.027
5.160	72.941
5.178	70.091
5.193	63.710
5.194	64.253
5.194	64.796
5.198	71.448
5.200	74.299
5.235	68.190
5.254	66.425
5.254	67.104
5.256	69.683
5.314	68.869
5.318	73.756
5.335	70.769
5.411	67.104
5.414	70.226
5.414	71.041
5.415	71.719
5.416	74.027
5.429	64.389
5.495	74.977
5.497	77.692
5.510	67.647
5.614	76.742
5.649	69.412
5.650	71.855
5.651	73.620
5.707	69.005
5.724	64.796
5.729	72.398
5.746	68.054
5.786	69.005
5.787	70.905
5.788	71.855
5.789	73.484
5.803	65.882
5.827	71.312
5.828	73.348
5.843	65.611
5.844	67.647
5.861	64.253
5.866	71.176
5.884	69.412
5.887	73.756
5.888	74.842
5.904	69.548
5.905	70.769
5.909	77.014
5.921	66.018
5.942	68.054
5.943	68.326
5.961	66.561
5.963	70.362
5.964	70.769
5.964	71.855
5.965	72.805
5.984	72.262
5.985	73.213
6.023	70.905
6.025	73.891
6.027	77.014
6.037	63.303
6.039	65.882
6.041	68.326
6.045	75.113
6.045	75.656
6.061	69.140
6.066	77.692
6.079	66.697
6.083	72.670
6.083	73.484
6.084	73.756
6.098	65.882
6.099	67.511
6.100	68.190
6.121	71.176
6.139	68.326
6.140	69.955
6.141	72.127
6.157	66.697
6.176	64.661
6.179	69.276
6.195	63.439
6.201	73.348
6.201	73.756
6.202	74.163
6.254	64.253
6.256	66.697
6.279	72.398
6.317	71.176
6.381	78.371
6.453	68.597
6.454	69.819
6.458	75.656
6.461	80.679
6.476	73.213
6.477	74.299
6.537	76.606
6.561	82.579
6.632	72.262
6.634	74.434
6.671	70.769
6.767	68.190
6.808	69.955
6.810	72.941
6.828	70.769
6.828	71.584
6.829	72.941
6.832	76.742
6.847	69.412
6.849	73.213
6.850	74.570
6.852	78.100
6.889	74.299
6.906	69.819
6.907	71.855
6.907	72.534
6.927	72.805
6.929	75.249
6.946	70.905
6.947	73.348
6.988	75.928
7.002	67.376
7.004	70.633
7.005	71.719
7.007	74.163
7.020	65.068
7.023	69.276
7.040	64.796
7.061	66.833
7.068	77.421
7.069	79.321
7.084	72.262
7.085	72.941
7.105	73.891
7.121	68.869
7.125	75.385
7.142	70.226
7.143	72.941
7.146	76.199
7.162	71.448
7.209	83.258
7.300	72.805
7.303	76.199
7.304	78.914
7.441	77.692
7.444	81.629
7.457	71.991
7.458	73.077
7.459	75.113
7.460	76.199
7.519	77.014
7.544	84.208
7.556	73.484
7.613	69.683
7.773	74.434
7.791	72.941
7.808	68.597
7.809	69.955
7.848	68.869
7.852	75.113
7.873	77.828
7.886	67.104
7.889	71.584
7.889	72.534
7.967	70.769
8.030	76.878
8.044	68.190
8.047	73.348
8.047	73.620
8.050	77.557
8.066	72.670
8.068	75.656
8.072	80.814
8.084	69.412
8.084	70.226
8.107	74.977
8.184	73.213
8.266	77.828
8.425	80.950
8.446	83.258
8.459	73.348
8.460	74.570
8.462	76.742
8.541	78.643
8.542	79.457
8.544	82.172
8.544	82.579
8.774	74.706
8.790	69.140
8.793	73.077
8.814	75.520
8.821	85.973
8.831	71.312
8.833	74.434
8.835	76.742
8.835	76.742
8.852	73.756
8.853	74.027
8.873	75.656
8.910	71.176
8.914	77.285
8.973	78.371
8.974	79.457
9.009	72.670
9.009	73.484
9.010	75.113
9.032	78.371
9.051	76.742
9.070	76.471
9.110	77.557
9.167	74.977
9.404	76.199
9.448	84.344
9.562	77.285
9.839	80.950
9.854	73.891
9.860	83.122
9.861	83.937
9.895	76.471
9.929	68.054
9.933	73.891
9.993	76.742
10.077	84.344
10.093	78.507
10.150	75.656
10.207	73.756
10.526	81.222
10.527	82.579
10.528	83.801
11.010	69.140
11.016	79.457
11.017	80.679
11.273	81.629
11.292	81.357
11.488	80.814
11.490	83.258
11.786	85.973
11.858	74.977
11.865	86.109
11.866	87.330
12.530	82.036
12.843	79.593];
data.tL(:,1) = 365 * (0 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RobiReis2009';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Marine; brackish; pelagic-oceanic; oceanodromous; depth range 0 - 200 m';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.01360*(TL in cm)^2.899';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4LQWC'; % Cat of Life
metaData.links.id_ITIS = '168559'; % ITIS
metaData.links.id_EoL = '46578890'; % Ency of Life
metaData.links.id_Wiki = 'Pomatomus_saltatrix'; % Wikipedia
metaData.links.id_ADW = 'Pomatomus_saltatrix'; % ADW
metaData.links.id_Taxo = '45220'; % Taxonomicon
metaData.links.id_WoRMS = '151482'; % WoRMS
metaData.links.id_fishbase = 'Pomatomus-saltatrix'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pomatomus_saltatrix}}';
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
bibkey = 'RobiReis2009'; type = 'Article'; bib = [ ... 
'author = {Eric Robillard and Christian S. Reiss and Cynthia M. Jones}, ' ... 
'year = {2009}, ' ...
'title = {Age-validation and growth of bluefish (\emph{Pomatomus saltatrix}) along the East Coast of the {U}nited {S}tates}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {95}, ' ...
'pages = {65-75}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Pomatomus-saltatrix.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
