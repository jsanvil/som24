---
title: "UD6 Administración SO Windows"
nocite: |
  @iocsom, @somesom, @wikipedia, @windows
---

# 5.1 Windows OS Administration

In this unit, we will focus on basic administration tasks in the *Microsoft Windows* operating system.

- Managing user profiles and local groups. Passwords
- File system management
- Processes and priorities
- System performance. System activity monitoring
- Service management
- Storage device management
- Network device configuration
- Task automation

# Administración SO Windows

En esta unidad, nos centraremos en las tareas básicas de administración en el sistema operativo *Microsoft Windows*.

- Gestión de perfiles de usuarios y grupos locales. Contraseñas
- Gestión del sistema de archivos
- Procesos y prioridades
- Rendimiento del sistema. Seguimiento de la actividad del sistema
- Gestión de servicios
- Gestión de dispositivos de almacenamiento
- Configuración de dispositivos de red
- Automatización de tareas

<!-- NEWPAGE -->
## Gestión de perfiles de usuarios y grupos locales. Contraseñas

### Cuentas de usuario

Para un sistema operativo, una cuenta de usuario se identifica como la unión entre un nombre y una determinada información de autenticación por la que, quien la utiliza, demuestra que está autorizado para hacerlo. Esta información de autenticación suele ser una contraseña, pero podría sustituirse por otros métodos, como el DNI electrónico u otra tarjeta inteligente de este tipo, o incluso algunos más futuristas, como el uso de la huella dactilar, el iris, etc.

::: tip
**Autenticación en dos pasos**

De un tiempo a esta parte, en muchos de los servicios que usamos a través de Internet, se ha hecho imprescindible la autenticación en dos pasos. La idea es muy sencilla: crear un mecanismo que aumente la seguridad comprobando la identidad del usuario por dos medios diferentes:

1. *Algo que sepamos*: Por ejemplo, un nombre de usuario y una contraseña.

2. *Algo que tengamos*: Por ejemplo, un teléfono móvil, donde recibiremos un mensaje de texto con un código de acceso.

De esa forma, aunque una persona no autorizada averigüe nuestro nombre de usuario y contraseña, aún necesitará nuestro teléfono para acceder a la cuenta y que éste se encuentre desbloqueado.

Como cabe esperar, el código de acceso recibido será de un solo uso y caducará pasado un tiempo, que dependerá del proveedor del servicio.
:::

Normalmente, una cuenta de usuario está relacionada con una persona, que es quien se acredita para utilizar el ordenador, pero en ciertas situaciones, puede ser un programa en un ordenador, quien necesite autenticarse frente a un servidor para obtener un determinado recurso o servicio.

Cuando en la autenticación se utiliza una *contraseña*, ésta debe tener el grado de complejidad suficiente, debido a que cumple una doble misión: por un lado, impide el acceso a quien carece de la autorización necesaria y, por otro, relaciona dicho acceso con un individuo que, por lo tanto, será responsable del mismo. Por este motivo debe evitarse a toda costa el uso de cuentas de usuario que sean utilizadas por varias personas de manera indistinta.

::: warning
Cuando sea necesario, se establecerá un protocolo que asegure una complejidad suficiente en las contraseñas de cada usuario. Por ejemplo, usando diversos tipos de caracteres (mayúsculas, minúsculas, signos y/o dígitos) y estableciendo una longitud mínima.
:::

En general, los sistemas operativos suelen disponer de tres tipos diferentes de cuentas, con las que sus respectivos usuarios dispondrán de distintos niveles de control sobre el sistema. Son estas:

- **Cuentas estándar**: En general, con ellas pueden desarrollarse tareas cotidianas que no sean de carácter administrativo.

- **Cuentas de administrador**: Ofrecen control sobre todos los aspectos del sistema operativo, por lo que deben usarse con la cautela necesaria y sólo en las actividades para las que están pensadas.

- **Cuentas de invitado**: Suelen utilizarse para permitir el uso a usuarios ocasionales. Sus capacidades están muy limitadas.

::: note
Las cuentas de usuario invitado pueden resultar muy útiles cuando utilizamos el ordenador en demostraciones o cuando se ofrece su uso a diferentes personas a lo largo del tiempo (hoteles, cafeterías, etc).

En otros contextos, cuando no sean necesarias, puede resultar conveniente inhabilitarlas por cuestiones de seguridad.
:::

Por otro lado, el concepto de cuenta de usuario está asociado al concepto de sesión. Entendemos por **sesión** el tiempo consecutivo en el que una cuenta de usuario se encuentra activa en el sistema operativo. Por lo tanto, se prolonga desde que el usuario se autentica, momento en el que se dice que ha iniciado sesión, hasta que abandona el sistema, que se conoce como cierre de sesión.

Además, una cuenta de usuario tiene asociada una relación de permisos y privilegios.

Los privilegios definen lo que el usuario podrá hacer en el sistema una vez iniciada la sesión (por ejemplo, apagar el sistema o hacer copias de seguridad) mientras que los permisos definen dónde se puede acceder y bajo qué condiciones (por ejemplo, leer, escribir o ejecutar un determinado archivo o carpeta). Por lo tanto, un permiso está vinculado a un objeto, como un archivo, una carpeta o una impresora.

::: tip
Es frecuente que los privilegios reciban también el nombre de *derechos*.
:::

Cuando un privilegio entra en contradicción con un permiso, siempre prevalece el privilegio. Por ejemplo, un usuario con privilegios para hacer copias de seguridad, podrá copiar todos los archivos, aunque no tenga permisos de lectura sobre ellos.

Otro aspecto relacionado con las cuentas de usuario son los perfiles de usuario. En ellos se definen el aspecto y la configuración de cada usuario específico, desde el fondo de escritorio o el juego de iconos que utiliza, hasta los documentos con los que trabaja o los archivos que ha descargado.

Por lo tanto, cuando un usuario inicia sesión en una cuenta por primera vez, se encontrará un entorno de trabajo con todos los valores predeterminados, aunque el sistema haya estado usándose, por medio de otras cuentas, durante un tiempo prolongado y dichas cuentas sí hayan sido previamente personalizadas.

En general, según su ámbito, existen varios tipos de cuentas:

- **Cuentas locales**: La autenticación corre a cargo del sistema operativo del ordenador en el que nos autenticamos y sólo nos facilita el acceso a recursos de éste. Para autenticarnos con los mismos datos en diferentes ordenadores, necesitaremos que en ellos se hayan creado previamente cuentas idénticas. Aun así, cada una de ellas facilitará el acceso a los recursos del ordenador en el que se encuentre.

- **Cuentas de usuario de red**: Normalmente, la autenticación corre a cargo de un ordenador que actúa como servidor en la red y, cuando es satisfactoria, permite el acceso a recursos que pueden ofrecen desde diferentes ordenadores de dicha red. Por lo tanto, podremos utilizar la misma cuenta para acceder desde diferentes ordenadores que pertenezcan a la misma red.

- **Cuentas de usuario *Microsoft***: Es un caso particular de los sistemas operativos Windows, que asocian una cuenta de usuario con una dirección de e-mail y una contraseña, de forma que toda la información de la cuenta se almacena en los servidores de Microsoft, pudiendo compartir, de forma totalmente automática todas las configuraciones y preferencias en todos los equipos donde usemos esos mismos datos de autenticación. En realidad, podríamos pensar que es un caso particular de una cuenta de usuario de red.

Lógicamente, la administración de usuarios adquirirá más importancia cuantos más usuarios, con características diversas, usen el ordenador. En cualquier caso, en este documento nos referiremos, exclusivamente, a las cuentas de usuario locales.

### Cuentas de usuario locales

hemos indicado que la mayoría de los sistemas operativos disponen de tres tipos de cuentas: Administrador, usuario e invitado. Sin embargo, en las versiones más recientes del sistema operativo de *Microsoft*, se ha producido una reinterpretación de este concepto, disponiendo de tres tipos de cuentas:

- Cuentas de administrador
- Cuentas estándar
- Cuentas infantiles

Si eres tú quien ha instalado el sistema operativo, *Windows* asume que tu vas a ser uno de sus administradores. Por lo tanto, podrás realizar cualquier cambio en su configuración, añadir nuevas cuentas de usuario, instalar o eliminar programas, consultar o modificar el contenido de cualquier archivo del equipo, instalar o configurar cualquier dispositivo hardware, etc.

::: tip
Para instalar las aplicaciones que se ejecutan en la pantalla Inicio para ofrecer información al usuario, no necesitamos tener una cuenta de administrador.
:::

Como es lógico, cualquier ordenador con *Windows* deberá disponer, como mínimo, de una cuenta de administración, aunque no pensemos realizar tareas administrativas frecuentemente.

Las cuentas estándar están pensadas para usuarios que no necesitan hacer ninguno de los cambios anteriores en el sistema. Desde ellas se puede llevar a cabo cualquier trabajo cotidiano, pero no podrán hacerse tareas administrativas.

Este tipo de cuentas son perfectas para el uso cotidiano de cualquier usuario, incluido el que realiza las tareas administrativas. Piensa que, si eres usuario administrador y ejecutas un programa, este puede hacer uso de tus privilegios para alterar el sistema. Por ejemplo, un virus que haya infectado al programa que estamos utilizando lo tendrá mucho más difícil para contagiar al resto del sistema cuando usamos una cuenta estándar que si lo hacemos con una cuenta de administrador. Así pues, es recomendable que el usuario que realiza tareas administrativas disponga de dos cuentas de usuario: una para administrar el equipo y otra para su uso cotidiano.

Por otro lado, en *Windows*, para realizar tareas administrativas desde una cuenta de usuario estándar, sólo tenemos que conocer la contraseña de una cuenta de administrador.

Por su parte, las cuentas infantiles no son más que cuentas de usuario estándar a las que se les ha habilitado el control parental. Por ese motivo, este tipo de cuentas no aparecen representadas de forma individual en el *Panel de control* de *Windows*.

<!-- NEWPAGE -->

### Crear una cuenta de usuario estándar en Windows 11

Podemos agregar cuentas estándar de forma sencilla desde el panel de configuración.

![Abrir el panel de Configuración, seleccionar "Cuentas" y entrar en "Otros usuarios"](ud6/user1.png){width=70%}

![Pulsar el botón "Agregar cuenta"](ud6/user2.png){width=60%}

![Escribir las credenciales de acceso del nuevo usuario](ud6/user3.png){width=50%}

![Una vez terminado el proceso, aparecerá en el listado](ud6/user4.png){width=70%}

<!-- NEWPAGE -->

Para gestionar usuarios de una forma más completa, debemos utilizar el gestor de usuarios y grupos locales. Podemos acceder a la herramienta ejecutando el comando `lusrmgr.msc` o haciendo clic derecho sobre el botón de inicio, abrir "Administración de equipos" y seleccionar "Usuarios y grupos locales"

![Administración de equipos > Usuarios y grupos locales](ud6/user5.png)

Haciendo clic derecho sobre un usuario aparece un menú contextual desde el que podemos realizar varias acciones. Por lo general abriremos las Propiedades.

De forma predeterminada, estaremos situados sobre la solapa "General", que contiene los mismos datos que introdujimos cuando la creamos, aunque ahora aparece una opción más que nos permite bloquear la cuenta.

También tenemos dos nuevas solapas que nos permitirán ajustar las características de perfil de la cuenta de usuario y consultar los grupos a los que pertenece.

![Propiedades de un usuario](ud6/user5.png)

<!-- NEWPAGE -->

### Grupos

En el ámbito doméstico, es poco frecuente que necesitemos crear grupos de usuarios. Sin embargo, cuando nos encontramos en el ámbito de una empresa (aunque esta sea mediana, o incluso pequeña), podemos encontrarnos en situaciones donde necesitemos crear diferentes cuentas de usuario que tengan los mismos permisos y privilegios. En estos casos, podríamos encontrarnos en la situación de configurar una y otra vez las mismas características en las distintas cuentas.

En estas situaciones, la solución son los grupos de usuarios. La idea consiste en crear un grupo que sea el que dispone de las características comunes a distintas cuentas. Una vez creado el grupo, sólo tenemos que convertir a las cuentas de usuarios en miembros del grupo para que hereden todas las características que establecimos en éste.

Cuando un nuevo usuario deba compartir las características de los anteriores, bastará con hacerlo miembro del grupo. De igual forma, si un usuario debe dejar de disfrutar de una serie de permisos, bastará con eliminar su cuenta del conjunto de miembros del grupo.

Además, una cuenta de usuario puede ser miembro de más de un grupo, lo que hace muy sencillo agrupar los recursos con características comunes en grupos y controlar qué usuarios acceden a ellos.

Es fácil comprender que, a medida que crezca la complejidad de la instalación informática a la que nos estemos refiriendo, los grupos se mostrarán más útiles. En este sentido, como en el caso de las cuentas de usuario, disponemos de dos tipos de cuentas de grupo según su ámbito de influencia:

- **Cuentas de grupo locales**: Como puedes suponer, su ámbito será el del equipo en el que se hayan creado y sus miembros serán cuentas de usuario locales.

- **Cuentas de grupo de red**: Su uso se orienta a las instalaciones de red, donde se ofrecen recursos a todos los equipos clientes de dicha red. Por lo tanto, dispondrán de permisos y privilegios relacionados con los recursos de compartidos en la red y sus miembros serán cuentas de usuario de red

En nuestro caso, nos centraremos, únicamente, en las cuentas de grupo locales.

<!-- NEWPAGE -->

### Grupos locales en Windows

Cuando instalamos el sistema, se crean de forma automática una serie de grupos con una configuración predeterminada que facilita la asignación de privilegios.

![Grupos integrados en el sistema Windows 11](ud6/groups1.png)

Algunos de los grupos que existen de forma predeterminada en Windows son:

- **Administradores**. Los usuarios de este grupo tienen acceso completo y sin restricciones al equipo.
- **Invitados**. Los usuarios de este grupo tienen acceso al sistema con más restricciones que un usuario estándar.
- **Operadores de configuración de red**. Este grupo concede a sus miembros privilegios para administrar la configuración de la red.
- **Operadores de copia de seguridad**. En este grupo se encuentran los usuarios con permisos para hacer copias de seguridad o restauración de archivos.
- **Usuarios**. Todos los usuarios estándares pertenecen a este grupo, que no permite que los usuarios hagan cambios accidentales que puedan afectar el sistema.
- **Usuarios avanzados**. Este grupo mujer a los usuarios más derechos administrativos de los que permite el grupo usuarios.
- **Usuarios de escritorio remoto**. Los usuarios que pertenecen a este grupo pueden iniciar sesión en modo remoto.

<!-- NEWPAGE -->

Para crear una cuenta de grupo utilizaremos la herramienta `lusrmgr.msc` (o alternativamente el panel de Administración de equipos).

Dentro de la seccion "Grupos" al hacer clic derecho se abre un diálogo donde seleccionamos "Grupo nuevo..."

Podemos agregar usuarios mediante el botón "Agregar..."

![Escribir el nombre del nuevo grupo"](ud6/groups2.png)

Para buscar usuarios, pulsaremos el botón "Opciones avanzadas..."

![Diálogo para la selección de usuarios](ud6/groups3.png)

<!-- NEWPAGE -->

Si pulsamos el botón "Buscar ahora" mostrará el listado completo de usuarios y grupos del sistema.

![Diálogo avanzado de selección de usuarios](ud6/groups4.png){width=50%}

Una vez añadido aparecerá en el listado de miembros del nuevo grupo.

![Diálogo de creación de nuevo grupo con un miembro añadido](ud6/groups5.png){width=50%}

Podemos ir a las propiedades el usuario y en el apartado "Miembro de" aparecerá a que grupos pertenece.

![Grupos a los que pertenece un usuario](ud6/groups6.png){width=80%}

<!-- NEWPAGE -->

### Gestión de directivas locales de contraseñas y bloqueo de cuentas

Podemos gestionar el nivel de seguridad del sistema modificando las directivas de contraseñas y bloqueo de cuenta.

Las directivas de contraseñas nos permite justar los parámetros de complejidad y vigencia de las mismas.

![Directiva de equipo local / Configuración del equipo / Configuración de seguridad / Directivas de contraseñas](ud6/polices1.png)

En las directivas de bloqueo de cuenta, podemos definir el número de intentos incorrectos antes que se bloquee la cuenta de usuario, y durante cuanto tiempo se bloqueará.

![Directiva de equipo local / Configuración del equipo / Configuración de seguridad / Directivas de bloqueo de cuenta](ud6/polices2.png)

<!-- NEWPAGE -->

## Gestión del sistema de archivos

El sistema operativo debe controlar los usuarios que pueden acceder a cada uno de los recursos que administra. Por ejemplo, directorios, impresoras, conexiones de red, etc.

Normalmente, para lograrlo, los sistemas utilizan **Listas de Control de Acceso** o *ACLs* (*Access Control Lists*), asociadas a los recursos. En ellas se relacionan los diferentes usuarios que pueden acceder y bajo qué condiciones (lectura, escritura, ejecución, etc.)

Además, cada archivo puede tener asociados diferentes atributos, que informan sobre ciertas características del archivo o del modo en el que el sistema operativo debe tratarlo. Así, un archivo puede tener atributos como: directorio, oculto, de sistema, cifrado, etc.

Ahora que ya conocemos diferentes aspectos de los usuarios y los grupos, estamos en disposición de aprender a modificar restricciones sobre el uso de los archivos y directorios.

### Permisos de directorios en Windows

Una de las primeras cosas que debemos saber sobre la estructura de directorios en *Windows* es que cada cuenta de usuario que inicia sesión en el sistema dispondrá de una carpeta donde se almacenará toda la configuración relativa al entorno de trabajo de dicho usuario, incluidos aspectos como la configuración de la pantalla, las conexiones de red, la configuración de impresoras, etc.

Esta información, que recibe el nombre de **perfil de usuario**, se organiza en diferentes archivos que se crean en el momento que el usuario inicia sesión por primera vez.

De esta forma, el sistema operativo consigue que varios usuarios puedan utilizar el mismo ordenador y que cada uno encuentre, al iniciar la sesión, el mismo entorno que dejó cuando cerró la sesión anterior. Además, los cambios efectuados por un usuario en la personalización de su espacio de trabajo no afectará a ningún otro usuario del equipo.

Estas carpetas se encuentran dentro del volumen donde se haya instalado el sistema operativo (normalmente la unidad `C:`), en una carpeta llamada `Usuarios`.

Cuando un usuario del grupo *Administradores* trata de acceder a la carpeta del perfil de otro usuario, recibe un aviso que le informa de que carece de permiso para hacerlo. Aún así, como se trata de un usuario con los privilegios suficientes, podrá hacer clic sobre el botón "Continuar" para acceder a su contenido.

![Solicitud de permiso para acceder a perfil de otro usuario](ud6/files1.png){width=80%}

<!-- NEWPAGE -->

Sin embargo, el cambio de permisos sólo se completará si el usuario con privilegios administrativos la aprueba, ya que el sistema muestra una ventana pidiendo su contraseña.

![Solicitud de permiso para acceder a perfil de otro usuario](ud6/files2.png){width=45%}

### Compartir el perfil con otro usuario

Según lo que hemos visto más arriba, un usuario que no pertenezca al grupo de administradores sólo podrá acceder a los datos de otro usuario cuando tenga la aprobación de un usuario administrador.

No obstante, siempre es posible que un usuario comparta voluntariamente su perfil con un usuario diferente. Algo que podemos hacer, de forma individual, con un usuario concreto, o con todos los miembros de un grupo.

Si hacemos clic derecho, sobre la carpeta que coincide con el nombre de nuestra cuenta. En el menú de contexto que aparece, elegiremos la entrada "*Conceder acceso a*".

Al hacerlo, veremos aparecer un nuevo menú con varias opciones, entre ellas, los nombre de los diferentes usuarios del sistema. Si queremos compartir la carpeta con un solo usuario y otorgándole sólo permiso de lectura sobre nuestros archivos, bastará con hacer clic sobre su nombre.

Además, disponemos de una opción titulada "*Usuarios específicos...*", que nos permitirá añadir varios usuarios de una sola vez, y cambiar sus permisos (las cosas que puede hacer) sobre nuestros archivos.

![Menú de contexto para conceder acceso a usuarios específicos](ud6/files3.png)

En el desplegable podemos seleccionar usuarios. Una vez añadido podemos modificar los permisos.

![Diálogo para agregar usuarios y permisos a una carpeta](ud6/files4.png){width=70%}

Por último, si existen subdirectorios, nos solicita confirmación para cambiar la configuración.

![Confirmación de cambio de permisos en subdirectorios](ud6/files5.png){width=70%}

Por otra parte podemos especificar permisos concretos desde el apartado "Seguridad" de las propiedades de un directorio pulsando el botón "Editar..."

![Editar permisos](ud6/files6.png){width=100%}

Los permisos estándar de *NTFS* que se pueden asignar a una carpeta son:

- **Control total**: para leer, cambiar, crear y ejecutar bien sean programas o carpetas.
- **Lectura y ejecución**: para ver el contenido y ejecutar programas de una carpeta.
- **Modificar**: para poder cambiar los ficheros y las carpetas, pero sin crear y eliminar ficheros ni carpetas nuevas.
- **Lectura**: para poder ver y abrir el contenido.
- **Escritura**: para poder crear y cambiar los ficheros y carpetas existentes.
- **Mostrar el contenido de la carpeta**.

Cuando hablamos de los permisos en carpetas y archivos, debemos tener en cuenta el concepto de **herencia**. El concepto de herencia describe cómo se propagan los permisos que otorgamos a una carpeta a través de los archivos y carpetas que ésta contiene.

Por defecto, cuando se proporcionan unos permisos a una carpeta que es padre de otras (es decir, que contiene a otras), todos los archivos y carpetas contenidos dentro de esta carpeta heredarán los mismos permisos.

Los permisos **explícitos**, a diferencia de los permisos heredados, son aquellos que se configuran de propio en un recurso. Es decir, aquellos que se establecen ex profeso para ese particular.

No es necesario romper la herencia si queremos mantener esos permisos hacia abajo, sino que tenemos que declarar permisos explícitos para proporcionar nuevos permisos de denegación o concesión de nuevos privilegios. Teniendo todo esto en cuenta, solo deberemos modificar esa herencia cuando queramos modificar algo, dejando sin modificación cuando queramos mantener la misma configuración.

En ocasiones, puede ser necesario que estos permisos no sean heredados hacia el interior, sino que se desea que la concesión de permisos quede “reseteada” añadiendo a mano los permisos que se deseen desde este punto.

Para estos casos, se deberá tomar uno de los siguientes caminos que comentamos a continuación:

- Redefinir los permisos de manera explícita.
- Eliminar la herencia en el objeto hijo.
- Eliminar la herencia al nivel del padre, lo que hará que se interrumpa la extensión hacia abajo (hacia los hijos).

Para controlar la herencia, debemos acceder a "Opciones avanzadas" dentro del apartado "Seguridad"

![Deshabilitar herencia](ud6/files7.png){width=100%}

### Acceso a la carpeta común

Además de lo anterior, dentro de la carpeta Usuarios, existen una carpeta que puede ser utilizada por todos los usuarios del equipo para compartir información. Se trata de la carpeta "*Acceso público*" situada en `C:\Users\Public`.

<!-- NEWPAGE -->

## Procesos y prioridades

La memoria principal del ordenador puede albergar cientos de tareas que se turnan en el uso del procesador. Una forma que tiene el sistema operativo para mejorar el rendimiento consiste en asignar diferentes prioridades a dichas tareas.

Un buen planteamiento general consiste en que los procesos que realicen **tareas interactivas**, es decir, los que **se comunican directamente con el usuario**, dispongan de una prioridad mayor. Por el contrario, aquellos que no necesitan la intervención directa del usuario, pueden ejecutarse con una prioridad más baja. De esta forma se garantiza, en general, una mejor experiencia para los usuarios del sistema operativo.

Se dice que los **procesos interactivos** se ejecutan en **primer plano** (en inglés, *foreground*), mientras que aquellos que no lo son se **ejecutan en segundo** plano (en inglés, *background*).

Como cabe esperar, un proceso que se ejecuta con una prioridad baja, cederá el uso del procesador, siempre que un proceso con una prioridad mayor lo reclame.

Un ejemplo de esto puede ser la tarea encargada de imprimir un documento. Las impresoras son, probablemente, los dispositivos más lentos que utilizamos. De este modo, basta con que, la tarea que se encarga de imprimir, obtenga el uso del procesador de vez en cuando, para que pueda alimentar el proceso de impresión con un flujo suficiente de datos. Así pues, esta sería una tarea ideal para funcionar con una prioridad baja (en segundo plano) y, mientras lleva a cabo su labor, los procesos interactivos seguirán funcionando casi a la misma velocidad que si no estuviésemos imprimiendo.

<!-- NEWPAGE -->

### Prioridad de ejecución en Windows

De forma general, *Windows* solo nos permite elegir si deben ejecutarse con una mayor prioridad los programas interactivos o los que se ejecutan en segundo plano.

![Ajustar el rendimiento del procesador](ud6/process1.png){width=80%}

No obstante, si quieres modificar la prioridad de una tarea particular, siempre puedes recurrir al Administrador de tareas.

![Modificar prioridad de un proceso](ud6/process2.png){width=70%}

<!-- NEWPAGE -->

## Rendimiento del sistema.

En general, podemos definir el concepto de rendimiento como la rapidez con la que un equipo realiza las tareas que se le encomiendan (tanto las relacionadas con el propio sistema, como las relacionadas con las aplicaciones y servicios). En principio, el rendimiento del sistema estará limitado por diferentes aspectos:

- La velocidad del procesador.
- La cantidad y velocidad de la memoria principal.
- La velocidad de los dispositivos de almacenamiento externo (normalmente discos duros).
- La velocidad de las interfaces de red.

::: tip
En ocasiones, alguno de los programas que estamos ejecutando en *Windows* deja de funcionar y no tenemos forma de cerrarlo. Hay una solución sencilla: reiniciar el sistema.

No obstante, esto nos obliga a guardar los archivos con los que estemos trabajando en el resto de aplicaciones, esperar a que el sistema se apague y vuelva a arrancar, y, por último, volver a ejecutar las aplicaciones y abrir los archivos.
:::

En los sistemas operativos *Windows* disponemos del **Administrador de tareas**, una herramienta que nos permitirá examinar datos de rendimiento del sistema e identificar posibles cuellos de botella.

Para iniciar el **Administrador de tareas**, sólo tenemos que hacer clic, con el botón derecho del ratón, sobre el icono de inicio o presionar la combinación de teclas `Ctrl`+`Alt`+`Supr`.

![Administrador de tareas en el apartado "Rendimiento"](ud6/process3.png){width=80%}

Para obtener información detallada qué recursos está consumiendo cada proceso existe una herramienta llamada **Monitor de recursos**.

![Monitor de recursos](ud6/process4.png){width=80%}

<!-- NEWPAGE -->

## Seguimiento de la actividad del sistema

En un sistema operativo moderno todas las acciones importantes son anotadas en un **registro de eventos** (también llamado ***log***). Dichas anotaciones incluyen mensajes de aviso y errores, y es importante supervisarlas periódicamente para asegurarnos de que no existen incidencias destacables. Y si las hay, tener la oportunidad de resolverlas antes de que tengan repercusiones graves.

El complemento de Windows que permite consultar y administrar los eventos anotados, tanto por los servicios del propio sistema, como por las diferentes aplicaciones, se llama **Visor de eventos**, y nos ofrece una forma potente y centralizada de conocer lo que está pasando en nuestro sistema operativo.

El **Visor de eventos** resulta imprescindible para supervisar el funcionamiento del servidor y resolver cualquier incidencia. Desde él podremos realizar las siguientes tareas:

- Consultar los eventos que se hayan producido.
- Crear filtros para los eventos que más nos interesen y almacenarlos como vistas personalizadas que podemos volver a utilizar en cualquier momento.
- Programar una tarea para que se ejecute en respuesta a una situación específica.
- Establecer suscripciones a determinados eventos.

Los eventos se clasifican en diferentes **categorías**:

1. *Vistas personalizadas*: Permiten restringir los eventos mostrados en función de nuestras preferencias.
2. *Registros de Windows*: Almacenan eventos relacionados con todo el sistema y los relativos a aplicaciones heredadas.
3. *Registros de aplicaciones y servicios*: Contienen eventos relacionados con aplicaciones o componentes particulares.
4. *Suscripciones*: Se utiliza para recopilar los eventos de otros equipos de la red y almacenarlos localmente.

La categoría *Registros de Windows* actúa como un contenedor de varias subcategorías que, en su mayoría, resultarán familiares para los usuarios avanzados de otros sistemas de escritorio de *Microsoft*. En concreto, encontramos las siguientes:

- *Aplicación*: Aquí anotan sus eventos las aplicaciones y los servicios que no forman parte del sistema.
- *Seguridad*: Incluye la información de los eventos relacionados con la seguridad del sistema.
- *Instalación*: Donde se anotan la información de los eventos relativos a la configuración de roles y características.
- *Sistema*: Contiene información relativa a los eventos del sistema y de sus componentes.
- *Eventos reenviados*: Contiene información reenviada por otros sistemas de la red.

![Visor de eventos](ud6/events1.png){width=90%}

<!-- NEWPAGE -->

## Gestión de servicios

Los servicios son un tipo particular de procesos que suele ejecutarse en segundo plano, es decir, sin que el usuario tenga constancia directa de su presencia y, normalmente, esperan un tipo de suceso para ofrecer una determinada prestación al usuario.

Durante la carga del sistema operativo, se inician multitud de servicios que están ocupando memoria y tiempo de procesador. Algunos de ellos, nunca llegan a ser necesarios.

Si queremos aprovechar al máximo la capacidad de cálculo de nuestro equipo, podemos pensar en desactivar aquellos servicios que no son necesarios para el uso que hacemos del ordenador. Aún así, debemos tener en cuenta que, en la mayoría de los casos, su funcionamiento está muy optimizado (sobre todo los del propio sistema operativo) y que, si no se usan, pronto acaban paginados a disco. Además, debemos tener en cuenta dos inconvenientes fundamentales:

- Si deshabilitamos un servicio necesario para el sistema operativo, éste puede dejar de funcionar de forma correcta.
- Un servicio que no es necesario en este momento y lo deshabilitamos, deberemos recordar habilitarlo en el futuro si llegara a serlo.

En cualquier caso, a medida que aumenta la cantidad de programas que tenemos instalados, pueden existir servicios menos optimizados. Incluso, en sistemas como Windows, pueden quedar en funcionamiento servicios asociados a un determinado programa aún cuando éste haya sido desinstalado. Incluso pueden existir servicios actuando como spyware. Por todos estos motivos, resulta interesante saber cómo actuar sobre los servicios del sistema.

Si estás pensando en deshabilitar algunos servicios de tu sistema, en la siguiente tabla tienes algunas sugerencias:

![Servicios de Windows](ud6/services.png){width=90%}

Un ejemplo típico sería el reinicio del servicio de "Cola de impresión" cuando hayan quedado trabajos en espera:

![Reinicio del servicio de "Cola de impresión"](ud6/services2.png){width=90%}

<!-- NEWPAGE -->

## Gestión de dispositivos de almacenamiento

Cuando necesitamos más espacio de almacenamiento en disco, podemos recurrir a comprimir archivos, a moverlos a un dispositivo de almacenamiento externo o incluso a eliminar los que ya no necesitemos. Sin embargo, una buena alternativa consiste en añadir un nuevo disco duro a nuestro sistema. Los discos duros tienen una gran relación entre el precio y la capacidad de almacenamiento y son muy fáciles de instalar.

Además, en la mayoría de los casos, el ordenador los detectará de forma automática y sólo habrá que configurar el sistema operativo para utilizarlos.

De hecho, en este apartado supondremos que la parte hardware ya está resuelta. Es decir, que ya has abierto el ordenador y has conectado correctamente un nuevo disco duro en su interior. Aquí nos centraremos en los ajustes que deberemos realizar en el sistema operativo para sacarle todo el rendimiento.

En Windows, configurar un disco que ha sido añadido en el interior del ordenador, o que se conecta a través de un puerto USB es prácticamente idéntico, salvo que los discos externos ya suelen venir particionados y formateados de fábrica (aunque siempre podremos borrar la estructura previa y comenzar de cero).

::: note
Cuando se hace referencia a *volumen* o *partición*, estamos hablando de lo mismo, una división lógica en una unidad de almacenamiento.
:::

En cualquier caso, en Windows, podemos utilizar dos formas diferentes de configurar discos:

- **Básica**: Es la que utilizan la mayoría de los ordenadores personales, por ser los más sencillos de administrar. En la configuración básica, cada partición (o volumen) es una entidad independiente, de modo que no puede compartir datos con otras particiones.

- **Dinámica**: Fue una configuración incorporada en los sistemas operativos de *Micorsoft* a partir de *Windows 2000*, que puede compartir un gran número de volúmenes (unos 2000), que pueden ser de distintos tipos:

  - **Simples**: Los discos se comportarán del modo habitual. Este tipo de volumen puede ser reflejado, pero no es tolerante a fallos.

  - **Reflejados**: Se crean dos copias idénticas de un volumen, apareciendo como una sola entidad. Cada escritura se replica en los discos espejo y pueden hacerse lecturas simultáneas de diferentes datos, lo que aumenta el rendimiento. Los diferentes discos pueden actuar de forma independiente (con diferentes controladoras), de modo que, si un disco falla, el sistema puede seguir funcionando a partir del que sigue activo. Esto aumenta la tolerancia a fallos.
  
    Como es lógico, deben utilizarse discos de las mismas características. De lo contrario, se toma como referencia la capacidad del disco más pequeño.
  
    Esta configuración equivale a **RAID-1**.

  - **Distribuidos**: Utiliza varios discos para crear una sola unidad lógica, permitiendo usar el espacio disponible de una forma muy eficiente. Consigue una mejora de rendimiento, tanto en la lectura como en la escritura, debido a que las operaciones se llevan a cabo en discos diferentes de forma simultánea.
  
    En esta configuración, los volúmenes no pueden ser reflejados y no es tolerante a fallos.

  - **Seccionados**: Es una variante de la anterior. Aunque mejora su rendimiento, es más vulnerable a los errores de escritura.

    Deben utilizarse discos de las mismas características. De lo contrario, se toma como referencia la capacidad del disco más pequeño.

    Esta configuración equivale a **RAID-0**.
  
  - **RAID-5**: Distribuye los datos en tres o más discos, usando uno de ellos (que se va alternando) para almacenar información de paridad que permite la recuperación de datos cuando falla un disco. Por lo tanto, es tolerante a fallos. Mejora la eficiencia respecto a los anteriores, aunque el cálculo de la paridad penaliza ligeramente el rendimiento en la escritura.


### Niveles RAID básicos

Entre todos los dispositivos de almacenamiento presentes en el ordenador, los que ofrecen un menor rendimiento son los discos duros.

Como una forma de paliar este problema se desarrolló el estándar RAID (del inglés, *Redundant Array of Independent Disks*), que podríamos traducir al español como conjunto redundante de discos independientes. Se trata de un sistema que almacena los datos utilizando diferentes dispositivos de almacenamiento (discos duros o unidades SSD) para crear un único volumen lógico.

Con RAID, el rendimiento se mejora de dos modos:

- Si los datos buscados están **duplicados** en varios discos, podemos recurrir al que ofrezca mayor rendimiento.

- Si los datos buscados se encuentran **repartidos** entre varios discos, podemos realizar la lectura en paralelo.

Además, se puede incluir redundancia para **mejorar la fiabilidad** del soporte utilizado y compensar el aumento de la probabilidad de fallo, a medida que aumenta el número de dispositivos implicados.

El conjunto de discos podrá administrarse mediante un controlador hardware o mediante un software específico, pero de cualquier forma, el sistema lo verá como un solo volumen. Además, la capacidad del volumen podrá crecer de forma gradual, aumentando el número de dispositivos implicados.

La definición básica de RAID consta de siete niveles, numerados de 0 a 6, a los que más tarde se fueron añadiendo algunos complementarios.

#### RAID 0 (o disk striping)

Distribuye los datos sobre los discos del conjunto de forma que permite la lectura o escritura de bloques en paralelo, aumentando considerablemente el rendimiento.

Los datos se organizan en bandas (strips, en inglés), que pueden corresponder, por ejemplo con bloques físicos o sectores. De este modo, el sistema operativo los maneja como si se tratara de un solo disco.

Las bandas se asignan de forma rotativa entre los discos que forman el conjunto. De este modo, cuando una lectura comprende varias bandas consecutivas, podrán leerse de forma paralela, aumentando considerablemente el rendimiento.

![Diagrama de configuración de RAID-0](ud6/Raid0.png){width=25%}

A diferencia de otros niveles RAID, en este caso no se ofrece redundancia. Esto implica que, si falla un disco, se perderían todos los datos y sólo nos quedaría recurrir a las copias de seguridad. A cambio, ofrece un rendimiento elevado, que aumenta al incrementar el número de discos, y el aprovechamiento de la capacidad de almacenamiento es máxima.

#### RAID 1 (o mirroring)

A diferencia del caso anterior, que no contemplaba la redundancia, aquí, ésta es completa, ya que se obtiene duplicando todo el contenido almacenado. Sería como RAID 0, pero asignando cada banda a dos discos diferentes. De este modo, dispondremos de parejas de discos gemelos.

Evidentemente, su principal inconveniente es el coste.

![Diagrama de configuración de RAID-1](ud6/Raid1.png){width=25%}

Sin embargo, en RAID 1, se pueden realizar lecturas en paralelo de dos bandas diferentes u obtener una banda del disco que ofrezca la mayor velocidad en cada momento (menor tiempo de búsqueda y latencia). Sin embargo, las escrituras serán duplicadas y se realizarán a la velocidad del dispositivo más lento de la pareja.

Además, cuando falla un disco, los datos siguen disponibles y basta con sustituir el disco dañado para que los datos puedan volver a duplicarse y recuperar la funcionalidad del conjunto. Cuando accedemos a los datos con un disco averiado, decimos que funciona en modo reducido.

#### RAID 5

Un RAID 5 (también llamado distribuido con paridad) es una división de datos a nivel de bloques que distribuye la información de paridad entre todos los discos miembros del conjunto. El RAID 5 ha logrado popularidad gracias a su bajo coste de redundancia. Generalmente, el RAID 5 se implementa con soporte hardware para el cálculo de la paridad.

RAID 5 necesitará un mínimo de 3 discos para ser implementado y el máximo teórico es ilimitado.

Su principal ventaja es que se pueden recuperar los datos en caso del fallo de uno de los discos pero el fallo de un segundo disco provoca la pérdida completa de los datos.

![Diagrama de configuración de RAID-5](ud6/Raid5.png){width=45%}

**Cálculo de paridad**

En el álgebra de Boole, existe una operación llamada “*or exclusivo*” (XOR), que significa “*o uno, o el otro pero no ambos*”, esto es:

```
0 XOR 0 = 0
0 XOR 1 = 1
1 XOR 0 = 1
1 XOR 1 = 0
```

El operador XOR es la pieza central que define como se crea la paridad y como se usa en el RAID. Se usa tanto para la protección de los datos, como para recuperar datos que se han perdido.

#### RAID 6

Su estructura es como la de RAID 5, pero añadiendo un control de paridad complementario, que se almacena en la banda correspondiente de un disco independiente. Esto significa que necesitaremos un disco más.

![Diagrama de configuración de RAID-6](ud6/Raid6.png){width=45%}

Su gran ventaja es que se podrán recuperar los datos aunque fallen dos discos al mismo tiempo (es decir, durante el periodo que tardaría en regenerarse el conjunto tras un fallo).

Su mayor inconveniente es que cada escritura conlleva una mayor penalización, ya que deberán calcularse dos bloques de paridad.

#### RAID 5E y RAID 6E

Se trata de los niveles RAID 5 y RAID 6, donde se incluyen discos de reserva. cuando los discos se encuentran conectados y listos para usar se denominan *hot spare*. Si están en modo espera reciben el nombre de *standby spare*.

La única aportación que ofrecen estas configuraciones es la rapidez de respuesta en el caso de que se produzca un fallo.

#### RAID 0+1

Es una anidación de RAID 0 y RAID 1 donde se crea un conjunto de discos entre los que se divide la información y a continuación se crea un espejo del volumen obtenido.

También suele llamarse RAID 01, pero no debe confundirse con RAID 1.

![Diagrama de configuración de RAID 0+1](ud6/Raid0-1.png){width=45%}

#### RAID 1+0

En este caso, la anidación se invierte, creando dos estructuras RAID 1 que, a continuación se unen entre sí creando un volumen RAID 0.

Muchas veces se encuentra como RAID 10.

![Diagrama de configuración de RAID 1+0](ud6/Raid10.png){width=45%}

<!-- NEWPAGE -->

## Configuración de dispositivos de red

Actualmente ordenadores suelen obtener su *dirección IP* desde un servidor *DHCP*.

En redes locales de grandes proporciones, este servidor puede ser uno de los equipos conectados a la red, pero en redes más pequeñas (incluidas las domésticas), es fácil que la tarea la realice el propio router que nos proporciona el acceso a *Internet*.

::: note
DHCP son las siglas de Dynamic Host Configuration Protocol (en español, Protocolo de Configuración Dinámica de Host).
Es un protocolo de red de tipo cliente/servidor1​ mediante el cual un servidor DHCP asigna dinámicamente una dirección IP y otros parámetros de configuración de red a cada dispositivo en una red para que puedan comunicarse con otras redes IP.
:::

En cualquier caso, bien porque no disponemos de *servidor DHCP* en nuestra red o bien porque el ordenador en el que nos encontramos debe ser fácilmente localizable (por ejemplo, cuando comparta espacio de almacenamiento o una impresora), puede ser interesante asignar una *dirección IP fija*, también llamada estàtica, para el equipo. Así, el valor de la *dirección IP* no podrá cambiar con cada arranque.

Vamos a establecer valores fijos para la dirección IP, la máscara de subred, la puerta de enlace e incluso el servidor DNS principal al que debe recurrir el equipo para resolver las direcciones de Internet.

<!-- NEWPAGE -->

La forma más sencilla de resolver esta tarea consiste en hacer clic con el botón derecho del ratón sobre el icono que representa la conexión de red en la *Barra de tareas* y seleccionando "*Configuración de red e Internet*"

![Configuración de red e internet](ud6/net1.png)

Al hacerlo, se abrirá la ventana de *Configuración* mostrando los ajustes de la categoría *Red e Internet*.

![Configuración > Red e Internet](ud6/net2.png)

<!-- NEWPAGE -->

Para configurar los dispositivos de red, debemos elegir la primera opción "*Ethernet*"

![Configuración > Red e Internet > Ethernet](ud6/net3.png){width=85%}

<!-- NEWPAGE -->

Para configurar el dispositivo, debemos pulsar el botón "Editar" del apartado "Asignación de IP"

![Asignación de IP DHCP](ud6/net4.png)

Al cambiar a "Manual" nos permitirá introducir los parámetros de la IP fija.

![Asignación de IP Manual](ud6/net5.png){width=30%}

<!-- NEWPAGE -->

De manera alternativa, podemos la herramienta de "*Conexiones de red*" del "*Panel de control*"

![Conexiones de red](ud6/net6.png)

<!-- NEWPAGE -->

Al abrir las Propiedades de un adaptador de red aparece un diálogo donde podremos configurar todos los elementos del adaptador. Para configurar la dirección IP seleccionaremos "*Protocolo de Internet versión 4(TCP/IPv4)*" y haremos clic en "Propiedades", lo que nos permitirá establecer la configuración de red de forma manual.

![Propiedades del adaptador de red](ud6/net7.png)

Para comprobar el estado del adaptador de red a través de la línea de comandos podemos utilizar el comando `ipconfig`

![ipconfig](ud6/net8.png)

Para obtener información detallada podemos utilizar `ipconfig /all`

![ipconfig /all](ud6/net9.png)

Otro comando muy utilizado es `ping` que comprueba la comunicación con un equipo remoto de la red.

![ping](ud6/net10.png)

<!-- NEWPAGE -->

## Automatización de tareas

Los sistemas operativos suelen incluir herramientas que nos permiten evitar la realización manual de tareas administrativas que se repiten de forma sistemática a lo largo del tiempo (como las copias de seguridad) o que se realizan a horas intempestivas para evitar comprometer el rendimiento del equipo en los momentos en los que más falta haga (como la descarga e instalación de actualizaciones).

La automatización de tareas del sistema nos permite programar la ejecución de programas o secuencias de comandos, para que se produzca a una hora determinada y, en su caso, con una frecuencia en particular.

En el caso de *Windows*, esta situación la cubre el *Programador de tareas*, que nos permite automatizar tareas en función de que se produzcan diferentes circunstancias:

- Cuando llegue un momento particular del futuro.
- Cuando se produzca un determinado evento.
- Con una frecuencia determinada, indicada por el usuario.

Por lo tanto, podemos utilizar las tareas programadas para automatizar ciertas acciones que se repiten a lo largo del tiempo, evitando así molestias y olvidos ocasionales. Por ejemplo, podríamos conseguir que el ordenador se apagara de forma automática, todos los días laborales, sin que tengamos que desplazarnos físicamente hasta donde se encuentra.

También podríamos, por ejemplo, conseguir que el antivirus que tengamos instalado realice un análisis completo del sistema todos los domingos a las 3 de la madrugada, aprovechando el momento de menor carga de trabajo del servidor.

Una de las ventajas del Programador de tareas de *Windows* es que incorpora una biblioteca de tareas programadas y las mantiene organizadas y accesibles, de modo que resulta fácil administrarlas (deshabilitarlas, modificarlas, eliminarlas o ejecutarlas).

En *Windows*, la frecuencia con la que se repita la acción puede ser:

- Diariamente
- Semanalmente
- Mensualmente
- Una vez
- Al iniciarse el equipo (antes de que un usuario inicie sesión)
- Al iniciar la sesión (sólo después de que el usuario actual inicie sesión)
- Cuando se registre un evento específico

Podemos acceder a la herramienta "Programador de tareas" mediante el panel de Administración de equipos.

Para crear una nueva tarea, podemos utilizar el asistente con la opción "Crear tarea básica..." o el modo avanzado con la opción "Crear tarea..."

![Programador de tareas](ud6/task1.png){width=80%}

Al abrir seleccionar "Crear tarea básica..." aparece un diálogo con un asistente. El primer paso es indicar el nombre y una descripción:

![Asistente para crear tarea básica](ud6/task2.png){width=70%}

A continuación pregunta cuál será el evento que desencadenará la ejecución de la tarea.

![Asistente para crear tarea básica - Desencadenante](ud6/task3.png){width=70%}

Para el ejemplo, al seleccionar "Diariamente" como desencadenante, en el siguiente paso solicita la fecha de inicio, la hora a la que se ejecutará y cada cuántos días queremos que se repita la tarea.

![Asistente para crear tarea básica - Diariamente](ud6/task4.png){width=70%}

En el siguiente paso solicita qué tipo de acción queremos que realice la tarea. Por lo general, se inicializará un programa.

![Asistente para crear tarea básica - Acción](ud6/task5.png){width=70%}

En el último paso, indicaremos qué aplicación o script se iniciará. En nuestro caso, llamaremos al comando `shutdown /s /t 0`. Como puede verse, hay que indicar el comando por un lado y los argumentos en otro campo separado.

![Asistente para crear tarea básica - Iniciar un programa](ud6/task6.png){width=70%}

Finalmente, como suele acostumbrar *Windows*, el sistema muestra un resumen para que revisemos todos los parámetros que hemos configurado.

![Asistente para crear tarea básica - Resumen](ud6/task7.png){width=60%}

Al volver a la ventana principal del *Programador de tareas* veremos que se ha creado la nueva tarea. Si abrimos sus propiedades podemos consultar y ajustar los parámetros.

![Propiedades de una tarea programada](ud6/task8.png){width=65%}

