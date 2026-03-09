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

-- 3. Busque la entrevista que se le hizo a la segunda testigo. Se descubrio que la testigo 
-- reconocio al asesino el dia 9 de enero cuando entrenaba en el gimnasio.
Select * from interview
	Join person
		On interview.person_id = person.id
Where id = "16371";

-- 4. Busque las personas que entrenaron en el gimnasio el dia 9 de enero. suponemos que es del 
-- 2018. Descubrimos que 10 personas entraron ese dia al gimnasio.
Select * from get_fit_now_check_in
where check_in_date LIKE ("%20180109%");

-- 5. Ahora buscare por el lado del segundo testigo, para obtener mas información, sabemos que vive
-- en la última casa de Northwestern Dr. Descubrimos que se llama Morty Schapiro, y tiene el id
-- 14887
Select * from person
WHERE address_street_name LIKE ("%Northwestern%")
ORDER BY address_number DESC
LIMIT 5;

-- 6. Busque la entrevista que le hicieron al primer testigo. Se descubrio que su numero de 
-- membresia gold del gimnasio empieza por "48z". Ademas, se subió a un coche con 
-- matrícula "H42W". 
Select * from interview
	Join person
		On interview.person_id = person.id
Where id = "14887";

