-- 1. Busqué el reporte del crimen en la fecha y ciudad indicadas. Descubrí que hay dos testigos.
--El primer testigo es de nombre desconocido pero vive en la última casa de Northwestern Dr.
--La segunda testigo se llama Annabel, que vive en algún lugar de Franklin Ave.
Select * From crime_scene_report
WHERE date = "20180115" AND city = "SQL City";

-- 2. Empeze a buscar el por el lado de la segunda testigo ya que conocemos su nombre y por donde
-- vive. Buscabamos encontrar su Id para poder inspeccionar la entrevista. Descubrimos que su  
-- nombre completo es Annabel Miller, id es 16371.
Select * from person
WHERE name LIKE ("%Annabel%");

