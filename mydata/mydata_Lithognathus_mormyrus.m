function [data, auxData, metaData, txtData, weights] = mydata_Lithognathus_mormyrus 

%% set metadata
T_C = 273.15; % K, temperature at 0 degrees C (used in T_typical)

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Lithognathus_mormyrus'; 
metaData.species_en = 'Sand steenbras'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = T_C + 23; % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L', 'L-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Samira Boufersaoui'};            
metaData.date_subm   = [2018 06 06];                      
metaData.email       = {'samira.boufersaoui@gmail.com'}; 
metaData.address     = {'ENSSMAL, 16000, Algeria'};      

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 06 08]; 

%% set data
% zero-variate data;

data.ab = 1.667;      units.ab = 'd';      label.ab = 'age at birth';            bibkey.ab = 'DivaKent1983';    
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';       
data.ap = 623.2;      units.ap = 'd';      label.ap = 'age at puberty';          bibkey.ap = 'Bouf2016';
  temp.ap = C2K(23);  units.temp.ap = 'K'; label.temp.ap = 'temperature';  
data.am = 2555;       units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Bouf2016';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature';  

data.Lb  = 0.174;   units.Lb  = 'cm';   label.Lb  = ' total length at birth';   bibkey.Lb  = 'DivaKent1983';
data.Lp  = 15.48;   units.Lp  = 'cm';   label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Bouf2016';
data.Li  = 34.89;   units.Li  = 'cm';   label.Li  = 'ultimate total lenght';    bibkey.Li  = 'Bouf2016';

data.Wwb = 0.00010; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Bouf2016';
data.Wwp = 45.39;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Bouf2016';
data.Wwi = 564.86;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Bouf2016';

data.Ri  = 1137.53; units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Bouf2016';   
temp.Ri = C2K(19);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data

data.tL = [1460 1460 1825 1095 1460 1095 1460 1095 730 730 1095 1460 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 1095 730 1095 1095 1825 1460 1460 1460 1095 730 1095 1095 730 1095 730 1095 1095 1825 1825 1460 1095 1460 1095 1460 1095 1095 1460 730 1460 1095 1460 1095 730 1460 1095 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 365 1095 1095 1095 1095 1460 730 1095 1095 1460 1460 1825 1460 1095 1460 1460 1095 1095 1460 1460 1460 1095 1095 1460 1825 1095 1460 1460 1460 1095 1095 1095 1095 1095 1095 730 1460 1095 730 730 1460 730 1095 1460 1095 1095 1095 1460 1095 730 1095 1095 730 1825 1460 1095 1095 730 1460 730 1095 730 730 730 730 365 730 365 365 365 365 365 1095 365 365 365 730 730 365 365 365 365 1460 1460 1095 1095 1095 1825 2190 365 365 365 730 365 365 365 365 365 365 365 365 365 730 365 365 730 365 365 730 365 365 365 365 365 730 365 365 365 365 365 365 365 365 365 365 365 365 730 365 365 365 730 365 730 365 365 365 365 365 365 365 1095 1460 730 730 730 730 730 730 730 365 730 730 365 730 730 730 1095 365 365 1460 1095 730 365 730 730 365 365 1460 730 1095 730 730 1460 730 730 730 730 1095 730 730 730 730 365 1095 365 365 730 730 365 365 730 365 365 730 365 730 730 365 365 730 730 365 730 365 365 365 730 365 365 365 1460 1095 1095 365 730 365 365 365 730 365 730 730 365 1095 365 365 1460 1095 1095 1460 1460 1825 1095 1095 730 730 1460 730 730 365 365 1095 1095 1095 1095 1095 730 730 730 730 1460 1460 1095 730 730 730 730 1095 730 365 1095 730 365 730 1095 730 1095 730 365 730 365 1095 1095 2555 1095 730 1095 730 365 730 730 730 730 730 730 365 1095 730 1095 730 1095 1095 730 730 730 1460 730 1095 1825 1825 1095 1095 1460 730 730 1460 1095 1095 730 1095 730 1825 1460 1825 1095 1095 1825 1095 1460 1460 730 730 1095 1460 1460 1460 730 1095 1095 730 1460 1095 1825 730 1460 1095 1095 1095 730 1095 1460 1095 1095 1825 2190 1460 1095 1460 1460 1095 1095 1095 1095 730 730 1460 730 1095 1460 1460 1095 1095 1095 1095 1095 730 1095 1460 1460 1825 1095 1825 1460 730 1095 ; % d, time since birth
            28.6 31.1 29.7 28.9 25.7 24.0 26.5 25.7 21.8 21.2 20.7 20.0 21.2 20.9 20.2 21.0 20.2 19.2 22.9 20.1 20.1 19.3 21.0 24.2 23.7 22.8 23.3 25.1 20.1 20.7 21.4 20.8 19.1 19.2 18.9 18.0 17.7 19.7 20.0 32.6 30.7 24.1 23.5 27.0 23.2 28.8 26.2 24.8 23.0 22.5 25.7 23.5 22.0 21.7 22.4 22.5 22.6 13.2 14.5 13.8 13.7 12.8 13.6 14.5 13.5 13.7 14.8 13.5 14.3 15.2 14.2 14.6 14.1 13.0 27.0 26.7 25.6 25.8 23.3 22.0 23.2 31.3 29.3 29.2 29.2 30 27.1 26.9 28.1 26.2 27.0 27.4 28.2 26.1 29.8 25.9 28.3 23.1 23.9 23.0 27.9 26.2 25.9 23.0 22.3 22.2 24.3 27.1 22.8 24.1 23.1 24.6 22.7 23.0 22.0 21.6 22.1 23.1 23.2 23.5 21.4 22.6 24.0 24.3 26.6 25.0 27.4 26.0 25.0 22.9 22.1 26.1 27.0 25.5 26.2 23.4 22.0 15.6 16.3 16.0 14.7 15.6 14.5 15.1 14.4 29.4 16.5 14.5 15.0 15.5 16.7 14.3 14.2 13.7 14.5 31.5 29.1 29.7 29.7 29.3 31.0 34.5 18.9 15.2 15.2 16.6 11.8 16.3 15.7 11.9 16.6 16.2 15.7 14.1 15.8 15.6 12.2 14.7 14.0 13.5 14.6 13.0 15.6 15.6 15.2 15.6 14.9 13.9 14.0 12.5 14.6 13.1 13.9 14.7 14.8 11.5 15.0 13.7 13.3 13.9 13.7 13.1 13.1 13.1 14.4 14.9 13.1 13.7 14.2 13.9 14.2 13.1 13.2 12.1 30.2 27.6 25.5 24.4 23.7 23.0 24.1 24.4 24.2 14.2 14.5 16.9 13.1 25.0 23.0 24.1 22.7 15.0 15.2 30.4 25.4 22.7 17.7 17.8 18 17.2 16.7 23.7 22.2 15.3 15.9 27.2 25.9 25.6 27.5 24.6 24.2 27.8 25.3 25.5 24.7 23.5 19.7 21.5 18.9 18.5 17.0 18.5 17.9 20.3 16.5 16.9 18.7 18.7 17.7 17.9 15.5 19.8 18.4 19.4 17.5 18.4 19.1 18.5 18.0 18.0 18.7 18.2 17.8 19.0 30 29.4 23.5 17.5 18.7 18.3 17.8 17.5 17.5 17.8 17.0 17.8 15.7 17.2 16.3 17.2 33.5 31.5 29.9 27.7 33.8 33.3 32.9 24.2 24.3 23.7 24.7 24.0 18.9 18.0 17.7 19.2 18.5 28.7 25.4 25.7 24.7 25.3 20.2 19.7 29.2 31.4 27.8 26.4 24.0 23.1 19 25.2 19.6 18.9 19.2 20.3 19.7 19.9 19.2 18.8 18.1 19.7 17.5 19.9 20.4 18.4 27.5 29.8 27.9 27.7 29.0 24.6 26.0 21.8 22.1 21.4 21.5 20.0 23.0 19.8 19.9 18.0 26.5 25.5 23.5 23.4 24.3 18.7 18.4 28.7 21.8 20.2 27.4 23.4 25.8 25.7 21.5 22.8 21.7 21.4 21.9 20.4 20.5 22.5 22.5 33.7 28.0 31.2 20.8 27.1 32.9 20.4 27.5 31.0 21.2 19.5 18.7 27 25.7 27 20.1 18.7 19.8 16.9 29.2 19.4 30 20.1 32.0 21.1 18.9 27.5 19.2 18.1 25 25.4 26.6 28.0 31.2 25.8 27.5 23.1 30.0 29.5 26.3 28 26.5 18.1 17.9 21.5 17.3 17.7 29.5 29.2 22.8 21.9 22.2 20.2 23.0 21.5 22.6 29.0 27.8 21.7 21.5 32.5 30.0 24.2 20.3]';   % cm, total length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total length'};  bibkey.tL = 'Bouf2016';
  temp.tL = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
data.LW = [28.6 31.1 29.7 28.9 25.7 24.0 26.5 25.7 21.8 21.2 20.7 20.0 21.2 20.9 20.2 21.0 20.2 19.2 22.9 20.1 20.1 19.3 21.0 24.2 23.7 22.8 23.3 25.1 20.1 20.7 21.4 20.8 19.1 19.2 18.9 18.0 17.7 19.7 20.0 32.6 30.7 24.1 23.5 27.0 23.2 28.8 26.2 24.8 23.0 22.5 25.7 23.5 22.0 21.7 22.4 22.5 22.6 13.2 14.5 13.8 13.7 12.8 13.6 14.5 13.5 13.7 14.8 13.5 14.3 15.2 14.2 14.6 14.1 13.0 27.0 26.7 25.6 25.8 23.3 22.0 23.2 31.3 29.3 29.2 29.2 30 27.1 26.9 28.1 26.2 27.0 27.4 28.2 26.1 29.8 25.9 28.3 23.1 23.9 23.0 27.9 26.2 25.9 23.0 22.3 22.2 24.3 27.1 22.8 24.1 23.1 24.6 22.7 23.0 22.0 21.6 22.1 23.1 23.2 23.5 21.4 22.6 24.0 24.3 26.6 25.0 27.4 26.0 25.0 22.9 22.1 26.1 27.0 25.5 26.2 23.4 22.0 15.6 16.3 16.0 14.7 15.6 14.5 15.1 14.4 29.4 16.5 14.5 15.0 15.5 16.7 14.3 14.2 13.7 14.5 31.5 29.1 29.7 29.7 29.3 31.0 34.5 18.9 15.2 15.2 16.6 11.8 16.3 15.7 11.9 16.6 16.2 15.7 14.1 15.8 15.6 12.2 14.7 14.0 13.5 14.6 13.0 15.6 15.6 15.2 15.6 14.9 13.9 14.0 12.5 14.6 13.1 13.9 14.7 14.8 11.5 15.0 13.7 13.3 13.9 13.7 13.1 13.1 13.1 14.4 14.9 13.1 13.7 14.2 13.9 14.2 13.1 13.2 12.1 30.2 27.6 25.5 24.4 23.7 23.0 24.1 24.4 24.2 14.2 14.5 16.9 13.1 25.0 23.0 24.1 22.7 15.0 15.2 30.4 25.4 22.7 17.7 17.8 18 17.2 16.7 23.7 22.2 15.3 15.9 27.2 25.9 25.6 27.5 24.6 24.2 27.8 25.3 25.5 24.7 23.5 19.7 21.5 18.9 18.5 17.0 18.5 17.9 20.3 16.5 16.9 18.7 18.7 17.7 17.9 15.5 19.8 18.4 19.4 17.5 18.4 19.1 18.5 18.0 18.0 18.7 18.2 17.8 19.0 30 29.4 23.5 17.5 18.7 18.3 17.8 17.5 17.5 17.8 17.0 17.8 15.7 17.2 16.3 17.2 33.5 31.5 29.9 27.7 33.8 33.3 32.9 24.2 24.3 23.7 24.7 24.0 18.9 18.0 17.7 19.2 18.5 28.7 25.4 25.7 24.7 25.3 20.2 19.7 29.2 31.4 27.8 26.4 24.0 23.1 19 25.2 19.6 18.9 19.2 20.3 19.7 19.9 19.2 18.8 18.1 19.7 17.5 19.9 20.4 18.4 27.5 29.8 27.9 27.7 29.0 24.6 26.0 21.8 22.1 21.4 21.5 20.0 23.0 19.8 19.9 18.0 26.5 25.5 23.5 23.4 24.3 18.7 18.4 28.7 21.8 20.2 27.4 23.4 25.8 25.7 21.5 22.8 21.7 21.4 21.9 20.4 20.5 22.5 22.5 33.7 28.0 31.2 20.8 27.1 32.9 20.4 27.5 31.0 21.2 19.5 18.7 27 25.7 27 20.1 18.7 19.8 16.9 29.2 19.4 30 20.1 32.0 21.1 18.9 27.5 19.2 18.1 25 25.4 26.6 28.0 31.2 25.8 27.5 23.1 30.0 29.5 26.3 28 26.5 18.1 17.9 21.5 17.3 17.7 29.5 29.2 22.8 21.9 22.2 20.2 23.0 21.5 22.6 29.0 27.8 21.7 21.5 32.5 30.0 24.2 20.3 ;      % cm, total length at f
         319.94 365.44 326.62 331.13 218.02 181.98 245.8 246.56 133.94 122.52 115.83 92.43 103.59 101.87 98.13 107.04 100.06 100 148.24 98.32 98.77 90.23 115.11 181.57 200 157.74 167.14 203.63 96.15 104.62 123.56 108.24 87.04 78.08 86.74 69.58 81.65 108.04 103.56 433.25 398.84 201.89 180.63 268.43 243.28 295.78 237.28 194.78 152.36 159.82 211.6 180.95 151.37 151.97 143.44 166.87 161.27 31.45 37.63 33.55 36.37 27.8 33.07 39.42 31.29 33.09 46.99 30.04 38.13 45.7 39.59 40.79 38.7 38.94 270.99 254.25 231.25 261.66 184.8 139.33 152.94 476.49 366.83 327.26 340.14 380.29 280 256.19 292.96 250.16 300.1 292.91 241.05 321.79 259.24 252.71 306.34 174.66 176.7 156.74 305.76 254.61 277.66 174.3 154.34 140.05 212.99 294.64 191.58 195.93 175.69 187.33 160.45 171.35 137.3 139.43 135.4 166.65 159.41 196.96 143.66 171.08 180.33 204.68 257.89 218.34 270.4 226.17 200.79 155.91 162.96 239.38 264.77 218.77 236.78 173.3 140.72 48.73 56.26 50.13 41.21 49.57 38.81 43.18 40.18 326.29 58.04 39.65 45.97 47.77 58.77 36.82 40.99 34.13 42.95 411.61 326.91 362.35 350.21 321.11 391.19 540.26 84.33 46.01 45.62 53.95 20.91 54.89 41.57 18.34 54.31 59.73 49.46 35.16 53.63 58.65 23.12 38.23 32.23 28.5 37.57 27.03 42.16 46.01 41.85 45.83 40.39 37.96 38.47 27.31 43.21 28.95 37.93 39.68 50.22 21.67 44.14 26.79 32.51 32.28 33.95 28.61 31.43 29.37 37.77 44.64 32.22 33.53 35.3 34.18 33.54 28.06 30.77 24.27 392.24 258.14 225.9 186.76 184.53 167.28 191.7 190.57 188.7 39.81 47.96 58.64 28.92 215.41 171.14 183.15 170.68 44.97 45.79 369.85 222.26 157.42 78.72 70.42 75.19 66.14 61.21 182.21 149.69 47.49 51.17 234.42 199.55 224.66 250.78 203.33 178.16 243.78 209.48 235.95 182.29 183.36 98.47 131.24 88.9 89.28 54.51 86.6 72.17 108.43 53.96 58.84 84.13 86.71 71.72 70.73 46.2 100.03 79.21 92.13 69.24 85.67 86.85 80.51 71.74 76.36 80.92 76.77 66.84 82.45 324.86 324.27 167.48 69.76 86.6 77.39 69.92 62.98 50.76 68.31 68.15 72.44 47.86 64.6 54.69 66.97 475.46 463.9 459.87 282.02 517.39 416.78 440.3 196.51 173.22 156.1 175.45 186.25 86.72 74.45 69.95 83.62 78.78 304.28 206.78 233.65 177.82 219.06 106.19 103.57 355.84 351.31 290.14 243.78 179.62 169.64 84.3 230.15 87.45 92.58 107.14 99.97 97.27 101.86 88.52 87.45 90.09 108.53 67.56 87.92 118.32 85.4 281.19 326.4 273.52 282.69 290.69 189.99 106.95 142.4 135.43 160.11 122.69 112.18 104.61 92.74 89.54 76.92 233.81 188.46 176.17 169.84 200.04 89.36 83.84 296.4 135.53 128.92 309.44 175.98 235.67 216.91 140.85 154.2 133.44 124.96 133.52 111.8 107.46 160.31 141.8 468.14 306.74 422.94 112.12 256.6 447.45 107.91 249.46 387.87 114.32 90.39 85.75 240.79 222.34 262.84 96.79 78.05 93.71 63.98 337.83 88.85 346.56 100.7 422.02 109.6 77.8 280.09 92.13 77.92 182.06 196.02 240.55 312.42 403.93 220.62 268.2 174.36 321.96 291.51 231.86 275.75 230.27 60.08 66.84 131.82 54.07 64.45 364.23 369.01 175.39 144.51 156.01 114.97 157.93 121.47 143.56 314.59 273.85 158.4 144.45 461.81 349.29 191.01 128.54]';   % g, wet weight at f and T
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  bibkey.LW = 'Bouf2016';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Links
metaData.links.id_CoL = '3VKQK'; % Cat of Life
metaData.links.id_ITIS = '182936'; % ITIS
metaData.links.id_EoL = '46579956'; % Ency of Life
metaData.links.id_Wiki = 'Lithognathus_mormyrus'; % Wikipedia
metaData.links.id_ADW = 'Lithognathus_mormyrus'; % ADW
metaData.links.id_Taxo = '179018'; % Taxonomicon
metaData.links.id_WoRMS = '127055'; % WoRMS
metaData.links.id_fishbase = 'Lithognathus-mormyrus'; % fishbase


%% References 
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithognathus_mormyrus}}';
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
bibkey = 'Bouf2016'; type = 'Phdthesis'; bib = [ ...  
'author = {Boufersaoui, S.}, ' ...
'year = {2016}, ' ...
'title  = {Biologie et \''{e}valuation des stocks de trois Sparid\''{e}s de la r\''{e}gion centre de l''Alg\''{e}rie: \emph{Lithognathus mormyrus} ({L}innaeus, 1758), \emph{Pagrus pagrus} ({L}innaeus, 1758) et \emph{Pagellus acarne} ({R}isso, 1826)}, ' ...
'school = {ENSSMAL Univ., Algiers}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DivaKent1983'; type = 'Article'; bib = [ ... 
'author = {Divanach, P. and Kentouri, M. and Tiselius, P.}, ' ...
'year = {1983}, ' ...
'title = {Donn\''{e}es pr\''{e}liminaires sur la technique de production, la croissance et la survie des larves de marbr\''{e} \emph{Lithognathus mormyrus}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {31}, ' ...
'pages = {245--256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
