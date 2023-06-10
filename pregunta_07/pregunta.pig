/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:chararray,bag_col:BAG{A:tuple(B:chararray)},map_info:map[]);
data_read = FOREACH data GENERATE flatten(map_info);
counter = FOREACH data GENERATE letter, COUNT(bag_col.B) AS bag_b, SIZE(map_info) AS map_read;
order_by = ORDER counter BY letter ASC, bag_b ASC, map_read ASC;
STORE order_by INTO 'output' USING PigStorage(',');
