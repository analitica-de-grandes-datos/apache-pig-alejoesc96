/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta en SQL.

   SELECT
       color
   FROM 
       u 
   WHERE 
       color 
   LIKE 'b%';

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
color_table = FOREACH data GENERATE Color;
variable = FILTER color_table BY Color MATCHES 'b.*';
STORE variable INTO 'output' USING PigStorage(',');
