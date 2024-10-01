#en base a la solucion anterior  determinar los 5 equipos que mas aportaron al club ordenados en forma decrecientes. 

SELECT
    us.id AS usuario_id,
    us.apellido AS usuario_apellido,
    us.nombre AS usuario_nombre,
    us.dni AS usuario_dni,
    SUM(ds.importe) AS total_aporte
FROM
    socios so
INNER JOIN
    usuarios us ON us.id = so.uid
INNER JOIN
    deudas_socios ds ON ds.sid = so.sid
WHERE
    ds.estado = 'pagada'
GROUP BY
    us.id, us.apellido, us.nombre, us.dni
ORDER BY
    total_aporte DESC
LIMIT 5;


