```markdown
# Sistema de Venta de Productos - Pseudocódigo PseInt

Una solución modular implementada en **pseudocódigo** que simula un entorno completo de comercio electrónico (E-commerce). El software permite la gestión nativa de cuentas de usuario, catálogo de productos con control de inventario y simulación de un carrito de compras.

## Características Principales
* **Autenticación Modular:** Funciones independientes para el registro seguro de credenciales y un sistema interactivo de Inicio de Sesión.
* **Inventario Automatizado:** Carga inicial automática de productos regionales (precios expresados en colones) divididos por categorías de frutas y verduras.
* **Motor de Búsqueda:** Búsqueda flexible que permite filtrar el catálogo tanto por nombre exacto del artículo como por su categoría.
* **Flujo de Carrito de Compras:** Lógica de negocio que valida la existencia del stock físico en tiempo real antes de procesar y descontar los artículos de la compra final.

---

## Arquitectura del Código
El algoritmo sigue una arquitectura modular mediante subprocesos o funciones reutilizables:
* `Registrar(...)`: Almacena el perfil en los vectores globales de datos.
* `inicioSesion(...)`: Valida credenciales iterando sobre las posiciones dinámicas activas.
* `verProductos(...)` y `buscar(...)`: Controlan la salida en pantalla del inventario activo.
* `agregarAlCarritoProductos(...)`: Enlaza la sesión activa del usuario con la preselección de mercancía.
* `confirmarCompraAgregadaAlCarrito(...)`: Realiza la persistencia temporal en memoria del stock final tras procesar la orden exitosamente.

---

## Requisitos para Ejecución
1. Descarga e instala el software **PseInt** en tu sistema operativo.
2. Abre el archivo de extensión `.psc` que contiene el código fuente.
3. Asegúrate de configurar el perfil de lenguaje en modo **Flexible** o **Semiorganizado** (según tus preferencias de declaración de variables).
4. Haz clic en el botón de **Ejecutar** (icono verde de Play) para interactuar con el menú de consola de 7 opciones.