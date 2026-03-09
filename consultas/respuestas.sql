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

-- 7. Busque en la lista que teniamos de las personas que havian entrado al gimnasio el 9 de enero
-- una membresia que empezara por "48z". Se encontraron dos conicidencias. Una de ellas debe ser 
-- el asesino (48Z7A, 48Z55)
Select * from get_fit_now_check_in
WHERE membership_id LIKE ("%48z%") and check_in_date = "20180109";

-- 8. Busque el numero de matricula del auto. Matrícula "H42W". Descubrimos tres dueños de autos 
-- con los siguientes id de licencia (183779, 423327, 664760)
Select * from drivers_license 
WHERE plate_number LIKE ("%H42W%");

-- 9. Buscare el id del usuario del primer numero de membresia del gimnasio. (48Z7A). Se descubrio 
-- que la persona a la que le pertenece esta membresia es Joe Germuska con id 28819
Select id, person_id, name from get_fit_now_member
	Join get_fit_now_check_in
		ON id = get_fit_now_check_in.membership_id
		
Where id = "48Z7A"

-- 10. Buscare el id del usuario del segundo numero de membresia del gimnasio. (48Z55). Se descubrio 
-- que la persona a la que le pertenece esta membresia es Jeremy Bowers con id 67318
Select id, person_id, name from get_fit_now_member
	Join get_fit_now_check_in
		ON id = get_fit_now_check_in.membership_id
		
Where id = "48Z55"

-- 11. Busque el id de licencia del primer sospechoso Joe Germuska con id 28819. Para verificar
-- Si esta entre estos id de licencias (183779, 423327, 664760). Se descubrio que el id de licencia
-- de Joe Germuska no esta entre las licencias sospechosas.
Select * from person
Where id = "28819" and license_id IN ("183779", "423327", "664760");

-- 12. Busque el id de licencia del segundo sospechoso Jeremy Bowers con id 67318.Para verificar
-- Si esta entre estos id de licencias (183779, 423327, 664760). Se descubrio que el id de licencia
-- de Jeremy Bowers esta entre las licencias sospechosas.
Select * from person
Where id = "67318" and license_id IN ("183779", "423327", "664760");


-- 13. Podemos concluir que el es el asesino.
INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        SELECT value FROM solution;