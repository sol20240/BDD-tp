#determinar los 15 jugadores que mayor aporte realizaron por multas en forma decreciente 

SELECT
    u.id AS usuario_id,
    u.apellido AS usuario_apellido,
    u.nombre AS usuario_nombre,
    u.dni AS usuario_dni,
    SUM(ds.importe) AS total_deudas_pagadas
FROM socios s
INNER JOIN usuarios u ON u.id = s.uid
INNER JOIN deudas_socios ds ON ds.sid = s.sid
WHERE ds.estado = 'pagada'
GROUP BY u.id, u.apellido, u.nombre, u.dni
ORDER BY total_deudas_pagadas DESC
LIMIT 15;
