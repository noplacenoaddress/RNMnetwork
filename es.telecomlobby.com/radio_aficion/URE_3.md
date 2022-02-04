# Componentes activos: semiconductores y válvulas

#### 3.1 Esquemas y símbolos en electrónica.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/simbolos.jpg)

Un esquema de un circuito electrónico está compuesto por un grupo de símbolos unidos por líneas que nos está indicando los componentes que lo integran y su funcionamiento.

Algunos símbolos van acompañados de una nomenclatura que nos indica las características del elemento representado como por ejemplo junto a un condensador pueden aparecer unos caracteres que indican su valor.

#### 3.2 Semiconductores

![](https://i2.wp.com/codigoespagueti.com/wp-content/uploads/2021/03/silicio-en-los-chips-1.jpg?resize=1280%2C720&quality=80&ssl=1)

Los [semiconductores](https://es.wikipedia.org/wiki/Semiconductor) son substancias que tienen una conductividad intermedia entre los altos valores de los metales y los bajos de los aislantes.

Los cristales de [germanio](https://es.wikipedia.org/wiki/Germanio) o [silicio](https://es.wikipedia.org/wiki/Silicio) puros pueden considerarse como buenas aisladores porque carecen de electrones libres pero añadiéndoles impurezas pueden variar sus propiedades iniciales. Su mecanismo de conducción es distinto de los conductores metálicos; la impurezas la forman elementos con distintos número de electrones que ellos: si tienen más electrones que los semiconductores se les llama donantes y si tienen menos aceptantes (tienen «huecos» que se comportan como si tuvieran una carga eléctrica positiva y de igual magnitud que la de un electrón). Los electrones y los «huecos» se mueven en un campo eléctrico con una velocidad que es proporcional a la intensidad de dicho campo, los «huecos» se mueven en dirección opuesta a los electrones y con una velocidad que es la mitad de estos.

![](https://upload.wikimedia.org/wikipedia/commons/8/8b/N-Type_Semiconductor_Bands.svg)

Si por ejemplo combinamos germanio con un donante queda polarizado negativamente: así tenemos un semiconductor tipo `N` (negativo). Si la impureza es un aceptante el germanio queda polarizado positivamente convirtiéndose en un semiconductor tipo `P`.

#### 3.3 Diodos.

![](https://upload.wikimedia.org/wikipedia/commons/d/d5/Diode-closeup.jpg)

Un [diodo](https://es.wikipedia.org/wiki/Diodo) es un dispositivo que bajo determinadas circunstancias permite le paso de la corriente eléctrica en una única dirección.

Son uniones de dos materiales semiconductores `P` y `N` por lo que reciben la denominación de <u>unión pn</u>.

Ninguno de los dos cristales por separado tiene carga eléctrica, ya que en cada cristal, el número de electrones y cargas positivas es el mismo, de lo que podemos decir que los dos cristales son neutros. Al unir ambos hay una difusión de electrones de `N` a `P` y aparece una barrera de separación neutra. Al establecerse estas corrientes aparecen cargas fijas en una zona a ambos lados de la unión, zona que recibe diferentes denominaciones como zona de carga espacial, de agotamiento, de deplexión.

A medida que progresa el proceso de difusión, la zona de carga espacial va incrementando su anchura profundizando en los cristales a ambos lados de la unión. La acumulación de iones positivos en la zona `N`  y de iones negativos en `P` crea un campo eléctrico que actuará sobre los electrones libres de `N` con una determinada fuerza de desplazamiento, que se opondrá a la corriente de electrones y terminará deteniéndolos.

Este campo eléctrico es equivalente a decir que aparece una diferencia de tensión entre las zonas `P` y `N`. Esta diferencia de potencia es de `0,7 V` en el caso del silicio y de `0,3 V` si los cristales son de germanio. 

La anchura de la zona de carga espacial una vez alcanzado el equilibrio, suele ser del orden de `0,5 micras` pero cuando uno de los cristales está mucho más dopado que el otro la zona de carga espacial es mucho mayor.

Al dispositivo así obtenido se la denomina diodo, que ne un caso como el descrito, tal que no se encuentra sometido a un diferencia de potencial externa, se dice que no está polarizado. Al extremo `P`, se le denomina [ánodo](https://es.wikipedia.org/wiki/%C3%81nodo), representándose por la letra `A`, mientras que la zona `N`, el [cátodo](https://es.wikipedia.org/wiki/C%C3%A1todo), se representa por la letra `C` o `K`.

Cuando se somete al diodo a una diferencia de tensión externa, se dice que el diodo está polarizado, pudiendo ser la polarización «directa» o «inversa».

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/diodo_poldirecta.svg)

Se llama polarización directa cuando el cristal `P` va unido mediante un conductor al polo positivo de una batería o pila exterior y el cristal `N` al polo negativo. Por el exterior del sistema en la polarización directa hay flujo de electrones y van de `P` a `N`. Si se aumenta la polarización directa la corriente aumenta; si llega a ser excesiva se rompe la estructura cristalina. La tensión aplicada normalmente a esta clase de polarización es `1` a `1.5V`. 

En el caso de la polarización directa, la batería disminuye la barrera de potencial de la zona de carga espacial, permitiendo el paso de la corriente de electrones a través de la unión; es decir, el diodo polarizado directamente conduce la electricidad. 

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/diodo_polinversa.svg)

Se llama polarización inversa a aquélla en que le cristal `P` va unida al polo negativo de la pila o batería y el cristal `N` al positivo. En la polarización inversa los «huecos» del `P` son atraídos hacia el polo negativo de la batería y los electrones del `N` hacia el positivo de la batería; no hay corriente por el circuito. Una polarización inversa excesiva rompe la estructura del cristal. 

La <u>unión PN</u> funciona, en cierto modo, como un conmutador; el germanio tipo `N` es el «emisor» y el tipo `P` el «colector». La polarización directa favorece el paso de la corriente y disminuye la barrera de potencial que hay entre los cristales. La polarización inversa dificulta la corriente y aumenta la barrera.

SEn el caso de polarización inversa, el polo negativo de la batería se conecta a la zona `P` y el polo positivo a la zona `N`, lo que hace aumentar la zona de carga espacial, y la tensión en dicha zona hasta que se alcanza el valor de la tensión de la batería. El diodo no debería conducir la corriente; sin embargo, debido al efecto de la temperatura se formarán pares electrón-hueco a ambos la dos de la unión produciendo una pequeña corriente del orden de `1 µA` denominada corriente inversa de saturación.

![](https://upload.wikimedia.org/wikipedia/commons/5/51/Diodo_-_curva_caracter%C3%ADstica_%28Sockley%29.png)

En los semiconductores el desplazamiento de los electrones es en dirección hacía el polo positivo y nos referimos al movimiento en el interior del cristal, ya que la polarización directa vimos que hay un flujo externo de `P` a `N`. Los «huecos» en cambio se desplazan hacia el polo negativo en el cristal o se combinan con electrones según polarización.

Esquemáticamente diremos que el tipo `N` los conductores son los electrones y en el tipo `P` los conductores son los «huecos».

De forma simplificada, la curva característica de un diodo (`I V`) consta de dos regiones, por debajo de cierta diferencia de potencial, el diodo se comporta como un circuito abierto (no conduce), y por encima de ella como un circuito cerrado con muy pequeña resistencia eléctrica.

Debido a las características expuestas de los diodos, tienen diversas aplicaciones, tales como: [rectificadores](https://es.wikipedia.org/wiki/Rectificador), [estabilizadores](https://es.wikipedia.org/wiki/Regulador_de_tensi%C3%B3n), [recortadores](https://es.wikipedia.org/wiki/Limitador), [multiplicadores](https://es.wikipedia.org/wiki/Multiplicador_de_tensi%C3%B3n), [mezcladores](https://es.wikipedia.org/wiki/Mezclador_de_frecuencias). Veamos seguidamente cuatro delas aplicaciones más usuales.

## Bibliografía

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`