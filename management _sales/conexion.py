import sqlite3
from contextlib import contextmanager

DB_NAME = "store.db"  # Cambiá al nombre de tu archivo

@contextmanager
def obtener_conexion():
    conn = sqlite3.connect(DB_NAME)
    try:
        yield conn
    finally:
        conn.close()
