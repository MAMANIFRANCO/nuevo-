from conexion import obtener_conexion

def obtener_productos(filtro=""):
    with obtener_conexion() as conn:
        cursor = conn.cursor()

        if filtro:
            query = "SELECT codigo, descripcion, precio_venta, stock FROM productos WHERE descripcion LIKE ?"
            cursor.execute(query, ('%' + filtro + '%',))
        else:
            query = "SELECT codigo, descripcion, precio_venta, stock FROM productos"
            cursor.execute(query)

        productos = cursor.fetchall()
        return productos
