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

-- Cargar los datos del archivo data.tsv
data = LOAD 'data.tsv' AS (col1:chararray, col2:bag{}, col3:map[]);

-- Obtener la cantidad de elementos en la columna 2
cols_count = FOREACH data GENERATE col1, SIZE(col2) AS col2_count, SIZE(col3) AS col3_count;


-- Ordenar la tabla por las columnas 1, 2 y 3
sorted_result = ORDER cols_count BY col1, col2_count, col3_count;

-- Guardar el resultado en la carpeta output
STORE sorted_result INTO 'output' USING PigStorage(',');
