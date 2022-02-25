-- move children, update higher classificaiton keys finally delete
-- Anteros, 3 usages & descendants
UPDATE name_usage SET parent_fk=1936931 WHERE parent_fk=3262115;
UPDATE name_usage SET genus_fk=1936931 WHERE genus_fk=3262115;
DELETE FROM name_usage WHERE id =3262115;
-- Coccinella, 5+1 children, 15 descendants
UPDATE name_usage SET parent_fk=1043502 WHERE parent_fk=3248267;
UPDATE name_usage SET parent_fk=1043502 WHERE parent_fk=10088571;
UPDATE name_usage SET genus_fk=1043502 WHERE genus_fk=3248267;
DELETE FROM name_usage WHERE id =3248267;
DELETE FROM name_usage WHERE id =10088571;
-- Melanis, 8 childs, 10 descendants
UPDATE name_usage SET parent_fk=10381192 WHERE parent_fk=1935496;
UPDATE name_usage SET genus_fk=10381192 WHERE genus_fk=1935496;
DELETE FROM name_usage WHERE id =1935496;
-- Psorergates
UPDATE name_usage SET parent_fk=10443252 WHERE parent_fk=2131790;
UPDATE name_usage SET genus_fk=10443252 WHERE genus_fk=2131790;
DELETE FROM name_usage WHERE id =2131790;


-- deletions
DELETE FROM name_usage WHERE id IN (1935356,10599543,3257434,10497774,7984170,1312205,10605568,10205239,10585692,1529743,10171030,10580489,10335211,2224416,10069149,1934186,7858643,10661496,9945890,10632189,3235277,10638770,10483728,10185787,10215450,10632044,10552471,8186599,2222107,10243495,10561771,10179475,10560433,7450625,10043971,4576152,8388182,10184768,10242183,10646015,1095613,10422906);

-- status change
UPDATE name_usage SET status='DOUBTFUL'::taxonomic_status WHERE id IN (9526206,8181235,9718687);
UPDATE name_usage SET status='ACCEPTED'::taxonomic_status WHERE id IN (10443252,10381192,2524960,1936931,10085961,1936473,2481704,10276071,10028909,1043502,1935015,10527924,8446621,8035393,5229166,3152362,10271997,10650925,1692864);

-- Linnæus -> Linnaeus
UPDATE name SET authorship = 'Linnaeus' WHERE authorship = 'Linnæus';
UPDATE name SET bracket_authorship = 'Linnaeus' WHERE bracket_authorship = 'Linnæus';
