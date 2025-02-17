---
title: "UD9 Explotación SO Linux CLI"
nocite: |
  @iocsom, @somesom, @wikipedia, @archwiki, @tlcl, @ryanstutorials
---

# Explotación SO Linux CLI \faLinux

La interfaz de línea de comandos (CLI) de *Linux* es una interfaz de texto. Conocido a menudo como ***shell***, **terminal**, **consola**, ***prompt***, **línea de comandos**, entre otros nombres, puede parecer complejo y confuso de usar. Sin embargo, el poder y la flexibilidad que ofrece, significa que su uso puede ser esencial cuando se trata de administrar el sistema.

Esta unidad expone la motivación de uso de línea de comandos, se enseñan los conceptos básicos y comandos acompañados de algunos ejemplos. Se asume que el estudiante no tiene conocimientos previos.

## Un poco de historia

Durante los primeros años de la informática, *UNIX* uno de los primeros sistemas operativos, fue diseñado para ejecutarse como un sistema multiusuario en computadoras centrales o *mainframes*, con usuarios que se conectan a él de forma remota a través de **terminales** individuales. Estos terminales eran bastante básicos para los estándares modernos: solo un teclado y una pantalla, sin capacidad para ejecutar programas. En su lugar, simplemente enviarían pulsaciones de teclas al servidor y mostrarían los datos que recibieran en la pantalla. No había ratón, ni gráficos sofisticados, ni siquiera color. Todo se enviaba y recibía como texto. Por lo tanto, cualquier programa que se ejecutara en el *mainframe* tenía que producir texto como salida y aceptar texto como entrada.

![Terminales conectados a un antiguo computador central](ud9/mainframe_terminals.png){width=50%}

En comparación con los gráficos, el texto **consume muy pocos recursos**. Incluso en máquinas de la década de 1970, que ejecutaban cientos de terminales a través de conexiones de red extremadamente lentas, los usuarios podían interactuar con los programas de manera rápida y eficiente. Se crearon comandos muy concisos para reducir la cantidad de pulsaciones de teclas necesarias. Esta **velocidad y eficiencia** es una de las razones por las que esta interfaz de texto todavía se usa ampliamente en la actualidad.

Cuando iniciaban sesión en un *mainframe* de *UNIX* a través de un terminal, los usuarios tenían que realizar tareas administración y gestión de archivos que ahora se realizan con un ratón y un par de ventanas. Las operaciones de crear, renombrar, copiar o mover archivos en el disco las realizaban con una interfaz de texto.

Cada una de estas tareas requería su propio programa o **comando**: uno para cambiar directorios (`cd`), otro para listar su contenido (`ls`), un tercero para renombrar o mover archivos (`mv`), etc. Para coordinar la ejecución de cada uno de estos programas, el usuario se conectaría a un **programa maestro** que luego podría usarse para iniciar cualquiera de los otros. Al envolver los comandos del usuario, este programa "***shell***", podría proporcionar capacidades comunes a cualquiera de ellos, como la capacidad de pasar datos de un comando a otro, o usar caracteres comodín especiales para trabajar con muchos archivos con nombres similares a la vez. Los usuarios podrían incluso escribir código simple, llamado "*script*, que podría usarse para automatizar largas series de comandos de *shell* para facilitar tareas complejas. El programa *shell* original de *UNIX* se es `sh`, pero se ha ampliado y reemplazado a lo largo de los años, por lo que en un sistema *Linux* moderno lo más extendido es el uso de un *shell* llamado `bash`.

*Linux* es una especie de descendiente de *UNIX*. La parte central de *Linux* está diseñada para comportarse de manera similar a un sistema *UNIX*, de modo que la mayoría de los *shells* antiguos y otros programas basados ​​en texto se ejecutan sin problemas. En teoría, incluso podría conectar uno de esos viejos terminales de la década de 1970 en un sistema *Linux* moderno. Pero en la actualidad es mucho más común usar una **terminal de software**: la misma vieja interfaz de texto estilo *UNIX*, pero ejecutándose en una ventana junto con sus programas gráficos.

## Abrir un emulador de terminal

Un **emulador de terminal** es un programa informático que simula el funcionamiento de los antiguos terminales físicos, en las interfaces gráficas también se conocen como *ventana de terminal*. A partir de ahora nos referiremos a los emuladores de terminal como terminales.

Las distribuciones *Linux*, generalmente tendrán un lanzador de terminal ubicado en el mismo lugar que sus otros lanzadores de aplicaciones. Puede estar oculto en un submenú, pero es probable que esté allí en alguna parte. Se puede encontrar la terminal buscando en el lanzador de aplicaciones o buscador escribiendo las primeras letras de "*terminal*", "*consola*", "*prompt*" o "*shell*". Los desarrolladores suelen configurar el lanzador con todos los sinónimos más comunes.

Si no se un lanzador, o desea una forma más rápida de abrir el terminal, la mayoría de sistemas usan el mismo método abreviado de teclado predeterminado para iniciarlo: `Ctrl`+`Alt`+`T`.

Independientemente de cómo se inicie la terminal, debemos terminar con una ventana bastante aburrida con un poco de texto extraño en la parte superior, como la imagen a continuación. Dependiendo del sistema *Linux*, es posible que los colores no sean los mismos y que el texto diga algo diferente, pero el diseño general de una ventana con un área de texto grande, en su mayoría vacía.

![Ventana de terminal](ud9/terminal_emulator.png){width=65%}

El terminal queda a la espera de la entrada de comandos, por ejemplo, podemos escribir el comando `pwd`, en minúsculas, y después pulsar la tecla `Intro` para ejecutarlo.

Aparecerá la ruta de un directorio (`/home/TU_USUARIO`), y después otra copia del *prompt*.

![Ejecución de un comando en la ventana de terminal](ud9/terminal_first_command.png){width=50%}

Debemos entender unos cuantos conceptos básicos antes de comprender qué hace exactamente el comando.

## El *shell* de *Linux*

Los programas *shell* (de traducción caparazón o cáscara) son intérpretes de comandos que facilitan el control del sistema operativo. No son el sistema operativo en sí, sino que forman una capa que comunica el núcleo con el usuario interactivo. Al entrar al sistema, cada usuario corre un *shell* particular e independiente de cualquier otro usuario que simultáneamente esté utilizando el sistema. Esto se aprecia por la aparición de un carácter tal como `$` o `#` o `>` (existen otros, de hecho ésto suele ser configurable) que dependerán del tipo de *shell* que hemos lanzado. Los *shells* son útiles para ejecutar uno o varios programas y en ellos se aprecia la  multitarea real del sistema operativo. Entre los *shells* más populares encontramos:

- ***Bourne Shell***: fue escrito por *Stephen Bourne* y es el más básico y antiguo. Se invoca a través del comando **`sh`** , tras lo que debe de aparecer el *prompt* del sistema `$`.
- ***C Shell***: Posterior al *Bourne Shell* y orientado a los programadores de *C*. Se ejecuta escribiendo el comando **`csh`**, con lo que aparece el carácter `%` o `>`. Una versión mejorada de este es el `tcsh` que permite completar nombres de ficheros y directorios usando el tabulador y la edición de la línea de comandos. Este último suele estar disponible en todas las distribuciones de *Linux*.
- ***Korn Shell***: Es una ampliación del *Bourne Shell*. Se lanza ejecutando el comando **`ksh`**, con lo que aparece el prompt `$`.
- ***GNU Bourne-Again SHell*** (***bash***): Como su nombre da a entender se trata de una extensión del *Bourne Shell* y añade características tales como completar partes de nombres de ficheros (al igual que `tcsh`) y darnos listas de ficheros que empiezan por una determinada secuencia de caracteres sin mas que presionar la tecla de tabulación. Se invoca mediante el comando **`bash`**.

Para comprobar la lista de intérpretes disponibles en el sistema podemos ejecutar `cat /etc/shells`

```bash
$ cat /etc/shells 

# /etc/shells: valid login shells
/bin/sh
/bin/bash
/usr/bin/bash
/bin/rbash
/usr/bin/rbash
/bin/dash
/usr/bin/dash
```

Para conocer el shell configurado por defecto en el sistema podemos ejecutar `echo $SHELL`

```bash
$ echo $SHELL
/bin/bash
```

Aunque la variable `$SHELL` no nos dice qué intérprete estamos utilizando actualmente, para saber qué *shell* estamos utilizando podemos utilizar `ps -p $$`

```sh
user@DEB11:~$ echo $SHELL
/bin/bash

user@DEB11:~$ ps -p $$
    PID TTY          TIME CMD
   9502 pts/0    00:00:00 bash
# Comprobamos que estamos utilizando bash

user@DEB11:~$ sh
# Cambiamos a sh

$ echo $SHELL
/bin/bash
# La variable $SHELL no ha cambiado

$ ps -p $$
    PID TTY          TIME CMD
   9535 pts/0    00:00:00 sh
# Comprobamos que estamos utilizando sh
```

### Prompt

Al abrir el emulador de terminal, una línea de texto aparece delante del cursor (`user@host:~$ _`) se conoce con el nombre de **prompt** e indica que el terminal está lito para aceptar comandos. El prompt es configurable, pero muchos sistemas utilizan por defecto el formato visto en el ejemplo:

  - Nombre de usuario (`user`). Usuario con el que estamos trabajando actualmente.
  - Nombre del equipo (`host`). El nombre del equipo al que se ha conectado el terminal, parece algo obvio, pero si nos conectamos a otro ordenador de forma remota, puede que nos olvidemos dónde estamos trabajando, de esta forma podemos verlo de manera rápida.
  - Arroba (`@`) En inglés se lee como "*at*", que significa "en", puede que te suene de las cuentas de correo electrónico. Un ejemplo, si tenemos "`admin@PC01`" en inglés se leería "*admin at PC01*" lo que significa que el usuario "admin" esta conectado al equipo "PC01".
  - Dos puntos (`:`). Separador el nombre de *host* del directorio de trabajo.
  - Directorio de trabajo actual. *En el ejemplo, `~` es una abreviatura del directorio `home` de usuario*
  - Símbolo de dólar (`$`)
  - Cursor. Indica donde podemos introducir nuevo texto, puede que sea una barra parpadeante, un bloque cuadrado, un guion bajo.

### Comandos

Un comando es un **programa con una funcionalidad determinada**. Al escribir una entrada de texto en el prompt, estamos solicitando la ejecución de una orden al terminal. Tanto si tiene éxito como si no, cuando termine la ejecución del comando, el terminal volverá a mostrar el prompt y quedará a la espera de un nuevo comando. 

Los comandos pueden ir acompañados de **opciones** y **argumentos** que modifican su comportamiento. Por ejemplo en la orden `ls -a /usr`, `ls` es el **comando** encargado de mostrar el contenido de un directorio, `-l` es una **opción** que indica el formato de salida y `/usr` es un **argumento** que indica el directorio qué queremos mostrar.

## Navegación básica

### Organización del sistema de archivos

Al igual que *Windows*, los archivos en un sistema *Linux* se organizan en lo que se denomina una estructura de directorios jerárquica. Esto significa que están organizados en un patrón de directorios en forma de árbol, que pueden contener archivos y subdirectorios. El primer directorio del sistema de archivos se denomina **directorio raíz**. El directorio raíz contiene archivos y subdirectorios, que contienen más archivos y subdirectorios y así sucesivamente.

La mayoría de los entornos gráficos incluyen un programa gestor de archivos que se usa para ver y manipular el contenido del sistema de archivos.

Una diferencia importante entre *Windows* y los sistemas operativos *Linux*, es que *Linux* no emplea el concepto de letras de unidad. Mientras que las letras de unidad de *Windows* dividen el sistema de archivos en una serie de árboles diferentes (uno para cada volumen), *Linux* siempre tiene un solo árbol. Diferentes dispositivos de almacenamiento pueden ser diferentes ramas del árbol, pero siempre hay un solo árbol.

### Comando '**pwd**'

Dado que la interfaz de línea de comandos no puede proporcionar imágenes de la estructura del sistema de archivos, debemos tener una forma diferente de representarlo. Para hacer esto, piense en el árbol del sistema de archivos como un laberinto y que estamos dentro de él. En un momento dado, estamos ubicados en un único directorio. Dentro de ese directorio, podemos ver sus archivos, la ruta a su directorio padre y las rutas a los subdirectorios del directorio en el que nos encontramos.

El directorio en el que nos encontramos se llama **directorio de trabajo**. Para **mostrar el nombre del directorio de trabajo actual**, usamos el comando **`pwd`**.

```sh
user@DEB11:~$ pwd
/home/user
```

Cuando iniciamos sesión por primera vez en el sistema, el directorio de trabajo se establece en nuestro directorio de inicio. Aquí es donde ponemos nuestros archivos. En la mayoría de los sistemas, el directorio de inicio se llamará `/home/nombre_de_usuario`, (aunque podría se cambiado por el administrador).

Para listar los archivos en el directorio de trabajo, usamos el comando **`ls`**.

```sh
user@DEB11:~$ ls
Descargas   Escritorio  Plantillas  Vídeos
Documentos  Imágenes    Música  Público
```

### Comando '**cd**'

Para **cambiar el directorio de trabajo actual** usamos el comando **`cd`**. Para ello escribimos `cd` seguido de la **ruta del directorio de trabajo deseado**. Un nombre de ruta es la ruta que tomamos a lo largo de las ramas del árbol para llegar al directorio que queremos. Los nombres de ruta se pueden especificar de dos maneras diferentes; rutas de acceso **absolutas** o rutas de acceso **relativas**. Veamos primero con nombres de ruta absolutos.

Un **nombre de ruta absoluto** comienza con el directorio raíz y sigue el árbol rama por rama hasta que se completa la ruta al directorio o archivo deseado. Por ejemplo, hay un directorio en su sistema en el que se instalan la mayoría de los programas. El nombre de ruta del directorio es `/usr/bin`. Esto significa que desde el directorio raíz (representado por la barra diagonal `/` inicial en el nombre de la ruta) hay un directorio llamado "`usr`" que contiene un directorio llamado "`bin`".

```sh
user@DEB11:~$ pwd
/home/user
user@DEB11:~$ cd /usr/bin
user@DEB11:/usr/bin$ pwd
/usr/bin
user@DEB11:/usr/bin$ ls
'['                                     mkisofs
 411toppm                               mk_modmap
 7z                                     mknod
 7za                                    mktemp
 7zr                                    mkzftree
 aa-enabled                             mm2gv
 aa-exec                                mmcli
 accountwizard                          moc
 aconnect                               moggsplit
 acyclic                                mogrify
 add-apt-repository                     mogrify-im6
 addpart                                mogrify-im6.q16
 addr2line                              monitor-sensor
 akonadi_agent_launcher                 montage
 akonadi_agent_server                   montage-im6
...
```

Podemos ver que hemos cambiado el directorio de trabajo actual a `/usr/bin` y que está lleno de archivos. Observar cómo ha cambiado el *prompt* `user@DEB11:/usr/bin$`

Donde un nombre de ruta absoluto comienza desde el directorio raíz y conduce a su destino, un nombre de ruta relativo comienza desde el directorio de trabajo actual. Para ello, utiliza un par de notaciones especiales para representar posiciones relativas en el árbol del sistema de archivos. Estas notaciones especiales son "**`.`**" (punto) y "**`..`**" (punto punto).

El "**`.`**" (punto) se refiere al directorio de trabajo actual y la notación "**`..`**" (punto punto) se refiere al directorio previo o padre. Así es como funciona. Cambiemos el directorio de trabajo a `/usr/bin` nuevamente:

```sh
user@DEB11:~$ cd /usr/bin
user@DEB11:/usr/bin$ pwd
/usr/bin
```

Bien, ahora digamos que queremos cambiar el directorio de trabajo al padre de `/usr/bin`, que es `/usr`. Podríamos hacerlo de dos maneras diferentes. Primero, con una **ruta absoluta**:

```sh
user@DEB11:/usr/bin$ cd /usr
user@DEB11:/usr$ pwd
/usr
```

O con una **ruta relativa** al directorio de trabajo actual:

```sh
user@DEB11:/usr/bin$ cd ..
user@DEB11:/usr$ pwd
/usr
```

Dos métodos diferentes con idénticos resultados. ¿Cuál deberíamos usar? El que consideremos que requiere menos pulsaciones.

Asimismo, podemos cambiar el directorio de trabajo de `/usr` a `/usr/bin` de dos formas diferentes. Primero usando una **ruta absoluta**:

```sh
user@DEB11:/usr$ cd /usr/bin
user@DEB11:/usr/bin$ pwd
/usr/bin
```

O con la **ruta relativa** al directorio de trabajo actual:

```sh
user@DEB11:/usr$ cd ./bin
user@DEB11:/usr/bin$ pwd
/usr/bin
```

En la mayoría de los casos, **podemos omitir el "`./`"**, está implícito:

```sh
user@DEB11:/usr$ cd bin
user@DEB11:/usr/bin$ pwd
/usr/bin
```

En general, si no especificamos un nombre de ruta, se asumirá el directorio de trabajo en que nos encontramos. Aunque hay excepciones que veremos más adelante.

### Algunos atajos

Si escribimos **`cd`** sin argumentos, `cd` cambiará a nuestro directorio de usuario `/home/user_name`.

Un atajo relacionado es escribir `cd ~user_name`, en este caso, `cd` cambiará el directorio de trabajo al directorio de inicio del usuario especificado.

Escribir **`cd -`** cambia el directorio de trabajo al anterior.


### La importancia de las MAYÚSCULAS y minúsculas

Se debe tener cuidado con el uso de mayúsculas y minúsculas al escribir un comando. Escribir `PWD` producirá un error, que si no prestamos atención podemos pensar que se ha ejecutado correctamente, por eso es importante leer la salida del comando.

![Ejemplo de error típico de "orden no encontrada" al confundir mayúsculas y minúsculas](ud9/terminal_command_not_found.png){width=50%}

Esto también se aplica a los nombre de ficheros y directorios. Por ejemplo, "`Archivo1`" y "`archivo1`" serían dos archivos diferentes.

## Mirando alrededor

Ahora que sabemos cómo pasar de un directorio de trabajo a otro, podemos hacer un recorrido por el sistema *Linux*. A continuación debemos conocer algunas herramientas que nos serán útiles para conocer los contenidos de los directorios.

- `ls` (lista de archivos y directorios)
- `cat` (muestra el contenido de un archivo de texto)
- `less` (navegar por el contenido de archivos de texto)
- `file` (determinar el contenido de un archivo)

### Comando '**ls**'

El comando **`ls`** se usa para **listar el contenido de un directorio**. Es probablemente el comando de *Linux* más utilizado. Se puede utilizar de varias maneras diferentes. Aquí hay unos ejemplos:

Ejemplos del comando `ls`:

Comando | Resultado
-|---
`ls` | Lista los archivos en el directorio de trabajo
`ls /bin` |  Lista los archivos en el directorio /bin (o cualquier otro directorio que deseemos especificar)
`ls -l` | Lista los archivos en el directorio de trabajo en formato largo
`ls -l /etc /bin` | Lista los archivos en el directorio `/bin` y el directorio `/etc` en formato largo
`ls -la ..` | Lista todos los archivos, incluyendo archivos ocultos, del directorio padre en formato largo

Estos ejemplos también señalan un concepto importante acerca de los comandos. La mayoría de los comandos funcionan así:

```
comando -opciones argumentos
```

Donde *comando* es el nombre del comando, *-opciones* es uno o más ajustes al comportamiento del comando y *argumentos* es una o más "cosas" sobre las que opera el comando.

En el caso de `ls`, vemos que `ls` es el nombre del comando, y que puede tener una o más opciones, como `-a` y `-l`, y puede operar sobre uno o más archivos o directorios.

<!-- NEWPAGE -->

Si usamos la opción `-l` con `ls`, obtendrá una lista de archivos que contiene una gran cantidad de información sobre los archivos que se muestran. Aquí hay un ejemplo:

```sh
drwxr-xr-x  2  root     root       4096   feb  1 21:58 selinux
-rw-r--r--  1  root     root      10593   ene 30  2021 sensors3.conf
drwxr-xr-x  2  root     root       4096   feb  1 22:07 sensors.d
-rw-r--r--  1  root     root      12813   mar 27  2021 services
drwxr-xr-x  3  root     root       4096   feb 13 08:00 sgml
-rw-r-----  1  root     shadow     1268   feb 13 08:00 shadow
-rw-r--r--  1  root     root        116   feb  1 21:58 shells

----------     -------  -------  -------- ------------ -------------
    |             |        |         |         |             |
    |             |        |         |         |           Nombre
    |             |        |         |         |
    |             |        |         |         +---  Modificación
    |             |        |         |
    |             |        |         +------------- Tamaño (en bytes)
    |             |        |
    |             |        +----------------------- Grupo
    |             |
    |             +-------------------------------- Propietario
    |
    +---------------------------------------------- Permisos
```

- **Nombre**. El nombre del archivo o directorio.
- **Modificación**. La última vez que se modificó el archivo. Si la última modificación ocurrió hace más de seis meses, se muestran la fecha y el año. De lo contrario, se muestra la hora del día.
- **Tamaño**. El tamaño del archivo en bytes.
- **Grupo**. El nombre del grupo que tiene permisos de archivo además del propietario del archivo.
- **Propietario**. El nombre del usuario propietario del archivo.
- **Permisos**. Una representación de los permisos de acceso del archivo. El primer carácter es el tipo de archivo. Un "`-`" indica un archivo regular (ordinario). Una "`d`" indica un directorio. El segundo conjunto de tres caracteres representa los derechos de lectura, escritura y ejecución del propietario del archivo. Los tres siguientes representan los derechos del grupo del archivo y los tres finales representan los derechos otorgados a todos los demás. Lo estudiaremos más adelante.

### Comando '**cat**'

**`cat`** es un programa que nos permite **visualizar archivos de texto**. Esto es muy útil ya que muchos de los archivos utilizados para controlar y configurar *Linux* son legibles por humanos.

:::note
**¿Qué es "texto"?**

Hay muchas maneras de representar la información en una computadora. Todos los métodos implican definir una relación entre la información y algunos números que se utilizarán para representarla. Las computadoras, después de todo, solo entienden números y todos los datos se convierten en representación numérica.

Algunos de estos sistemas de representación son muy complejos (como los archivos multimedia comprimidos), mientras que otros son bastante simples. Uno de los primeros y más simples se llama texto ASCII. ASCII (pronunciado [áski]) es la abreviatura de *American Standard Code for Information Interchange*. Este es un esquema de codificación simple que se utilizó por primera vez en máquinas de teletipo para asignar caracteres del teclado a números.

El texto es un simple mapeo uno a uno de caracteres a números. Es muy compacto. Cincuenta caracteres de texto se traducen en cincuenta bytes de datos. A lo largo de un sistema *Linux*, muchos archivos se almacenan en formato de texto y hay muchas herramientas de *Linux* que funcionan con archivos de texto. Incluso los sistemas *Windows* reconocen la importancia de este formato. El conocido programa `NOTEPAD.EXE` es un editor de archivos de texto ASCII sin formato.
:::

<!-- NEWPAGE -->

Fragmento de la tabla ASCII representada de forma compacta en formato hexadecimal y decimal. Más información con el comando `man ASCII`:

```
          2 3 4 5 6 7       30 40 50 60 70 80 90 100 110 120
        -------------      ---------------------------------
       0:   0 @ P ` p     0:    (  2  <  F  P  Z  d   n   x
       1: ! 1 A Q a q     1:    )  3  =  G  Q  [  e   o   y
       2: " 2 B R b r     2:    *  4  >  H  R  \  f   p   z
       3: # 3 C S c s     3: !  +  5  ?  I  S  ]  g   q   {
       4: $ 4 D T d t     4: "  ,  6  @  J  T  ^  h   r   |
       5: % 5 E U e u     5: #  -  7  A  K  U  _  i   s   }
       6: & 6 F V f v     6: $  .  8  B  L  V  `  j   t   ~
       7: ' 7 G W g w     7: %  /  9  C  M  W  a  k   u  DEL
       8: ( 8 H X h x     8: &  0  :  D  N  X  b  l   v
       9: ) 9 I Y i y     9: '  1  ;  E  O  Y  c  m   w
       A: * : J Z j z
       B: + ; K [ k {
       C: , < L \ l |
       D: - = M ] m }
       E: . > N ^ n ~
       F: / ? O _ o DEL
```

El programa `cat` se invoca simplemente escribiendo:

```sh
cat archivo_de_texto
```

Esto mostrará el archivo.


### Comando '**less**'

**`less`** su propósito es **mostrar el contenido de archivos de texto**, como `cat`, con la diferencia que nos **permite interactuar**.

Una vez iniciado, `less` mostrará el archivo de texto de forma paginada. Podemos usar las teclas `Av Pág` y `Re Pág` para movernos por el archivo de texto. Para salir tecleamos "`q`". Aquí hay algunos comandos que menos aceptarán:

Comandos de teclado para el programa `less`:

Comando | Acción
-|---
`Re Pág` o `b` | Desplazarse hacia atrás una página
`Av Pág` o `espacio` | Desplazarse una página hacia adelante
`G` | Ir al final del archivo de texto
`g` | Ir al principio del archivo de texto
`/texto_a_buscar` | Buscar en el archivo de una aparición de los caracteres especificados
`n` | Repetir la última búsqueda hacia adelante
`N` | Repetir la última búsqueda hacia atrás
`h` | Mostrar una lista completa menos comandos y opciones
`q` | Salir de less


### Comando '**file**'

Mientras deambulamos por nuestro sistema *Linux*, es útil **determinar qué tipo de datos contiene un archivo** antes de intentar verlo. Aquí es donde entra en juego el comando de `file`, examinará un archivo y nos dirá qué tipo de archivo es.

Para usar el programa de archivos, simplemente escribimos:

El programa de archivos puede reconocer la mayoría de los tipos de archivos, como:

Varios tipos de archivos:

Tipo de archivo | Descripción | ¿Visible como texto?
--|----|-
ASCII Text | Texto ASCII | sí
Bourne-Again shell script | Un *script* `bash` | sí
ELF 64-bit LSB executable | Un programa binario ejecutable | no
ELF 64-bit LSB shared object | Una biblioteca compartida | no
GNU tar archive | Un archivo de almacenamiento en cinta. Una forma común de almacenar grupos de archivos. | no
gzip compressed data | Un archivo comprimido con `gzip` | no
HTML document text | Una página web | sí
JPEG image data | Una imagen *JPEG* comprimida | no
PostScript document text | Un archivo PostScript | sí
Zip archive data | Un archivo comprimido con `zip` | no

Si bien puede parecer que la mayoría de los archivos no se pueden ver como texto, un número sorprendente puede serlo. Esto es así en el caso de los archivos de configuración importantes. Veremos que muchas funciones del sistema operativo están controladas por archivos de configuración de texto y *scripts* de *shell*.

<!-- NEWPAGE -->

## Manipular archivos y directorios

Para introducir la manipulación básica de archivos y directorios veremos los siguientes comandos:

- **`cp`** - copiar archivos y directorios
- **`mv`** - mover o renombrar archivos y directorios
- **`rm`** - eliminar archivos y directorios
- **`mkdir`** - crear directorios

Estos cuatro comandos se encuentran entre los más utilizados de *Linux*. Son los comandos básicos para manipular tanto archivos como directorios.

Algunas de las tareas realizadas por estos comandos son más fáciles de hacer con un gestor gráfico de archivos. Con un gestor de archivos, puedes arrastrar y soltar un archivo de un directorio a otro, cortar y pegar archivos, borrar archivos, etc. Entonces, ¿por qué utilizar estos viejos programas de línea de comandos?

La respuesta es potencia y flexibilidad. Aunque es fácil realizar manipulaciones sencillas de archivos con un gestor de archivos gráfico, las tareas complicadas pueden ser más fáciles con los programas de línea de comandos. Por ejemplo, *¿cómo copiar todos los archivos HTML de un directorio a otro, pero sólo copiar los archivos que no existieran en el directorio de destino o que fueran más recientes que las versiones del directorio de destino?* Bastante difícil con un gestor de archivos. Bastante fácil con la línea de comandos:

```sh
$ cp -u *.html destino
```

### Comodines

Antes de empezar con nuestros comandos, veremos primero una característica del *shell* que hace que estos comandos sean tan potentes. Dado que el *shell* utiliza mucho los nombres de archivo, proporciona caracteres especiales para ayudarle a especificar rápidamente grupos de nombres de archivo. Estos caracteres especiales se denominan comodines. Los caracteres comodín permiten seleccionar nombres de archivo basándose en patrones de caracteres. En la tabla siguiente se enumeran los caracteres comodín y lo que seleccionan:

**Comodín** | **Significado**
--|--------
**`*`** | Coincide con cualquier conjunto de caracteres
**`?`** | Coincide con cualquier carácter
**`[caracteres]`** | Coincide con cualquier carácter que sea miembro del conjunto caracteres. El conjunto de caracteres también puede expresarse como una clase de caracteres *POSIX*, como una de las siguientes:
 | | **`[:alnum:]`** Caracteres alfanuméricos, igual que `[a-zA-Z0-9]`
 | | **`[:alpha:]`** Caracteres alfabéticos, igual que `[a-zA-Z]`
 | | **`[:digit:]`** Caracteres numéricos, igual que `[0-9]`
 | | **`[:upper:]`** Caracteres alfabéticos en mayúsculas, igual que `[A-Z]`
 | | **`[:lower:]`** Caracteres alfabéticos en minúscula, igual que `[a-z]`
**`[!caracteres]`** | Coincide con cualquier carácter que no pertenezca al conjunto caracteres
Table: Resumen de comodines y sus significados

Utilizando comodines, es posible construir criterios de selección muy sofisticados para los nombres de archivo. He aquí algunos ejemplos de patrones y lo que coinciden:

- **`*`** Todos los nombres de archivo
- **`g*`** Todos los nombres de archivo que empiecen por el carácter "`g`"
- **`b*.txt`** Todos los nombres de archivo que comienzan con el carácter "b" y terminan con los caracteres "`.txt`"
- **`Datos???`** Cualquier nombre de archivo que empiece por los caracteres "`Datos`" seguidos de exactamente 3 caracteres más
- **`[abc]*`** Cualquier nombre de archivo que empiece por "`a`" o "`b`" o "`c`" seguido de cualquier otro carácter
- **`[[:upper:]]*`** Cualquier nombre de archivo que empiece por una letra mayúscula. Este es un ejemplo de una clase de caracteres.
- **`BACKUP[[:digit:]][[:digit:]]`** Otro ejemplo de clases de caracteres. Este patrón coincide con cualquier nombre de archivo que empiece por los caracteres "`BACKUP`" seguido de exactamente dos números.
- **`*[![:lower:]]`** Cualquier nombre de archivo que no termine con una letra minúscula.

Podemos utilizar comodines con cualquier comando que acepte argumentos de nombre de archivo.

### Comando '**cp**'

El programa `cp` copia archivos y directorios.

La forma más básica de uso es copiar un archivo.

```sh
$ cp archio_original archivo_copia
```

También puede usarse para copiar múltiples ficheros (y/o directorios) a otro directorio:

```sh
$ cp archivo... directorio_destino
```

**Acerca de la notación:** En la documentación de un comando, `...` significa que un elemento puede estar repetido una o más veces.

***Ejemplos de uso del comando `cp`:***

- `cp archivo1 archivo2` Copia los contenidos del `archivo1` en `archivo2`. Si `archivo2` no existe, lo crea, de lo contrario, `archivo2` es sobrescrito sin avisar.
- `cp -i archivo1 archivo2` Como el ejemplo anterior, aunque la opción `-i` (interactivo) indica que si `archivo2` existe, se solicita al usuario confirmación antes de sobrescribir.
- `cp archivo1 dir1` Copia los contenidos de `archivo1` en un nuevo archivo llamado `archivo1` dentro del directorio `dir1`
- `cp -R dir1 dir2` Copia los contenidos del directorio `dir1` en el directorio `dir2`. Si `dir2` no existe, se crea. Si `dir2` existe, crea un directorio llamado `dir1` dentro de `dir2`.


### Comando '**mv**'

El comando `mv` mueve o renombra archivos y directorios dependiendo de cómo se use. También puede mover ono o más archivos a un directorio diferente, o cambiar el nombre a un archivo o directorio.

Para renombrar un archivo utilizamos:

```sh
$ mv nombre_original nuevo_nombre
```

Para mover archivos (y/o directorios) a un directorios diferente:

```sh
$ mv archivo... directorio_destino
```

***Ejemplos de uso del comando `mv`:***

- `mv archivo1 archivo2` Si `archivo2` no existe, entonces `archivo1` es renombrado a `archivo2`. Si `archivo2` existe, sus contenidos con reemplazados sin avisar.
- mv -i archivo1 archivo2 Como el ejemplo anterior, aunque la opción `-i` (interactivo), si `archivo2` existe pide confirmación al usuario antes de sobrescribir sus contenidos.
- `mv archivo1 archivo2 dir1` Los archivos `archivo1` y `archivo2` se mueven al directorio `dir1`
- `mv dir1 dir2` Si `dir2` no existe, `dir1` se renombra a `dir2`. Si `dir2` existe, el directorio `dir1` se mueve dentro de `dir2`.

### Comando '**rm**'

El comando `rm` (*remove*) borra archivos y directorios.

```sh
$ rm archivo...
```

Usando la opción `-r` elimina directorios y sus contenidos de forma recursiva.

```sh
$ rm -r directorio...
```

***Ejemplos de uso del comando `rm`:***

- `rm archivo1 archivo2` Elimina archivo1 y archivo2
- `rm -i archivo1 archivo2` Como el ejemplo anterior, aunque la opción `-i` (interactivo) pide confirmación al usuario para cada archivo a borrar.
- `rm -r dir1 dir2` Los directorios `dir1` y `dir2` son borrados junto con todos sus contenidos.

:::warning
**Cuidado con `rm`**

Lo que borremos mediante el comando `rm` no se puede recuperar, no pasa por la papelera. Si no tenemos cuidado podemos causar daños en el sistema, en especial cuando utilizamos comodines.

**Antes de utilizar `rm` con comodines es aconsejable**: construir el comando utilizando `ls` para ver qué archivos se seleccionan con los comodines. Después de probar que los archivos con correctos podemos sustituir `ls` por `rm`.
:::

### Comando '**mkdir**'

El comando `mkdir` se utiliza para crear directorios:

```sh
$ mkdir directorio...
```

### Utilizando los comandos con comodines

Los comandos que hemos visto pueden utilizar múltiples archivos y directorios como argumentos, podemos usar comodines para especificarlos.

***Ejemplos de uso de comandos con comodines:***

- `cp *.txt Documentos` Copia todos los archivos con extensión `.txt` del directorio actual a un directorio existente llamado `Documentos`
- `mv dir1 ../*.bak dir2` Mueve el subdirectorio `dir1` y todos los archivos con extensión `.bak` del directorio padre a un directorio llamado `dir2`
- `rm *~` Borra todos los archivos del directorio actual que terminen con el carácter "`~`". Algunas aplicaciones crean archivos de backup utilizando este esquema, con este comando podemos limpiar las copias.

## Identificando comandos

Existen cuatro tipos de comandos:

1. **Programa ejecutable** como los archivos de /usr/bin. En esta categoría, los programas pueden ser *binarios compilados* o programas escritos en *lenguajes interpretados de script*.
2. **Comando integrado dentro del mismo *shell***. Bash incluye una serie de comandos internos llamados *shell builtins*, como por ejemplo el comando `cd`.
3. **Función *shell***. Estos son pequeños scripts incorporados en un entorno. Se estudian en la programación de shell scripts.
4. **Alias**. Comandos que podemos definir, compuestos de otros comandos.

### Comando '**type**'

El comando `type` está integrado en *shell* y muestra el tipo de un comandos determinado.

```sh
$ type comando
```

Donde '*comando*' es el nombre del comandos que queremos examinar.

***Algunos ejemplos de uso del comando `type`:***

```sh
$ type ls
ls es un alias de 'ls --color=auto'

$ type cd
cd es una orden interna del intérprete de ordenes

$ type mv
mv is /usr/bin/mv
```

Aquí vemos los resultados para tres comandos diferentes. Se observa que el comando `ls` es en realidad un ***alias*** del comando `ls` con la opción "`-- color=auto`" añadida, lo que permite colorear la salida del comando sin tener que escribir la opción cada vez.

### Comando '**which**'

A veces hay más de una versión de un programa ejecutable instalado en un sistema. Aunque esto no es muy común en sistemas de escritorio, no es inusual en grandes servidores. Para determinar la ubicación exacta de un determinado ejecutable, se utiliza el comando `which`:

```sh
$ which ls
/usr/bin/ls
```

`which` sólo funciona para programas ejecutables, no para *builtins* ni alias que sean sustitutos de programas ejecutables reales.

### Comando '**help**'

`bash` dispone de una ayuda integrada para cada uno de los `shell builtins`. Para utilizarla, escriba "`help`" seguido del nombre del comando. Opcionalmente, podemos añadir la opción `-m` para cambiar el formato de la salida. Por ejemplo:

```sh
$ help -m cd
NAME
    cd - Modifica el directorio de trabajo del shell.

SYNOPSIS
    cd [-L|[-P [-e]]] [dir]

DESCRIPTION
    Modifica el directorio de trabajo del shell.
    
    Modifica el directorio actual a DIR.  DIR por defecto es el valor de la
    variable de shell HOME.
    
    La variable CDPATH define la ruta de búsqueda para el directorio que
    contiene DIR.  Los nombres alternativos de directorio en CDPATH se
    separan con dos puntos (:).  Un nombre de directorio nulo es igual que
    el directorio actual.  Si DIR comienza con una barra inclinada (/),
    entonces no se usa CDPATH.
    
    Si no se encuentra el directorio, y la opción del shell 'cdable_vars'
    está activa, entonces se trata la palabra como un nombre de variable.
    Si esa variable tiene un valor, se utiliza su valor para DIR.
    
    Opciones:
      -L        fuerza a seguir los enlaces simbólicos: resuelve los enlaces
                simbólicos en DIR después de procesar las instancias de '..'
      -P        usa la estructura física de directorios sin seguir los enlaces
                simbólicos: resuelve los enlaces simbólicos en DIR antes de procesar
                las instancias de '..'
      -e        si se da la opción -P y el directorio actual de trabajo no se
                puede determinar con éxito, termina con un estado diferente de cero.
    
    La acción por defecto es seguir los enlaces simbólicos, como si se
    especificara '-L'.
    '..' se procesa quitando la componente del nombre de la ruta inmediatamente
    anterior hasta una barra inclinada o el comienzo de DIR.
    
    Estado de Salida:
    Devuelve 0 si se cambia el directorio, y si $PWD está definido como
    correcto cuando se emplee -P; de otra forma es diferente a cero.

SEE ALSO
    bash(1)

IMPLEMENTATION
    GNU bash, versión 5.1.16(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2020 Free Software Foundation, Inc.
    Licencia GPLv3+: GPL de GNU versión 3 o posterior <http://gnu.org/licenses/gpl.html>
```

*Sobre la notación*: Cuando aparecen corchetes en la descripción de la sintaxis de un comando, indican elementos opcionales. Un carácter de barra vertical indica elementos mutuamente excluyentes. En el caso del comando `cd` anterior:

```txt
cd [-L|[-P [-e]]] [dir]
```

Esta notación indica que la orden `cd` puede ir seguida opcionalmente por `-L` o `-P` o `-Pe` y, además, opcionalmente por el argumento `dir`.

### Opción '**- -help**'

Muchos programas ejecutables admiten una opción "`--help`" que muestra una descripción de la sintaxis y las opciones del comando. Por ejemplo:

```sh
$ mkdir --help
Modo de empleo: mkdir [OPCIÓN]... DIRECTORIO...
Crea los DIRECTORIO(s), si no existen ya.

Los argumentos obligatorios para las opciones largas son también obligatorios
para las opciones cortas.
  -m, --mode=MODE   establece los permisos (como en chmod), en lugar
                    de  a=rwx - umask
  -p, --parents     no hay error si existen, crea los directorios padres en
                    caso necesario
  -v, --verbose     muestra un mensaje por cada directorio creado
  -Z                   establece el contexto de seguridad SELinux de cada
                         directorio creado al tipo predeterminado
      --context[=CTX]  como -Z, o si se especifica CTX entonces establece el
                         contexto de seguridad SELinux o SMACK a CTX
      --help     muestra esta ayuda y finaliza
      --version  informa de la versión y finaliza

ayuda en línea sobre GNU coreutils: <https://www.gnu.org/software/coreutils/>
Report any translation bugs to <https://translationproject.org/team/>
Full documentation <https://www.gnu.org/software/coreutils/mkdir>
or available locally via: info '(coreutils) mkdir invocation'
```

Algunos programas no admiten la opción "`--help`", pero al intentar ejecutarlo, a menudo, da lugar a un mensaje de error que revelará información de uso similar.

### Comando '**man**'

La mayoría de los programas ejecutables destinados a la línea de comandos incluyen una documentación formal denominada **manual** o **página *man***. Para verlas se utiliza un programa especial de paginación llamado `man`. Se utiliza así:

```sh
$ man ls
```

Mostrará la siguiente información:

```txt
LS(1)                        Órdenes de usuario                       LS(1)

NOMBRE
       ls - lista el contenido de un directorio

SINOPSIS
       ls [OPCIÓN]... [ARCHIVO]...

DESCRIPCIÓN
       Por  defecto,  muestra  información de los ARCHIVO (pueden ser uno o
       varios) del directorio actual. Ordena alfabéticamente la  salida  si
       no se especifica ninguna de las opciones -cftuvSUX ni --sort.

       Los  argumentos  obligatorios  para  las opciones largas son también
       obligatorios para las opciones cortas.

       -a, --all
              no oculta las entradas que comienzan con .

       -A, --almost-all
              no muestra las entradas implícitas . ni ..
...
```


- **NOMBRE**: Muestra el comando seguido de una descripción de una breve de su función.
- **SINOPSIS**. Visión general de la **sintaxis**, es decir, cómo se debe ejecutar el comando.
- **DESCRIPCIÓN**: Descripción más detallada del comando.
  
  Debajo de la descripción siempre habrá una lista de todas las **opciones** de línea de comandos que están disponibles para el comando.

En la mayoría de los sistemas *Linux*, `man` utiliza `less` para mostrar la página del manual, por lo que todos atajos de teclados de `less` funcionan en la página de manual.

Es posible hacer una búsqueda por palabra clave en las páginas del manual. Esto puede ser útil si se tiene seguridad de qué comando se quiere utilizar pero se conoce lo que se quiere conseguir. No es infrecuente encontrar que una palabra concreta existe en muchas páginas del manual.

## Redirección de entradas y salidas

La redirección de entradas y salidas es una potente característica utilizada por los programas de línea de comandos. Muchos comandos como ls imprimen su salida en la pantalla. Sin embargo, esto no tiene por qué ser así. Utilizando notaciones especiales podemos redirigir la salida de muchos comandos a archivos, dispositivos e incluso a la entrada de otros comandos.

En todas las variantes de *Unix* tiene tres flujos estándar que, a modo de canales, conectan la entrada y salida (I/O) de un comando/aplicación con la terminal/consola cuando se ejecuta, son los siguientes:

- `**STDIN (0)**` - Entrada estándar, datos introducidos en el programa, por defecto mediante parámetros introducidos como parámetros.
- `**STDOUT (1)**` - Salida estándar, datos devueltos por el programa, por defecto en el terminal.
- `**STDERR (2)**` - Error estándar, para mensajes de error, también por defecto en el terminal.

A cada canal tiene asociado un número único para identificarlo. Es lo que se conoce como descriptor de fichero.

### Salida estándar '**>**', '**> >**'

Los programas de línea de comandos que muestran sus resultados a un dispositivo llamado **salida estándar** o **STDOUT** (*Standard Output*). Por defecto, la salida estándar dirige su contenido al mismo terminal. Para redirigir la salida estándar a un archivo, se utiliza el carácter "**`>`**" de la siguiente manera:

```sh
$ ls > listado_archivos.txt
```

En este ejemplo, se ejecuta el comando `ls` y los resultados se escriben en un archivo llamado `listado_archivos.txt`. Como la salida de ls se redirigió al archivo, no aparecerá ningún resultado en la pantalla.

Cada vez que se repite el comando anterior, `listado_archivos.txt` se sobrescribe desde el principio con la salida del comando `ls`. Para que los nuevos resultados se añadan al archivo, se utiliza "**`>>`**" de la siguiente manera:

```sh
$ ls >> listado_archivos.txt
```

Se añaden los resultado al final del fichero, con lo que el fichero se hace más largo cada vez que se repite el comando. Si el fichero no existe cuando intentamos anexar la salida redirigida, se creará el fichero.

### Entrada estándar '**<**'

Muchos comandos pueden aceptar la entrada de un dispositivo llamado **entrada estándar** o **STDIN** (*Standard Input*). Por defecto, la entrada estándar obtiene su contenido del **teclado**, pero al igual que la salida estándar, puede redirigirse. Para redirigir la entrada estándar desde un archivo en lugar de desde el teclado, se utiliza el carácter "**`<`**" de la siguiente manera:

```sh
$ sort < listado_archivos.txt
```

En el ejemplo anterior, hemos utilizado el comando `sort` para procesar el contenido de `listado_archivos.txt`. Los resultados se muestran en la pantalla ya que la salida estándar no fue redirigida. Podríamos redirigir la salida estándar a otro archivo de la siguiente manera:

```sh
$ sort < listado_archivos.txt > listado_archivos_ordenado.txt
```

Como podemos ver, un comando puede tener tanto su entrada como su salida redirigidas. Tenga en cuenta que el orden de la redirección no importa. El único requisito es que los operadores de redirección (los "`<`" y "`>`") deben aparecer después de las demás opciones y argumentos del comando.

### Tuberías '**|**'

La cosa más útil y poderosa que podemos hacer con la redirección de E/S es conectar múltiples comandos juntos para formar lo que se llama pipelines. Con los pipelines, la salida estándar de un comando se introduce en la entrada estándar de otro. He aquí un ejemplo muy útil:

```sh
$ ls -l | less
```

En este ejemplo, la salida del comando ls se introduce en `less`. Usando este truco "`| less`", podemos hacer que cualquier comando tenga salida interactiva donde podemos paginar y hacer búsquedas en la salida.

Conectando comandos entre sí, podemos sacar el máximo partido a la línea de comandos. Aquí tienes algunos ejemplos:

- `ls -lt | head` Muestra los 10 archivos más nuevos del directorio actual.
- `du | sort -nr` Muestra una lista de directorios y cuánto espacio consumen, ordenados del mayor al menor.
- `find . -type f -print | wc -l` Muestra el número total de ficheros en el directorio de trabajo actual incluyendo todos sus subdirectorios.

### Filtros

Un tipo de programa que se utiliza con frecuencia con las tuberías se llama filtro. Los filtros toman la entrada estándar, realizan una operación sobre ella y envían los resultados a la salida estándar. De este modo, pueden combinarse para procesar la información de formas muy potentes. Estos son algunos de los programas más comunes que pueden actuar como filtros:

- `sort` Ordena la entrada estándar y muestra el resultado ordenado en la salida estándar.
- `uniq` Dado un flujo de datos ordenado de la entrada estándar, elimina las líneas de datos duplicadas, es decir, se asegura de que cada línea sea única.
- `grep` Examina cada línea de datos que recibe de la entrada estándar y muestra todas las líneas que contienen un patrón específico de caracteres.
- `fmt` Lee texto de la entrada estándar y, a continuación, muestra texto formateado en la salida estándar.
- `pr` Toma el texto de la entrada estándar y divide los datos en páginas con saltos de página, encabezados y pies de página como preparación para la impresión.
- `head` Da salida a las primeras líneas de su entrada. Útil para obtener la cabecera de un fichero.
- `tail` Muestra las últimas líneas de la entrada. Útil para cosas como obtener las entradas más recientes de un archivo de registro.
- `tr` Traduce caracteres. Puede utilizarse para realizar tareas como conversiones mayúsculas/minúsculas o cambiar los caracteres de terminación de línea de un tipo a otro (por ejemplo, convertir archivos de texto DOS en archivos de texto estilo Unix).
- `sed` Editor de secuencias. Puede realizar traducciones de texto más sofisticadas que `tr`.
- `awk` Lenguaje de programación completo diseñado para construir filtros. Extremadamente potente.

**Realización de tareas con pipelines:**

  **Impresión desde la línea de comandos**. Linux proporciona un programa llamado `lpr` que acepta la entrada estándar y la envía a la impresora. Se utiliza a menudo con tuberías y filtros. He aquí un par de ejemplos:

  ```sh
  $ cat informe_mal_formateado.txt | fmt | pr | lpr
  ```

  El ejemplo sigue los siguientes pasos:

  - `cat` lee el archivo y lo envía a la salida estándar, que se canaliza a la entrada estándar de `fmt`.
  - `fmt` formatea el texto en párrafos ordenados y lo envía a la salida estándar, que se canaliza a la entrada estándar de `pr`.
  - `pr` divide el texto ordenadamente en páginas y lo envía a la salida estándar, que se canaliza a la entrada estándar de `lpr`.
  - `lpr` toma su entrada estándar y la envía a la impresora.

  ```sh
  $ cat lista_no_clasificada_con_duplicados.txt | sort | uniq | pr | lpr
  ```

  El ejemplo comienza con una lista de datos sin ordenar con entradas duplicadas. En primer lugar, `cat` envía la lista a `sort`, que la ordena y la envía a `uniq`, que elimina los duplicados. A continuación se utilizan `pr` y `lpr` para paginar e imprimir la lista.

  **Ver el contenido de los archivos `tar`**. A menudo se obtendrán `tar` comprimidos con `gzip`. Se puede utilizar el siguiente comando para ver el contenido de un archivo de este tipo en un sistema *Linux*:

  ```sh
  $ tar tzvf nombre_del_archivo.tar.gz | less
  ```

### Salida de error estándar '**2>**'

La salida estándar de error es hacia donde el comando envía datos de error al momento de realizar su tarea. Este flujo de datos también se imprime en el terminal pero no se envía a la entrada estándar (*STDIN*) de un comando que lo consuma.

```sh
$ ls -l valido.txt invalido.txt
ls: no se puede acceder a 'invalido.txt': No existe el archivo o el directorio
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt
```

En el ejemplo aparece un error en el terminal indicando que `invalido.txt` no existe y, a continuación, muestra los datos del segundo archivo `valido.txt` que sí se encuentra.

Si redirigiimos la salida estándar del comando a un archivo obtendremos lo siguiente:

```sh
$ ls -l valido.txt invalido.txt > salida.txt
ls: no se puede acceder a 'invalido.txt': No existe el archivo o el directorio

$ cat salida.txt
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt
```

Podemos observar que el error sigue apareciendo en el terminal y en el archivo se ha almacenado la salida del archivo que no ha producido un error.

Podríamos almacenar la salida de error estándar redirigiendo la salida con "`2>`":

```sh
$ ls -l valido.txt invalido.txt 2> error.txt
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt

$ cat error.txt
ls: no se puede acceder a 'invalido.txt': No existe el archivo o el directorio
```

A menudo se suele desechar la salida de error redirigiéndola al dispositivo `/dev/null`, simplemente no se muestra ni almacena en ningún sitio.

```sh
$ ls -l valido.txt invalido.txt 2> /dev/null
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt
```

Si queremos redirigir ambas salidas, cada una en un archivo, haremos lo siguiente:

```sh
$ ls -l valido.txt invalido.txt > salida.txt 2> error.txt

$ cat salida.txt
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt

$ cat error.txt
ls: no se puede acceder a 'invalido.txt': No existe el archivo o el directorio
```

Por último, si queremos redirigir la salida de error a la salida estándar para poder almacenar ambas salidas en un mismo archivo, haremos lo siguiente:

```sh
$ ls -l valido.txt invalido.txt > salida.txt 2>&1

$ cat salida.txt
-rw-rw-r-- 1 user user 11 mar 30 12:42 valido.txt
ls: no se puede acceder a 'invalido.txt': No existe el archivo o el directorio
```

## Permisos

Los permisos *Linux* indican tres cosas que puedes hacer con un archivo o directorio, **leer**, **escribir** y **ejecutar**. Cada permisos se representa con una letra.

- **r** leer (*read*) - puedes ver el contenido del archivo.
- **w** escribir (*write*) - puedes cambiar el contenido del archivo.
- **x** ejecutar (*execute*) - puede ejecutar si se trata de un programa o script.

La misma serie de permisos se puede utilizar para los directorios, pero tienen un comportamiento ligeramente diferente.

- **r** - tiene la capacidad de leer el contenido del **directorio**, es decir, hacer un `ls`
- **w** - puede escribir en el directorio, es decir, crear archivos y directorios
- **x** - tiene la capacidad de entrar en ese directorio, es decir, ejecutar `cd`

A su vez, los permisos se dividen en tres apartados:

- **propietario** - usuario único propietario del fichero. (normalmente la persona que creó el fichero, pero la propiedad puede ser transferida a otro usuario)
- **grupo** - cada archivo pertenece a un único grupo.
- **otros** - cualquier otro usuario que no pertenezca al grupo ni sea el propietario.

### Consultar los permisos

Con `ls -l` podemos ver los detalles de los archivos incluyendo sus permisos.

```sh
$ ls -l archivo.txt
-rwxr----x 1 alumno1 students 12 mar 29 09:23 archivo.txt
```

En el ejemplo anterior, los 10 primeros caracteres de la salida son los que miramos para identificar los permisos `-rwxrw---x`.

- El primer carácter identifica el tipo de archivo. Si es un guión (`-`), se trata de un archivo normal. Si es una `d`, se trata de un directorio.
- Los tres caracteres siguientes representan los permisos del propietario. Una letra representa la presencia de un permiso y un guión (`-`) representa la ausencia de un permiso. En este ejemplo, el propietario tiene todos los permisos (lectura, escritura y ejecución).
- Los siguientes 3 caracteres representan los permisos para el grupo. En este ejemplo el grupo tiene permiso de lectura pero no de escritura ni de ejecución. Se debe tener en cuenta que el orden de los permisos es siempre leer, luego escribir y luego ejecutar.
- Finalmente los últimos 3 caracteres representan los permisos para otros (o todos los demás). En este ejemplo tienen el permiso de ejecución y nada más.
- A parte, podemos observar que el archivo pertenece al usuario `alumno1` y al grupo `students`.

A continuación se muestra una tabla resumen con la representación simbólica de los permisos así como su equivalente en binario y decimal.

Simbólico | Binario | Decimal
:-:|:-:|:-:
`– – –` | 000 | **0**
`– – x`	| 001 | **1**
`– w –` | 010 | **2**
`– w x` | 011 | **3**
`r – –`	| 100 | **4**
`r – x` | 101 | **5**
`r w –` | 110 | **6**
`r w x` | 111 | **7**
Table: Relación entre representación simbólica y decimal de los permisos.

Simbólico | Decimal
-|:-:
`– – –` `– – –` `– – –` | 000
`r – –` `– – –` `– – –` | 400
`r – –` `r – –` `r – –` | 444
`r w –` `– – –` `– – –` | 600
`r w –` `r – –` `r – –` | 644
`r w –` `r w –` `r w –` | 666
`r w x` `– – –` `– – –` | 700
`r w x` `r – x` `– – –` | 750
`r w x` `r – x` `r – x` | 755
`r w x` `r w x` `r w x` | 777
Table: Configuración de permisos comúnmente utilizadas.

### Modificar permisos '**chmod**'

Para cambiar los permisos de un archivo o directorio se utiliza un comando llamado `chmod`.

```txt
chmod [permisos] [ruta]
```

El parámetro de los permisos podemos pasarlo de dos formas distinta, en notación numérica y en notación simbólica.

Ejemplo de cambio de permisos utilizando la notación numérica:

```sh
$ chmod 750 archivo.txt
$ ls -l archivo.txt
-rwxr-x--- 1 alumno1 students 12 mar 29 09:23 archivo.txt
```

Ejemplo de cambio de permisos utilizando la notación simbólica, en este caso eliminaría el permiso de ejecución:

```sh
$ chmod -x archivo.txt
$ ls -l archivo.txt
-rw-r----- 1 alumno1 students 12 mar 29 09:23 archivo.txt
```

La notación simbólica es más flexible, ya que permite añadir o quitar permisos sin modificar el resto.

Podemos indicar a dónde se aplica el permiso mediante los siguientes argumentos:

- `u` usuario propietario
- `g` grupo
- `o` otros
- `a` todos (*all*)

A parte podemos indicar la operación con los siguientes símbolos:

- `+` añade el permiso
- `-` quita el permiso
- `=` configura el permiso con los valores indicados

Algunos ejemplos serían:

- `+x` añade permisos de ejecución a todos, sería equivalente a utilizar `a+x`
- `u+x` añade permiso de ejecución al usuario propietario
- `g-x` elimina el permiso de ejecución para el grupo
- `o-rw` elimina los permisos de lectura y escritura a otros
- `go=rw` establece los permisos para el grupo y otros para que puedan leer y escribir pero no ejecutar
- `u+x,go=rx` añade permiso de ejecución al propietario y establece los permisos para el grupo y otros para que puedan leer y ejecutar pero no escribir

## Gestión de procesos

*Linux* en general es un sistema bastante estable. Sin embargo, de vez en cuando, se puede se pierda rendimiento o se necesite ajustar el funcionamiento del sistema para que se adapte mejor a nuestras necesidades. En esta sección echaremos un breve vistazo a cómo podemos gestionar programas, o procesos en un sistema *Linux*.

Un programa es una serie de instrucciones que indican al ordenador lo que debe hacer. Cuando ejecutamos un programa, esas instrucciones se copian en la memoria y se asigna espacio para variables y todo lo necesario para gestionar su ejecución. Esta instancia en ejecución de un programa se denomina **proceso** y podemos gestionarlo.

### Trabajos en primer y segundo plano.

Cuando ejecutamos un programa o comando, normalmente se ejecutan en primer plano. La mayoría de ellos se ejecutan en una fracción de segundo. Puede que queramos iniciar un proceso que tarde un largo período de tiempo y que se ejecute sin nuestra intervención (procesar un archivo de texto muy grande o compilar un programa, por ejemplo). Lo que podemos hacer es ejecutar el programa en segundo plano y seguir trabajando. Demostraremos esto con un programa llamado `sleep`. Todo lo que hace `sleep` es esperar un número determinado de segundos y luego salir. También podemos usar un comando llamado `jobs` que nos lista los trabajos en segundo plano que se están ejecutando.

```bash
$ sleep 60
```

Este comando bloquearía la línea de comandos durante 60 segundos.

Si queremos cancelar la ejecución podemos pulsar la combinación de teclas `Ctrl + C`
Si pulsamos `Ctrl + Z` el proceso se detiene y se envía a segundo plano.

Para ejecutar un comando en segundo plano, añadiremos un ampersand `&` al final del comando.

```bash
$ sleep 60 &
```

Para consultar los procesos que están en segundo plano se utiliza el comando `jobs`

```bash
$ sleep 60 &
[1] 16656
$ jobs
[1]+  Ejecutando              sleep 60 &
```

Para enviar un proceso a primer plano y continuar su ejecución utilizaremos el comando `fg` (*foreground*) y el número de trabajo.

```bash
$ fg 1
sleep 60

```

Si hemos enviado un proceso a segundo plano con `Ctrl + Z` aparecerá detenido en `jobs`

```bash
$ sleep 60
^Z
[1]+  Detenido                sleep 60
$ jobs
[1]+  Detenido                sleep 60
```

Para reanudar la ejecución del proceso, pero que continúe en segundo plano utilizamos el comando `bg` (*background*) acompañado del número de trabajo.

```bash
$ bg 1
[1]+ sleep 60 &
$ jobs
[1]+  Ejecutando              sleep 60 &
```

### Comando '**top**'

*Linux*, como la mayoría de los sistemas operativos modernos, es un sistema operativo **multitarea**. Esto significa que muchos procesos pueden estar ejecutándose al mismo tiempo. Además de los procesos que estamos ejecutando, puede haber otros usuarios en el sistema que también estén ejecutando sus procesos y el propio sistema operativo normalmente también ejecuta varios procesos que utiliza para gestionar el sistema en general. Si queremos obtener una instantánea de lo que está ocurriendo actualmente en el sistema, podemos utilizar un programa llamado `top`.

```sh
$ top
```

Abajo un ejemplo simplificado de la ejecución de top:

```txt
$ top
top -  9:40:00 up 4 days, 5:21,  2 users,  load average: 0,89, 0,38, 0,14
Tasks: 184 total,   1 running, 183 sleeping,   0 stopped,   0 zombie
%Cpu(s): 1,0 us, 1,4 sy, 0,0 ni, 96,3 id, 1,4 wa, 0,0 hi, 0,0 si, 0,0 st
MiB Mem :    976,7 total,    213,1 free,    565,8 used,    197,7 buff/cache
MiB Swap:    975,0 total,    650,6 free,    324,4 used.    264,0 avail Mem 

 PID USER    PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND  
 643 root    20   0  579800  37772  10288 S   1,0   3,8   0:03.13 Xorg     
 457 root    35  15   16560  12924   1904 S   0,7   1,3   0:00.26 preload  
  11 root    20   0       0      0      0 S   0,3   0,0   0:00.08 ksoftir+ 
1371 user    20   0  152744   1272   1144 S   0,3   0,1   0:00.13 VBoxCli+ 
1544 user    20   0  504452  10236   9248 S   0,3   1,0   0:00.12 panel-8+ 
```

Detalle de cada línea:

**Tiempo de actividad y carga del sistema**
  
```txt
top - 9:40:00 up 4 days, 5:21,  2 users,  load average: 0,89, 0,38, 0,14
```

- Hora actual.
- Tiempo que lleva encendido el sistema.
- Número de usuarios con sesión iniciada
- Carga media de CPU en intervalos de 5, 10 y 15 minutos.

**Tareas**. Los procesos también se les llama tareas (*tasks*)

```txt
Tasks: 184 total,   1 running, 183 sleeping,   0 stopped,   0 zombie
```

Muestra el total de procesos en sus diferentes estados:

- *Running*: en ejecución o preparados para ejecutarse.
- *Sleeping*: en espera hasta que ocurra un evento en particular.
- *Stopped*: ejecución detenida.
- *Zombie*: no está siendo ejecutado. Algunos procesos quedan en este estado si el proceso que los invocó termina.

**Estado de la CPU**

```txt
%Cpu(s): 1,0 us, 1,4 sy, 0,0 ni, 96,3 id, 1,4 wa, 0,0 hi, 0,0 si, 0,0 st
```

Muestra porcentajes de uso del procesador:

- **us** (*user*): Procesos de usuario.
- **sy** (*system*): Procesos de sistema.
- **ni** (*nice*): Procesos de usuario con prioridad cambiada.
- **id** (*iddle*): Procesos inactivos.
- **wa** (*waiting*): En espera a que termine un evento.
- **hi** (*hw int*): Interrupciones hardware.
- **si** (*sw int*): Interrupciones software.
- **st** (*steal*): En entornos virtualizados, tiempo que espera la máquina virtual para que el sistema anfitrión le de uso de procesador.

**Memoria física**

```txt
MiB Mem :    976,7 total,    213,1 free,    565,8 used,    197,7 buff/cache
```

- Memoria total
- Memoria en disponible
- Memoria en uso
- Memoria dedicada dedicada al buffers y cache. El sistema almacena los datos de uso frecuente para optimizar las lecturas de disco.

**Memoria virtual**

```txt
MiB Swap:    975,0 total,    650,6 free,    324,4 used.    264,0 avail Mem 
```

Cuando el sistema tiene más procesos en ejecución de los que la memoria principal puede almacenar, se hace uso de un dispositivo de almacenamiento secundario, normalmente el disco duro, para almacenar los procesos más antiguos que no se están ejecutando en este momento. Es una operación lenta y si el sistema está utilizando memoria *swap* se notará una bajada de rendimiento notable.

- **avail Mem** es una estimación de cuánta memoria se puede usar antes de comenzar a utilizar memoria virtual.

**Lista de procesos**

```txt
 PID USER    PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND  
 643 root    20   0  579800  37772  10288 S   1,0   3,8   0:03.13 Xorg    
```

- **PID**: es el identificador de proceso. Cada proceso tiene un identificador único.
- **USER**: usuario propietario del proceso.
- **PR**: prioridad del proceso. Si pone RT es que se está ejecutando en tiempo real.
- **NI**: asigna la prioridad. Si tiene un valor bajo (hasta -20) quiere decir que tiene más prioridad que otro con valor alto (hasta 19).
- **VIRT**: cantidad de memoria virtual utilizada por el proceso.
- **RES**: cantidad de memoria RAM física que utiliza el proceso.
- **SHR**: memoria compartida.
- **S** (*status*): estado del proceso.
  - **R** *running*
  - **S** *sleeping* 
  - **T** *stopped*
  - **Z** *zombie*
- **%CPU**: porcentaje de CPU utilizado desde la última actualización.
- **%MEM**: porcentaje de memoria física utilizada por el proceso desde la última actualización.
- **TIME+**: tiempo total de CPU que ha usado el proceso desde su inicio.
- **COMMAND**: comando utilizado para iniciar el proceso.

Algunos atajos de teclado más comunes:

- **`q`** salir de *top*
- **`M`** ordena por uso de memoria
- **`P`** ordena por uso de procesador
- **`N`** ordena por ID de proceso
- **`T`** ordena por tiempo de ejecución
- **`V`** vista de árbol de procesos
- **`k`** enviar señal de terminación de proceso

Una alternativa a `top` es **`htop`** aunque puede que no venga instalado con el sistema y necesitemos instalarlo manualmente (`sudo apt install htop`). Según su descripción en la página de manual (`man htop`):

```txt
Es similar a top, pero permite desplazarse vertical y horizontalmente, e
interactuar utilizando un dispositivo apuntador (ratón). Puede observar
todos los procesos que se ejecutan en el sistema, junto con sus
argumentos de línea de comandos, así como verlos en un formato de árbol,
seleccionar varios procesos y actuar sobre todos ellos a la vez.
```

### Comando '**ps**'

Otro programa para ver los procesos es `ps`. En su uso normal te mostrará sólo los procesos que se están ejecutando en el terminal actual (que no suelen ser muchos).

```sh
$ ps
    PID TTY          TIME CMD
  46141 pts/0    00:00:00 bash
  46221 pts/0    00:00:00 ps
```

Si añadimos el argumento `aux` entonces mostrará una vista completa de procesos del sistema.

```txt
$ ps aux
USER   PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
root     1  0.0  0.9  98464  9516 ?        Ss   12:18   0:00 /sbin/init
root     2  0.0  0.0      0     0 ?        S    12:18   0:00 [kthreadd]
root     3  0.0  0.0      0     0 ?        I<   12:18   0:00 [rcu_gp]
root     4  0.0  0.0      0     0 ?        I<   12:18   0:00 [rcu_par_gp]
...
```

Tiene una salida mucho más extensa, así que la se suele pasar la salida a `grep` para filtrar los resultados.

### Comando '**kill**'

El comando `kill` permite detener un proceso indicando su ID. En realidad, kill sirve para enviar una señal a un proceso, pero si no indicamos opciones envía la señal de terminación `-TERM`.

Con `kill -l` podemos ver un listado de las señales disponibles, las más importantes son las siguientes:

- `SIGTERM` (15) - Señal de terminación del software (envía kill por defecto).
- `SIGKILL` ( 9) - Si un proceso recibe esta señal, debe salir inmediatamente y no realizará ninguna operación de limpieza.
- `SIGSTOP` (19) - Se emite para detener un proceso.
- `SIGCONT` (18) - Continuar la ejecución de un proceso detenido.
- `SIGHUP`  ( 1) - Se emite al cerrar el terminal asociado.
- `SIGINT`  ( 2) - Se emite si el usuario envía una señal de interrupción (Ctrl + C).
- `SIGQUIT` ( 3) - Se emite si el usuario envía una señal de abandono (Ctrl + D).

Las señales tienen asociado un código numérico estándar para las diferentes arquitecturas de procesadores.

Ejemplo de uso de `kill`:

```bash
$ sleep 5000&
[1] 18456
$ ps -a
    PID TTY          TIME CMD
  18456 pts/2    00:00:00 sleep
  18457 pts/2    00:00:00 ps
$ kill 18456
$ ps -a
    PID TTY          TIME CMD
  18457 pts/2    00:00:00 ps
```

En el ejemplo se ejecuta `sleep` para que se ejecute durante 5000 segundos, pero se lanza en segundo plano con `&`.
Podemos observar que aparecen unos números, `[1] 18456`, entre corchetes indica el trabajo en segundo plano, y el otro número es el ID de proceso.
Con `ps -a` vemos los procesos activos en el terminal actual junto con su `PID` (*Process ID*)
Al ejecutar `kill` junto con el `PID` estamos enviando la señal `TERM` (15) donde se le pide al proceso que termine su ejecución de forma ordenada.

Si una aplicación o comando se ha quedado bloqueado y queremos terminar su ejecución de manera forzosa, utilizaremos la señal `KILL` (9).

```bash
$ kill -9 18456
```

también se puede indicar la señal como texto:

```bash
$ kill -KILL 18456
```

Tiene el mismo efecto que el ejemplo anterior, pero fuerza el cierre de la aplicación. Por ejemplo, si tenemos abierto un editor de texto con cambios pendientes de guardar, por lo general, el editor de texto, al solicitar el cierre ordenado, señal `TERM` (15), mostrará un mensaje interactivo o diálogo preguntando al usuario si quiere guardar los cambios. Si utilizamos la señal `KILL` (9) este mensaje no aparece y se perderán los cambios.

## Enlaces

En *Linux* todo se trata como un archivo. Pero hay un tipo especial de archivo, llamado enlace (*link*), y hay dos tipos de enlaces:

- **Enlaces simbólicos** También llamados **enlaces suaves**, apuntan a la **ruta** de otro archivo. Si se borra el archivo al que apunta el enlace (llamado target), el enlace seguirá existiendo, pero el enlace dejará de funcionar.

- **Enlaces duros** También llamado **enlace físico**, es como un segundo nombre para el archivo original. **No son duplicados**, sino que son una entrada adicional en el sistema de archivos que apunta al mismo lugar (`inodo`) en el disco.

Un **inodo** es una estructura de datos que almacena atributos para un objeto (como un archivo o directorio) en un sistema de archivos. Entre esos atributos están los permisos, la propiedad y en qué bloques del disco se almacenan los datos del objeto. Se puede entender como una entrada en un índice, de ahí el nombre, que proviene de "*index node*".

### Enlaces duros

El comando para crear un enlace físico se utiliza el comando `ln`. Su sintaxis básica es la siguiente:

```txt
ln OBJETIVO NOMBRE_DEL_ENLACE
```

El `OBJETIVO` debe existir, es el archivo al que apuntará el enlace, y si el objetivo no está en el directorio actual, o si se desea crear el enlace en otro lugar, se debe especificar la ruta completa. Por ejemplo:

```txt
$ ln documento.txt /home/user/Documentos/enlaceDuro.txt
```

Creará un archivo llamado `enlaceDuro.txt` en el directorio `/home/user/Documentos/` vinculado al archivo `documento.txt` situado en el directorio actual.

Si se omite el parámetro `NOMBRE_DEL_ENLACE`, se creará un vínculo con el mismo nombre que el objetivo en el directorio actual.

Los enlaces duros son entradas en el sistema de archivos que tienen diferentes nombres pero apuntan a los mismos datos en el disco. Todos estos nombres pueden usarse para hacer referencia a un solo archivo. Si se cambia el contenido de uno de los enlaces duros, el contenido de todos los demás enlaces que apuntan a ese archivo cambia, ya que todos estos enlaces apuntan a los mismos datos de disco. Si se elimina uno de los enlaces, los otros enlaces seguirán funcionando.

Esto sucede porque cuando se borra un archivo, los datos no se borran del disco. El sistema simplemente elimina la entrada en la tabla del sistema de archivos que apunta al *inodo* correspondiente a los datos en el disco. Pero si tiene una segunda entrada que apunta al mismo *inodo*, aún se puede acceder a los datos.

Se puede verificar esto usando el parámetro `-i` de `ls`. Como ejemplo, vamos a considerar los siguientes contenidos de un directorio:

```txt
$ ls -li
total 224
4513695 -rw-r--r-- 2 user student 113402 Mar 24 11:31 enlaceDuro
4513695 -rw-r--r-- 2 user student 113402 Mar 24 11:31 objetivo.pdf
```

El número que aparece antes de los permisos es el número de ***inodo***. Los archivos `enlaceDuro` y `objetivo.pdf` tienen el mismo número (*4513695*), esto se debe a que uno es un vínculo duro del otro.

Pero, ¿cuál es el original y cuál es el enlace? Realmente no se puede decir, ya que para en la práctica son el mismo archivo.

Se debe tener en cuenta que cada enlace físico que apunta a un archivo aumenta el contador de enlaces del archivo. Este es el número que aparece después de los permisos en la salida de `ls -l`. De forma predeterminada, cada archivo tiene un recuento de enlaces de `1` (los directorios tienen un recuento de `2`), y cada enlace físico aumenta el recuento en uno. Esta es la razón del recuento de enlaces de `2` en los archivos del ejemplo anterior.

A diferencia de los enlaces simbólicos, **solo puede crear enlaces físicos a archivos**, y tanto el enlace como el destino **deben residir en el mismo sistema de archivos**.

Dado que los enlaces duros se tratan como archivos normales, se pueden eliminar con `rm` y renombrarlos o moverlos por el sistema de archivos con `mv`. Y dado que un enlace fijo apunta al mismo *inodo* del objetivo, se puede mover libremente, sin miedo a romper el enlace.

### Enlaces simbólicos

El comando utilizado para crear un enlace simbólico también es `ln`, pero con el parámetro `-s` agregado. Su sintaxis básica es:

```txt
ln -s OBJETIVO NOMBRE_DEL_ENLACE_SIMBOLICO
```

Dado el siguiente ejemplo:

```txt
$ ln -s objetivo.txt /home/user/Documentos/enlaceSimbolico
```

Esto creará un archivo llamado `enlaceSimbolico` en el directorio `/home/user/Documentos/`, apuntando al archivo `objetivo.txt` en el directorio actual.

Al igual que con los enlaces físicos, se puede omitir el nombre del enlace para crear un enlace con el mismo nombre que el destino en el directorio actual.

Los enlaces simbólicos apuntan a una ruta en el sistema de archivos. Se pueden crear enlaces simbólicos a archivos y directorios, incluso en diferentes particiones. Es bastante fácil detectar un enlace simbólico con la salida del comando `ls`:

```txt
$ ls -lh
total 112K
-rw-r--r-- 1 user student 110K Jun  7 10:13 objetivo.txt
lrwxrwxrwx 1 user student   12 Jun  7 10:14 enlaceSimbolico -> objetivo.txt
```

En el ejemplo anterior, el primer carácter de los permisos para el archivo `enlaceSimbolico` es **`l`**, lo que indica un enlace simbólico. Además, justo después del nombre del archivo, aparece el nombre del destino al que apunta el enlace, el archivo `objetivo.txt`.

Se debe tener en cuenta que en los listados de archivos y directorios, los enlaces suaves siempre muestran los permisos `rwx` para el usuario, el grupo y otros, pero en la práctica los permisos de acceso para ellos son los mismos que los del objetivo.

Al igual que los enlaces físicos, los enlaces simbólicos pueden eliminarse usando `rm` y moverse o renombrarse usando `mv`. Sin embargo, se debe tener especial cuidado al crearlos, para evitar romper el enlace si se mueve de su ubicación original.

Al crear enlaces simbólicos, a menos que se especifique la ruta absoluta, la ubicación del objetivo se interpreta como relativa a la ubicación del enlace. Esto puede crear problemas si se mueve el vínculo o el archivo al que apunta.

Esto es más fácil de entender con un ejemplo. Supongamos un archivo llamado `original.txt` en el directorio actual y se quiere crear un enlace simbólico llamado `softlink`:

```txt
$ ln -s original.txt softlink
```

Aparentemente todo estaría bien. Comprobemos con `ls`:

```txt
$ ls -lh
total 112K
-r--r--r-- 1 user student 110K Jun  7 10:13 original.txt
lrwxrwxrwx 1 user student   12 Jun  7 19:23 softlink -> original.txt
```

Se puede ver que `softlink` apunta a (`->`) `original.txt`. Sin embargo, veamos qué sucede si mueve el enlace al directorio anterior y se intenta mostrar su contenido:

```txt
$ mv softlink ../
$ less ../softlink
../softlink: No such file or directory
```

Dado que no se especificó la ruta a `original.txt`, el sistema asume que está en el mismo directorio que el enlace. Cuando esto ya no es cierto, el enlace deja de funcionar.

La forma de evitar esto es especificar siempre la ruta absoluta al objetivo cuando se crea el enlace:

```txt
$ ln -s /home/user/Documentos/original.txt softlink
```

De esta manera, no importa dónde se mueva el enlace, seguirá funcionando, porque apunta a la **ruta absoluta** del objetivo. Se verifica con `ls`:

```txt
$ ls -lh
total 112K
lrwxrwxrwx 1 user student   40 Jun  7 19:34 softlink -> /home/user/Documentos/original.txt
```

## Archivado y compresión de archivos

### Comando '**tar**'

El comando `tar`, abreviatura de “*Tape ARchive*”, se utiliza para **crear** archivos `tar` que junta un grupo de archivos en un único archivo. La ventaja de crear un archivo único es que se pueden adjuntar, agrupar y mover fácilmente.

`tar` también tiene la capacidad de **extraer** archivos `tar`, **mostrar** una lista de los archivos incluidos en el archivo y **agregar** archivos adicionales a un archivo existente.

La sintaxis del comando `tar` es la siguiente:

```txt
tar [OPERACIÓN] [OPCIONES] -f ARCHIVO_TAR [ARCHIVOS...]
```

Las **operaciones** básicas que se pueden realizar son las siguientes:

- **Crear** `-c` o `--create`
- **Extraer** `-x` o `--extract`
- **Listar** `-t` o `--list`

Las **opciones** más utilizadas son:

- `-f ARCHIVO_TAR` o `--file=ARCHIVO_TAR` establece el nombre del archivo `tar`.
- `-z` o `--gzip` utiliza compresión gzip.
- `-j` o `--bzip2` utiliza compresión bzip2.
- `-J` o `--xz` utiliza compresión xz.
- `-v` o `--verbose` muestra los archivos mientras se procesan.

A continuación algunos ejemplos.

- **Crear** un archivo `tar` de un directorio:

  ```txt
  $ tar -cvf archivo.tar Escritorio/
  ```

  En este caso, se crea un `archivo.tar`, sin comprimir, con todo el contenido del directorio `Escritorio`

- **Extraer** un archivo `tar`

  ```txt
  $ tar -xvf archivo.tar
  ```

  Extraerá el contenido de `archivo.tar` en el directorio de trabajo actual.

- **Crear** un archivo `tar` **comprimido** en ***gzip*** (`tar.gz`)

  ```txt
  $ tar -czvf documentos.tar.gz Documentos/*.txt Documentos/*.odt
  ```

  En este ejemplo, se añade la opción `z` que comprime el resultado en *gzip*. Se puede observar que se ha pasado una lista de archivos indicando una ruta relativa y comodines.

- **Descomprimir** `tar` comprimido en ***gzip*** (`tar.gz`)

  ```txt
  $ tar -xzvf documentos.tar.gz -C som/ud9
  ```

  Se cambia la opción a `x` para extraer el contenido. Se añade como ejemplo la opción `-C` para especificar la ruta del directorio destino donde se descomprimirán los archivos. Si no se especificara `-C som/ud9` los archivos se descomprimirían en el directorio de trabajo actual.

- **Crear** un archivo `tar` **comprimido** en ***bzip2*** (`tar.bz2`)

  ```txt
  $ tar -cjvf fotos.tar.bz2 *.jpg
  ```

  La principal característica de *bzip2* es que se consigue un mayor ratio de compresión, aunque es algo más lento que *gzip*.

- **Listar** el contenido de un archivo `tar`.

  ```txt
  $ tar -tvf fotos.tar.bz2
  ```

  Mostraría un listado de los contenidos del archivo `tar` sin extraer ni alterar el contenido.

<!-- BEGIN COMMENT -->


<!-- END COMMENT -->

<!-- NEWPAGE -->

## Referencias bibliográficas
