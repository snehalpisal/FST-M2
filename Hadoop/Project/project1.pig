inputFile = LOAD 'hdfs:///user/snehal/pigactivity' USING PigStorage('\t') AS (name:chararray, dialogues:chararray);
grpd = GROUP inputFile BY name;
cntd = FOREACH grpd GENERATE $0 AS nameSpoken, COUNT($1) AS dialoguesSpoken;
ordby = ORDER cntd BY dialoguesSpoken DESC;
rmf hdfs:///user/snehal/pigactivity/results
STORE ordby INTO 'hdfs:///user/snehal/pigactivity/results';
