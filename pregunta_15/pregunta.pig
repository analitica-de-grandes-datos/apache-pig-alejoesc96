/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data = LOAD 'data.csv' USING PigStorage(',') AS (
    Id:int,
    Name:chararray,
    LastName:chararray,
    Birth:chararray,
    Color:chararray,
    Value:int
);
data_2 = FOREACH data GENERATE Name, Color;
variable = FILTER data_2 BY (Color == 'blue') AND (Name MATCHES 'Z.*');
STORE variable INTO 'output' USING PigStorage(' ');
