--TALLER 3 SQL
--DANIELA RUIZ VALENCIA

--1. Cuántos artistas hay
SELECT COUNT(*) FROM artists a

--2. A qué artista pertenece el álbum "Voodo Lounge"
SELECT a.Name 
FROM artists a
JOIN albums a2
	ON a.ArtistId = a2.ArtistId
WHERE a2.Title = "Voodoo Lounge"

--3. Cuáles son los álbumes que tiene el artista Ozzy Osbourne
SELECT a2.Title
FROM artists a
JOIN albums a2
	ON a.ArtistId = a2.ArtistId
WHERE a.Name = "Ozzy Osbourne"

--4. Cuántas canciones tiene el artista RHCP
SELECT COUNT(t.Name)
FROM artists a
JOIN albums a2
	ON a.ArtistId = a2.ArtistId
JOIN tracks t
	ON a2.AlbumId = t.AlbumId
WHERE a.Name = "Red Hot Chili Peppers"

--5. Cuáles son los 3 tracks más largos (Tiempo)
SELECT t.Name
FROM tracks t
ORDER BY Milliseconds DESC
LIMIT 3

--6. Cuál es el género de la canción que menos peso tiene (Bytes)
SELECT g.Name
FROM tracks t
JOIN genres g
	ON t.GenreId = g.GenreId
ORDER BY t.Bytes ASC
LIMIT 1

--7. Cuál es el género con más canciones
SELECT g.Name
FROM genres g
JOIN tracks t
	ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY COUNT(t.TrackId) DESC
LIMIT 1

--8. Indicar el top 10 de los artistas con más canciones
SELECT a.Name
FROM artists a
JOIN albums a2
	ON a.ArtistId = a2.ArtistId
JOIN tracks t 
	ON a2.AlbumId = t.AlbumId
GROUP BY a.Name
ORDER BY COUNT(t.TrackId) DESC
LIMIT 10

--9. Cuántos invoices tiene cada empleado. Organizar desde el mayor al menor
SELECT e.FirstName || " " || e.LastName AS "Nombre Empleado", COUNT(i.InvoiceId) AS "Cantidad Invoices"
FROM employees e
LEFT JOIN customers c
	ON e.EmployeeId = c.SupportRepId
LEFT JOIN invoices i
	ON c.CustomerId = i.CustomerId
GROUP BY e.FirstName || " " || e.LastName
ORDER BY COUNT(i.InvoiceId) DESC;

--10. Cuál es la canción que más existe en las playlists
SELECT t.Name
FROM tracks t
JOIN playlist_track pt
	ON t.TrackId = pt.TrackId
JOIN playlists p
	ON p.PlaylistId = pt.PlaylistId
GROUP BY t.Name
ORDER BY COUNT(p.PlaylistId) DESC
LIMIT 1