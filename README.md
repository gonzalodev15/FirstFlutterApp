# First Flutter App

Esta es una aplicación básica para ver temas de navegación básicos e ingreso de información en formularios

# Esta aplicación tiene 4 componentes principales

Las clases de objetos, en la que tenemos al usuario:

```dart
class User {
  String id;
  String name;
  String email;
  String phone;
  String job;
  String description;

  User({this.id = '', this.name = '', this.email = '', this.phone = '', this.job = '', this.description = ''});
}
```

Los StatefulWidgets, que son aquellos componentes que varían o tienen diferentes estados de acuerdo a las acciones del usuario, los cuales son: 

El detalle del usuario, el formulario de ingreso de usuarios, el Multiform (que actúa como nexo entre los demás) y las cards de usuario para presentar la información

Luego están las rutas, que son aquellos componentes estáticos o StatelessWidgets, los cuales conforman la pantalla del form, el empty state o estado vacío y la pantalla de detalle 

Por último, el archivo main que se encarga de mostrar todo lo ya mencionado pero que no contiene código innecesario con tal de tener todo más limpio


# Uso de la aplicación

Al iniciar, se presentará la pantalla vacía y el usuario podrá agregar personas dando tap al botón flotante. Aquí este le llevará a una pantalla de formulario que le permitirá al usuario llenar los datos, finalizar la edición, editar e incluso borrar la información que ya ingresó. 

Una vez el usuario agrega y vuelve a la pantalla principal, los cambios se reflejan y se muestra una lista simple del usuario y su trabajo, pudiendo el usuario entrar al detalle, visualizar la información completa y editar/eliminar según crea necesario.