/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:chararray,bag_col:BAG{A:tuple(B:chararray)},map_info:map[]);
data_read = FOREACH data GENERATE flatten(bag_col) AS bag_word, flatten(map_info) AS word_long;
joined_data = FOREACH data_read GENERATE (bag_word,word_long) AS data_tuple;
group_by = GROUP joined_data BY data_tuple;
counter = FOREACH group_by GENERATE group, COUNT(joined_data);
STORE counter INTO 'output' USING PigStorage(',');
