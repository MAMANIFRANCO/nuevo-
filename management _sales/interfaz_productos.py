import customtkinter as ctk
from tkinter import ttk
from productos_utilidad import obtener_productos  # Usamos la función del archivo externo

# Configuración inicial de CustomTkinter
ctk.set_appearance_mode("light")
ctk.set_default_color_theme("blue")

# Función para cargar los productos en el Treeview
def cargar_productos_en_tabla(filtro=""):
    for item in tree.get_children():
        tree.delete(item)

    productos = obtener_productos(filtro)
    for prod in productos:
        tree.insert("", "end", values=prod)

# Crear ventana
ventana = ctk.CTk()
ventana.title("Listado de Productos")
ventana.geometry("800x500")

# Campo de búsqueda
frame_busqueda = ctk.CTkFrame(ventana)
frame_busqueda.pack(pady=10, fill="x", padx=20)

entry_busqueda = ctk.CTkEntry(frame_busqueda, placeholder_text="Buscar producto por descripción")
entry_busqueda.pack(side="left", fill="x", expand=True, padx=(0, 10))

def buscar():
    filtro = entry_busqueda.get()
    cargar_productos_en_tabla(filtro)

btn_buscar = ctk.CTkButton(frame_busqueda, text="Buscar", command=buscar)
btn_buscar.pack(side="right")

# Tabla (Treeview)
frame_tabla = ctk.CTkFrame(ventana)
frame_tabla.pack(expand=True, fill="both", padx=20, pady=10)

tree = ttk.Treeview(frame_tabla, columns=("Código", "Descripción", "Precio", "Stock"), show="headings")
tree.heading("Código", text="Código")
tree.heading("Descripción", text="Descripción")
tree.heading("Precio", text="Precio Venta")
tree.heading("Stock", text="Stock")

tree.column("Código", width=100, anchor="center")
tree.column("Descripción", width=300)
tree.column("Precio", width=100, anchor="e")
tree.column("Stock", width=80, anchor="center")

tree.pack(fill="both", expand=True)

# Ejecutar
cargar_productos_en_tabla()
ventana.mainloop()
