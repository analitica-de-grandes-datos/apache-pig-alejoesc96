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
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        /* >>> Escriba su respuesta a partir de este punto <<< */
data = LOAD 'data.csv' USING PigStorage(',') AS (
    Id:int,
    Name:chararray,
    LastName:chararray,
    Birth:chararray,
    Color:chararray,
    Value:int
);
data_2 = FOREACH data GENERATE Name, Color;
variable = FILTER data_2 BY (Color == 'blue') OR (Name MATCHES 'K.*');
STORE variable INTO 'output' USING PigStorage(',');

