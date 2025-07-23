/*
INSERT INTO users (name,lastame,dni,username,password,email,phone,address,rol)
 VALUES 
 ("Lionel","Messi","42567132","LIO10","MESIAS123","lio10@gmail.com","3873556321","1 de Mayo 345",1),
 ("Enzo","Fernández","41562112","ENZO10","ENZO4321","enzo5@gmail.com","3873556321","Mitre 54",2);
 */


/*
-- Tabla: categorias
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    estado INTEGER DEFAULT 1
);

-- Tabla: proveedores
CREATE TABLE proveedores (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    razon_social TEXT NOT NULL,
    codigo_proveedor INTEGER UNIQUE NOT NULL,
    cuit TEXT NOT NULL UNIQUE,
    nombre_contacto TEXT,
    telefono TEXT,
    direccion TEXT,
    email TEXT,
    condicion_iva TEXT CHECK (
        condicion_iva IN (
            'Responsable Inscripto',
            'Monotributista',
            'Exento',
            'Consumidor Final'
        )
    ),
    estado INTEGER DEFAULT 1
);

-- Tabla: productos
CREATE TABLE productos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo INTEGER UNIQUE NOT NULL,
    descripcion TEXT,
    precio_consto REAL NOT NULL,
    precio_venta REAL NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    categoria_id INTEGER,
    proveedor_id INTEGER,
    estado INTEGER DEFAULT 1,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id),
    FOREIGN KEY (proveedor_id) REFERENCES proveedores(id)
);

-- Tabla: clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    codigo_cliente INTEGER UNIQUE NOT NULL,
    apellido TEXT NOT NULL,
    telefono TEXT,
    email TEXT,
    direccion TEXT,
    dni TEXT,
    cuit TEXT UNIQUE,
    condicion_iva TEXT CHECK (
        condicion_iva IN (
            'Responsable Inscripto',
            'Monotributista',
            'Exento',
            'Consumidor Final'
        )
    ),
    estado INTEGER DEFAULT 1
);

-- Tabla: ventas
CREATE TABLE ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    fecha TEXT NOT NULL,
    total REAL NOT NULL,
    usuario_id INTEGER NOT NULL,
    tipo_pago TEXT NOT NULL,
    observacion TEXT,
    codigo_venta INTEGER UNIQUE NOT NULL,
    estado INTEGER DEFAULT 1,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);

-- Tabla: detalle_ventas
CREATE TABLE detalle_ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venta_id INTEGER NOT NULL,               -- Relación con la tabla ventas
    producto_id INTEGER NOT NULL,            -- Relación con la tabla productos
    cantidad INTEGER NOT NULL,               -- Cantidad de unidades vendidas
    precio_unitario REAL NOT NULL,           -- Precio del producto en el momento de la venta
    subtotal REAL NOT NULL,                  -- cantidad × precio_unitario
    status INTEGER DEFAULT 1,                -- 1 = activo, 0 = eliminado (soft delete)
    FOREIGN KEY (venta_id) REFERENCES ventas(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Tabla: rol_usuarios
CREATE TABLE rol_usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL UNIQUE CHECK (
        tipo IN (
            'superadmin',
            'admin',
            'ventas',
            'caja',
            'mecanico'
        )
    )
);

-- Tabla: usuarios
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    lastname TEXT NOT NULL,
    dni TEXT UNIQUE NOT NULL,
    username TEXT UNIQUE NOT NULL,
    password BLOB NOT NULL,  
    email TEXT UNIQUE NOT NULL,
    phone TEXT NOT NULL,
    address TEXT NOT NULL,
    rol_id INTEGER NOT NULL,
    status INTEGER DEFAULT 1,
    FOREIGN KEY (rol_id) REFERENCES rol_usuarios(id)
);
-- Tabla: ventas
CREATE TABLE ventas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    fecha TEXT NOT NULL,
    total REAL NOT NULL,
    usuario_id INTEGER NOT NULL,
    tipo_pago TEXT NOT NULL,
    observacion TEXT,
    codigo_venta INTEGER UNIQUE NOT NULL,
    estado INTEGER DEFAULT 1,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id)
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);
*/


