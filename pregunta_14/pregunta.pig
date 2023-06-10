/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       color 
   FROM 
       u 
   WHERE 
       color NOT LIKE 'b%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
    Id:INT,
    Name:CHARARRAY,
    LastName:CHARARRAY,
    Birth:CHARARRAY,
    Color:CHARARRAY,
    Value:INT
);
color_table = FOREACH data GENERATE Color;
x = FILTER color_table BY NOT Color MATCHES 'b.*';
STORE x INTO 'output' USING PigStorage(',');
