/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letter:chararray,bag_col:BAG{A:tuple(B:chararray)},map_info:chararray);
data_read = FOREACH data GENERATE flatten(bag_col) AS letter;
group_by = GROUP data_read by letter;
counter = FOREACH group_by GENERATE group, COUNT(data_read);
STORE counter INTO 'output' USING PigStorage(',');
