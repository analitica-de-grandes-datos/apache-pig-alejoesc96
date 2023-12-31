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
   WHERE 
       color REGEXP '.n';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

data = LOAD 'data.csv' USING PigStorage(',') AS (
    Id:INT,
    Name:CHARARRAY,
    LastName:CHARARRAY,
    Birth:CHARARRAY,
    Color:CHARARRAY,
    Value:INT
);
data_2 = FOREACH data GENERATE Name, Color;
x = FILTER data_2 BY Color MATCHES '.*n';
STORE x INTO 'output' USING PigStorage(',');
