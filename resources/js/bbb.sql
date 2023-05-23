-- 4. Listar el nombre de los estudiantes que hay sacado prestado el libro del tema: Bases de Datos 

select es.nombre
from estudiante es, prestamo p, detalle d, libro l, tema t
where es.idEstudiante = p.estudiante
and p.idPrestamo = d.idPrestamo
and d.idLibro = l.idLibro
and l.idTema = t.idTema
and t.nombre = 'Bases de Datos';


-- 5. Listar que libros se prestaron en el 2017 pero no en el 2018 
select l.idLibro, l.nombre
from libro l, detalle d, prestamo p
where l.idLibro = d.idLibro
and d.idPrestamo = p.idPrestamo
and p.fechaPrestamo >= 01/01/2017
and p.fechaPrestamo =< 31/12/2017
and p.fechaPrestamo not in (p.fechaPrestamo >= 01/01/2018
                            and p.fechaPrestamo =< 31/12/2018);

-- 6 Cambiar la editorial de los libros del tema de Bases de Datos, a la editorial de McGrawHill 
UPDATE Editorial e, libro l, tema t
SET e.nombre = 'McGrawHill'
WHERE t.nombre = 'Base de datos'
and e.idEditorial = l.idEditorial
and l.idTema = t.idTema;

-- 7. Listar los estudiantes que tienen más de 2 préstamos activos (no ha devuelto) 
select es.nombre, count(*)
from estudiante es, prestamo p
where idEstudiante = p.estudiante
group by es.nombre count(*)>2;

