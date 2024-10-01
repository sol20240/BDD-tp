SELECT so.sid, us.apellido, us.nombre, us.dni, SUM(ds.importe) FROM socios so 
INNER JOIN usuarios us ON us.id = so.uid 
INNER JOIN deudas_socios ds ON ds.sid = so.sid 
WHERE ds.estado = 'pagada'
GROUP BY so.sid 
ORDER BY SUM(ds.importe) DESC
LIMIT 10;
