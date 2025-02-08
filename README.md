
# GameTower App

## Descripción
GameTower App es una aplicación diseñada para explorar, buscar y descubrir videojuegos populares. Implementa un diseño limpio y escalable utilizando patrones de arquitectura modernos como *MVVM, gestión de navegación con **Coordinator, almacenamiento local con **Core Data*, y componentes reutilizables para maximizar la eficiencia y mantenibilidad del código.

---

## Tecnologías y Arquitectura

### *MVVM (Model-View-ViewModel)*
- Separa la lógica de negocio de la interfaz de usuario.
- Facilita la escalabilidad y el mantenimiento del código.
- Mejora la testabilidad y modularidad de la aplicación.

### *Coordinator Pattern*
- Maneja la navegación de manera desacoplada.
- Mejora la legibilidad y permite una mejor organización del flujo de la aplicación.

###  *Core Data*
- Permite el almacenamiento y recuperación eficiente de datos sin necesidad de una conexión a internet.
- Optimiza el rendimiento mediante la persistencia de videojuegos en la base de datos local.

###  *Componentes Reutilizables*
- Se crearon vistas modulares como *BannerView, CategoryGridView, PlatformGridView*, y más.
- Facilitan la reutilización del código y mejoran la experiencia de usuario.

---

## Diseño UI (Figma)
A continuación, se presentan algunos diseños de la aplicación creados en Figma:

![Diseño en Figma](https://i.ibb.co/TDmQbdVm/Screenshot-2025-02-07-191737.png)
![Diseño en Figma](https://i.ibb.co/twz5w75x/Screenshot-2025-02-07-191746.png)
![Diseño en Figma](https://i.ibb.co/5C3sdbR/Screenshot-2025-02-07-191800.png)
![Diseño en Figma](https://i.ibb.co/93TysM46/Screenshot-2025-02-07-191811.png)
![Diseño en Figma](https://i.ibb.co/qYgGNkKd/Screenshot-2025-02-07-191716.png)


---

## Características
✅ Búsqueda interactiva de videojuegos.  
✅ Carrusel dinámico con destacados y recomendados.  
✅ Sección de videojuegos más vendidos.  
✅ Filtros por categoría y plataforma.  
✅ Integración con enlaces para obtener más información o descargar el juego.  
✅ Persistencia de datos con *Core Data*.

---

## Instalación y Uso
1. Clona el repositorio:
   bash
   git clone https://github.com/tuusuario/VideoGameApp.git
   
2. Abre el proyecto en *Xcode*.
3. Asegúrate de tener configurado el *SDK de iOS* y un *simulador/dispositivo físico*.
4. Ejecuta el proyecto presionando *Cmd + R*.

---

## Herramientas 
- Xcode 16.0
- Figma
- Github Desktop

---

## Licencia
Este proyecto está bajo la licencia *MIT*. Siéntete libre de contribuir y mejorar la aplicación. 
