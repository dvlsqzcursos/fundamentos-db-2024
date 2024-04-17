-- Consulta 1: Obtener las publicaciones de la subcategoría de tecnología
SELECT p.*
FROM blog_disenio.publicaciones p
JOIN blog_disenio.categorias c ON p.id_publicaciones = c.publicaciones_idpublicaciones
WHERE c.id_principal = 1; -- Corregir la condición para seleccionar la subcategoría de tecnología

-- Consulta 2: Seleccionar todas las publicaciones de usuarios con ID 8, 10 y 12
SELECT *
FROM blog_disenio.publicaciones
WHERE usuarios_id IN (8, 10, 12);

-- Consulta 3: Unir publicaciones y usuarios mediante INNER JOIN
SELECT p.*, u.nombre AS nombre_usuario
FROM blog_disenio.publicaciones AS p
INNER JOIN blog_disenio.usuarios AS u ON p.usuarios_id = u.id_usuarios;

-- Consulta 4: Unir publicaciones y usuarios mediante LEFT JOIN
SELECT p.*, u.nombre AS nombre_usuario
FROM blog_disenio.publicaciones AS p
LEFT JOIN blog_disenio.usuarios AS u ON p.usuarios_id = u.id_usuarios;

-- Consulta 5: Unir publicaciones y usuarios mediante RIGHT JOIN
SELECT p.*, u.nombre AS nombre_usuario
FROM blog_disenio.publicaciones AS p
RIGHT JOIN blog_disenio.usuarios AS u ON p.usuarios_id = u.id_usuarios;

-- Consulta 6: Unir publicaciones y comentarios mediante INNER JOIN
SELECT p.*, c.comentario
FROM blog_disenio.publicaciones AS p
INNER JOIN blog_disenio.comentarios AS c ON p.id_publicaciones = c.publicaciones_idpublicaciones;

-- Consulta 7: Unir publicaciones y comentarios mediante LEFT JOIN
SELECT p.*, c.comentario
FROM blog_disenio.publicaciones AS p
LEFT JOIN blog_disenio.comentarios AS c ON p.id_publicaciones = c.publicaciones_idpublicaciones;

-- Consulta 8: Unir publicaciones y comentarios mediante RIGHT JOIN
SELECT p.*, c.comentario
FROM blog_disenio.comentarios AS c
RIGHT JOIN blog_disenio.publicaciones AS p ON c.publicaciones_idpublicaciones = p.id_publicaciones;

-- Actualizar el título de la primera publicación
UPDATE blog_disenio.publicaciones
SET titulo_publicacion = 'Nuevas tendencias en inteligencia artificial'
WHERE id_publicaciones = 31;

-- Actualizar el contenido/descripción de la segunda publicación
UPDATE blog_disenio.publicaciones
SET descripcion_contenido = 'Descubre cómo la inteligencia artificial está revolucionando diferentes industrias.'
WHERE id_publicaciones = 32;

-- Actualizar el título de la tercera publicación
UPDATE blog_disenio.publicaciones
SET titulo_publicacion = 'Consejos para ser más productivo en el trabajo remoto'
WHERE id_publicaciones = 33;

-- Actualizar el contenido/descripción de la cuarta publicación
UPDATE blog_disenio.publicaciones
SET descripcion_contenido = 'Aprende estrategias efectivas para aumentar tu productividad mientras trabajas desde casa.'
WHERE id_publicaciones = 34;

-- Actualizar el título de la quinta publicación
UPDATE blog_disenio.publicaciones
SET titulo_publicacion = 'Los secretos detrás de las fotos perfectas'
WHERE id_publicaciones = 35;

