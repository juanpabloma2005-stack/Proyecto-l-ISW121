Funcion Registrar(posicion, nombre, email, contra)
	Escribir "Escribe tu nombre completo"
	Leer nombre[posicion]
	Escribir "Escribe un correo a registar"
	Leer email[posicion]
	Escribir "Escribe una contraseña"
	Leer contra[posicion]
	Escribir "Se registró exitosamente " + nombre[posicion]
Fin Funcion

Funcion sesion <- inicioSesion(email, contra, ultimaPosicion)
    posicion = 1
    sesion = 0
    parar = 0
    Escribir "Escribe el correo"
    Leer leer_email
    Escribir "Escribe la contraseña"
    Leer leer_contra
	Mientras posicion <= ultimaPosicion Y parar == 0 Hacer
		Si email[posicion] == leer_email Y contra[posicion] == leer_contra Entonces
			sesion = 1
			Escribir "Se inició sesión correctamente"
			parar = 1
		SiNo
			posicion = posicion + 1
		FinSi
		Si posicion > ultimaPosicion Entonces
			Escribir "Cuenta inexistente"
			parar = 1 
		FinSi
	FinMientras
FinFuncion

Funcion verProductos(nombre, categoria, precio, stock)
	posicion = 1
	Mientras posicion <= 5 Hacer
		Escribir "Producto: " + nombre[posicion] + " - Categoría: " + categoria[posicion] + " - Precio en colones: " + ConvertirATexto(precio[posicion]) + " - Cantidad: " + ConvertirATexto(stock[posicion])
		posicion = posicion + 1
	FinMientras
FinFuncion

Funcion confirmarCompraAgregadaAlCarrito(nombre, stock, carrito_nombre, carrito_stock)
	posicion = 1
	exitoso = 1
	Mientras posicion <= 5 Hacer
		Si nombre[posicion] == carrito_nombre[posicion] Entonces
			Si stock[posicion] > 0 Entonces
				stock[posicion] = carrito_stock[posicion]
				Escribir "Del producto: " + nombre[posicion] + " ahora hay " + ConvertirATexto(stock[posicion]) + " disponibles."
			SiNo
				Escribir "El producto " + nombre[posicion] + " tiene cantidades 0"
				exitoso = 0
			FinSi
		FinSi
		posicion = posicion + 1
	FinMientras
	
	Si exitoso == 1 Entonces
		Escribir "Compra realizada exitosamente"
		Mientras posicion <= 5 Hacer
			carrito_nombre[posicion] = ""
			carrito_stock[posicion] = 0
		FinMientras
	SiNo
		Escribir "La compra ha fallado"
	FinSi
FinFuncion

Funcion agregarAlCarritoProductos(nombre, categoria, precio, stock, sesion, nombre_carrito, carrito_stock)
	Si sesion == 1 Entonces
		parar = 0
		Repetir
			Escribir "Escribe el nombre del producto que deseas agregar al carrito"
			Leer nombreAgregado
			posicion = 1
			encontrado = 0
			Mientras posicion <= 5 Hacer
				Si nombre[posicion] == nombreAgregado Entonces
					Escribir "Producto agregado al carrito:"
					nombre_carrito[posicion] = nombre[posicion]
					carrito_stock[posicion] = stock[posicion] - 1
					Escribir "Producto: " + nombre[posicion] + " - Categoría: " + categoria[posicion] + " - Precio: " + ConvertirATexto(precio[posicion]) + " - Stock: " + ConvertirATexto(stock[posicion])
					encontrado = 1
				FinSi
				posicion = posicion + 1
			FinMientras
			Si encontrado == 0 Entonces
				Escribir "No se encontró el producto " + nombreAgregado
			FinSi
			Escribir "¿Quieres agregar otro producto? Presiona 1 para sí o cualquier otro número para No."
			Leer agregarOtroProducto
			Si agregarOtroProducto <> 1 Entonces
				parar = 1
			FinSi
		Hasta Que parar == 1
	SiNo
		Escribir "No puedes agregar productos al carrito sin haber iniciado sesión primero"
	FinSi
FinFuncion

Funcion buscar(nombre, categoria, precio, stock)
    posicion = 1
    parar = 0
    Escribir "Escribe el nombre del producto o la categoría que desea buscar"
    Leer leerProducto
    Escribir "Resultados:"
    Mientras posicion <= 5 Hacer
        Si nombre[posicion] == leerProducto O categoria[posicion] == leerProducto Entonces
            Escribir "Producto: " + nombre[posicion] + " - Categoría: " + categoria[posicion] + " - Colones: " + ConvertirATexto(precio[posicion]) + " - Stock: " + ConvertirATexto(stock[posicion])
            parar = 1
        FinSi
        posicion = posicion + 1
    FinMientras
    Si parar == 0 Entonces
        Escribir "No se encontraron productos que coincidan."
    FinSi
FinFuncion

Funcion guardar_Automaticamente(nombre, categoria, precio, stock)
    nombre[1] = "1 Kilo de Manzanas"
    categoria[1] = "Frutas"
    precio[1] = 2000
    stock[1] = 100
	
    nombre[2] = "2 Papayas"
    categoria[2] = "Frutas"
    precio[2] = 1000
    stock[2] = 70
	
    nombre[3] = "1 Kilo de Mamones Chinos"
    categoria[3] = "Frutas"
    precio[3] = 2500
    stock[3] = 150
	
    nombre[4] = "1 Kilo de Aguacates"
    categoria[4] = "Verdura"
    precio[4] = 3000
    stock[4] = 120
	
    nombre[5] = "1 Kilo de zanahora"
    categoria[5] = "Verdura"
    precio[5] = 1650
    stock[5] = 90
Fin Funcion

Algoritmo Sistema_De_Venta
	
	posicion = 1
	inicio_sesion = 0
	
	Dimensionar nombre[50]
	Dimensionar email[50]
	Dimensionar contra[50]
	
	Dimensionar nombre_produc[5]
	Dimensionar produc_categoria[5]
	Dimensionar precio_produc[5]
	Dimensionar produc_stock[5]
	Dimensionar carrito_nombre[50]
	Dimensionar carrito_stock[50]
	
	guardar_Automaticamente(nombre_produc, produc_categoria, precio_produc, produc_stock)
	
	Repetir
		Escribir "Elige la opción Deseada"
		Escribir "1. Registrar Usuario"
		Escribir "2. Iniciar sesión"
		Escribir "3. Lista de productos"
		Escribir "4. Buscar por nombre o categoria"
		Escribir "5. Agregar al carrito"
		Escribir "6. Confirmar compra"
		Escribir "7. Salir"
		leer terminar
		Segun terminar Hacer
			1:
				Registrar(posicion, nombre, email, contra)
				id = id + 1
			2:
				inicio_sesion = inicioSesion(email, contra, posicion)
			3:
				verProductos(nombre_produc, produc_categoria, precio_produc, produc_stock)
			4:
				buscar(nombre_produc, produc_categoria, precio_produc, produc_stock)
			5:
				agregarAlCarritoProductos(nombre_produc, produc_categoria, precio_produc, produc_stock, inicio_sesion, carrito_nombre, carrito_stock)
			6:
				confirmarCompraAgregadaAlCarrito(nombre_produc, produc_stock, carrito_nombre, carrito_stock)
		FinSegun
	Hasta Que (terminar >= 7)	
FinAlgoritmo
