# Elementos de radioelectricidad

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/rtx-yaesu-ft-1000mp-mark-v.jpg)

#### 4.1 Fuentes de alimentación.

Una gente de alimentación es un dispositivo electrónico que convierte la corriente alterna en otro tipo de corriente continua. Pueden ser de varios tipos según su salida:

- Fijas: proporcionan una corriente o tensión que no puede ser modificada.
- Ajustables: el valor de la salida puede ser modificado.
- Programables: su salida varia a lo largo del tiempo y de forma automática de valor.
- Simples: tienen una única salida.
- Múltiples: con varias salidas independientes.

Pueden ser de dos tipos según la tecnología empleada:

- Lineales: trabajan en régimen lineal.
- [Conmutadas](https://es.wikipedia.org/wiki/Fuente_conmutada): Trabajan en régimen de conmutación. 

Todas ellas pueden tener sistemas de control analógicos o digitales. Todas ellas parten de `CA` para obtener una tensión continua con un bajo nivel de [rizado](https://es.wikipedia.org/wiki/Rizado).

Las lineales brindan una mejor regulación, velocidad y mejores características de generación de interferencias. La conmutadas un mejor rendimiento, menor coste menor tamaño y peso.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/Bloques-fuente.png)

Leas lineales constan de tres etapas:

- Etapa de entrada: rectifica la tensión alterna y contiene elementos de protección.
- Etapa de regulación: dedicada a mantener la salida en los valores deseados.
- Etapa de salida: su misión es filtrar, controlar, limitar, proteger y adaptar la fuente a la carga a la que este conectada.

El transformador adapta los niveles de tensión y proporciona [aislamiento galvánico](https://es.wikipedia.org/wiki/Aislamiento_galv%C3%A1nico), es decir separación eléctrica entre la red de entrada y el circuito que alimenta.

El rectificador es el circuito que convierte la `CA` en `CC`. 

La regulación se consigue con un componente disipativo regulable, con un conmutador del secundario del transformador mediate un circuito electrónico o mezclas de dos o más de estos métodos.

El filtro tiene por objeto convertir la `CC` pulsante en `CC` tan pura como sea posible.

#### 4.1.1 Circuitos de rectificación de media onda, onda completa y rectificador en puente.

Un [rectificador](https://es.wikipedia.org/wiki/Rectificador) es un circuito que permite convertir la `CA` en `CC`. Por ello se emplean diodos.

Pueden ser de [media onda](https://es.wikipedia.org/wiki/Rectificador_de_monof%C3%A1sico_de_media_onda) cuando solo se utiliza uno de los semiciclos de la CA o de [onda completa](https://es.wikipedia.org/wiki/Rectificador_de_onda_completa) si se aprovechan ambos.

| ![](https://upload.wikimedia.org/wikipedia/commons/9/91/Tensi%C3%B3n_sinusoidal.png) | ![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/rectificador_mediaonda.png) | ![](https://upload.wikimedia.org/wikipedia/commons/c/c6/Tensi%C3%B3n_rectificada_media_onda.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |

El rectificador de media onda está constituido por un único diodo entre la fuente de alimentación alterna y la carga y solo alcanza la salida una mitad de la forma de onda de la entrada; esta mitad puede ser la positiva o la negativa dependiendo del sentido en que se conecte el diodo. La forma de onda de la corriente rectificada de salida es la de una corriente continua pulsante con una frecuencia de pulso igual a la de la `CA` de alimentación.

Durante el primer semiciclo o semiperiodo postivo la polaridad del ánodo es positiva y el diodo `D` se comporta como un circuito abierto. (polarización inversa), la corriente entonces es cero pues el circuito abierto no permitirá que fluya la corriente y no aparece tensión en la resistencia de carga `R`.

| ![](https://upload.wikimedia.org/wikipedia/commons/9/91/Tensi%C3%B3n_sinusoidal.png) | ![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/rectificador_ondacompleta.png) | ![](https://upload.wikimedia.org/wikipedia/commons/3/37/Tensi%C3%B3n_rectificada_onda_completa.png) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |



## Bibliografía

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Luxorion](http://www.astrosurf.com/luxorion/menu-qsl.htm), `LX4SKY`