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

#### 3.3.1 Diodos rectificadores, diodos zener, diodos LED y diodos varicap.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/retificador_mediaonda.svg)

Una de las aplicaciones de los diodos es la de ser rectificadores de corriente alterna, es decir dispositivos capaces de convertir una corriente alterna en continua. El [rectificador de media onda](https://es.wikipedia.org/wiki/Rectificador_de_monof%C3%A1sico_de_media_onda) es un circuito empleado para eliminar la parte negativa de una señal de corriente alterna de entrada `Vi` convirtiéndola en corriente continua de salida `Vo`. Es el circuito de rectificación más sencillo que puede construirse con un diodo. En este circuito la señal de salida también se llama pulsante:

![](https://upload.wikimedia.org/wikipedia/commons/c/c6/Tensi%C3%B3n_rectificada_media_onda.png)



Un [diodo zener](https://es.wikipedia.org/wiki/Diodo_Zener), es un diodo de silicio que se ha construido para que funcione la zonas de rupturas. Llamados a vece diodos de avalancha o de ruptura son la parte esencial de los reguladores de tensión casi constantes con independencia de que se presenten grandes variaciones de la tensión de red, de la resistencia de carga y de la temperatura.

![](https://upload.wikimedia.org/wikipedia/commons/8/81/Diode05.svg)

Cuando están polarizados inversamente, mantienen la tensión entre sus terminales prácticamente constante en un amplio rango de intensidades y temperaturas; este tipo de diodos se emplean en circuitos estabilizadores o reguladores de tensíon.

![](https://github.com/noplacenoaddress/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/diodo_zener.svg)

Eligiendo `R` y las características del diodo, se puede lograr que la tensión en la carga `Rl` permanezca prácticamente constante dentro del rango de variación de la  tensión de entrada `Vs`.

Es importante tener en cuenta que `Vs` tienen que ser mayor que `Vz` dado que el diodo zener trabaja en la [zona de avalancha](http://www.sc.ehu.es/sbweb/electronica/elec_basica/tema2/Paginas/Pagina10.htm#Efecto%20Avalancha). 

Para elegir la resistencia limitadora `R` adecuada hay que calcular primero cual puede ser su valor máximo y mínimo, después elegiremos una `R` normalizada que se adecue a nuestros cálculos.

![](https://upload.wikimedia.org/wikipedia/commons/7/79/LEDES.jpg)

Un diodo [LED](https://es.wikipedia.org/wiki/Led) es un dispositivo semiconductor que emite luz monocromática cuando se polariza directamente y es atravesado por una corriente eléctrica, su color depende del material semiconductor empleado en la construcción del diodo, pudiendo variar desde el [ultravioleta](https://es.wikipedia.org/wiki/Radiaci%C3%B3n_ultravioleta) hasta el [infrarrojo](https://es.wikipedia.org/wiki/Radiaci%C3%B3n_infrarroja); recibiendo estos últimos la denominación de [diodos IRED](https://es.wikipedia.org/wiki/Sensor_infrarrojo). Los LED suelen estar encapsulados en una cubierta de plástico coloreado.

Para obtener una buena intensidad luminosa debe escogerse bien la corriente que atraviesa el LED; su voltaje de operación va desde `1,5` hasta `3,5 V`, y la gama de intensidades que debe circular por ellos va desde `10` hasta `20 mA` en los diodos de color rojo y de `20` a `40mA` para el resto.

El [diodo varicap](https://es.wikipedia.org/wiki/Diodo_Varicap) o de capacidad variable es un tipo de diodo qe base su funcionamiento en el fenómeno, ya explicado, que hace que la anchura de la barrera de potencial en una unión `PN` varíe en función de la tensión inversa aplicada entre sus extremos. Al aumentar dicha tensión aumenta la anchura de esa barrera, disminuyendo así la capacidad del diodo.

De esta forma tenemos un condensador variable controlado por tensión. Los valores de capacidad obtenidos va desde `1` a `500 pF`. La tensión inversa mínima tiene que ser de `1V`.

#### 3.3.2 Tensión inversa y pérdidas de corriente.

Tal y como se ha dicho al hablar de la polarización inversa, la pequeña corriente que circula por la superficie del diodo es función de la tensión aplicada al diodo, con l oque al aumentar la tensión aumenta la corriente superficial de fugas.

#### 3.4 Tiristores.

![](https://upload.wikimedia.org/wikipedia/commons/1/1f/Thyristor_circuit_symbol_es.jpg)

Un [tiristor](https://es.wikipedia.org/wiki/Tiristor) es un dispositivo semiconductor biestable de cuatro capas `P-N-P-N` con tres terminales ánodo, cátodo y [compuerta](https://es.wikipedia.org/wiki/Puerta_l%C3%B3gica). El dispositivo puede conmutar de bloqueo a conducción o reduciendo la corriente que lo atraviesa por debajo del valor umbral o al revés. Existen múltiples tipos de tristores y se usan como interruptores electrónicos de potencia.

#### 3.5 Transistores. Tipos PNP y NPN. Factor de amplificación.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/transistores_PNP_NPN.svg)

Los transistores están formados por un «sandwich» de dos tipos de semiconductor `P` y `N` muy  delgados. pueden ser por tanto de tipo `PNP` o `NPN` siendo estos últimos los más utilizados. Al elemento de entrada se le llama emisor al central, base y al de salida colector.

El dispositivo comúnmente llamado [transistor](https://es.wikipedia.org/wiki/Transistor) o más propiamente transistor bipolar o BJT fue llamado así por la propiedad que tiene de cambiar la resistencia al paso de la corriente eléctrica entre el emisor y el colector. El transistor tiene tres partes, una que emite portadores, <u>emisor</u>, otra que lo recibe o recolecta, <u>colector</u>, y la tercera, que está intercalada entre las dos primeras, modula el paso de dichos portadores, <u>base</u>.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/transistor_NPN.svg)

El transistor requiere una polarización entre la base y el emisor en el sentido de la conducción.  En los bipolares, una pequeña señal eléctrica aplicada entre la base y emisor modula la corriente que circula entre emisor y colector. La señal base emisor puede ser muy pequeña en comparación con la emisor colector.

La corriente emisor-colector tiene aproximadamente la misma forma que la base-emisor pero amplificada en un factor de amplificación denominado β. El transistor se utiliza, por lo tanto, como amplificador. Además como todo amplificador puede [oscilar](https://es.wikipedia.org/wiki/Oscilaci%C3%B3n), puede usarse como oscilador y también como rectificador y como conmutador on off.

Al funcionar el transistor como interruptor electrónico, se aplica esta propiedad en el diseño de algunos tipos de memorias y de otros circuitos.

El factor de amplificación β de un transistor es llamado ganancia de corriente:
$$
\begin{align*}
factor\space amplificación\space=\space \frac{Variación\space de\space intensidad\space en\space el\space colector}{Variación\space de\space intensidad\space en\space la\space base} \\\\
ganancia\space de\space tensión\space en \space transistor \space = \space \frac{Tensión\space de \space salida}{Tensión \space de \space entrada}
\end{align*}
$$
Luego la ganancia de potencia en un transistor es igual a la ganancia de corriente o factor de amplificación multiplicada por la ganancia de tensión.

#### 3.5.1 Transistor de efecto de  campo versus bipolar (voltaje versus corriente inducida).

![](https://upload.wikimedia.org/wikipedia/commons/5/59/ATI_Radeon_X1650_Pro_-_Alpha_%26_Omega_Semiconductor_D414-4362.jpg)

El funcionamiento del [transistor de efecto de campo](https://es.wikipedia.org/wiki/Transistor_de_efecto_campo) o FET es distinto del bipolar ya descrito. La puerta no absorbe corriente en absoluto, frente a los bipolares donde la corriente que atraviesa la base nosiempre puede ser despreciada. Los [MOSFET](https://es.wikipedia.org/wiki/Transistor_de_efecto_de_campo_metal-%C3%B3xido-semiconductor), además, presentan un comportamiento capacitivo muy acusado que hay que tener en cuenta para el análisis y diseño de circuitos. Los más utilizados son:

- [JFET](https://es.wikipedia.org/wiki/JFET)
- MOSFET
- MISFET

Tienen tres terminales, denominadas puerta, drenador y fuente. La puerta es el terminal equivalente a la base del bipolar. El transistor de efecto de campo se comporta como un interruptor controlador por tensión donde el voltaje aplicado a la puerta permite hacer que fluya o no corriente entre drenador y fuente.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/transistor_FET.svg)

Así como los bipolares se dividen en NPN y PNP los de efecto de campo o FET son también de dos tipos: canal N y canal P, dependiendo de si la aplicación de una tensión positiva en la puerta pone al transistor en esta de conducción o no conducción, respectivamente. Los transistores de efecto de campo MOS se usan ampliamente en electrónica digital, y son el componente fundamental de los circuitos integrados o digitales. Los FET son unipolares y en ellos la conducción no la determina una corriente de entrada sino un campo eléctrico que opera sobre el cristal, permitiendo o impidiendo el paso de la corriente. No precisan base ni corriente de base.

#### 3.5.2 Circuitos amplificadores con transistores bipolares.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/Curvas_caracteristicas.png)

Para diseñar un circuito en que intervengan uno o más transistores es preciso consultar las [familias de curvas](https://es.wikipedia.org/wiki/Familia_de_curvas) características. En ellas la intensidad de corriente que circula por le colector `A` en función de la tensión existente entre colector y emisor `v` con una cierta intensidad de base constante `lb`. En el eje vertical en donde las corriente aumentan rápidamente se le da el nombre de zona de saturación. Donde en el eje horizontal no aparece ningún corriente en proximidad de lo cero se le da el nombre de zona de corte. Todo los demás toma el nombre de zona de funcionamiento activo.

Un circuito amplificador que funciona utilizando una serie de transistores puede ser configurado en base a tres montajes típicos: emisor común, base común o colector común conocido también como seguidor de emisor.

Los principales parámetros del transistores a considerar en estos tres circuitos son:

- corriente de cortocircuito.
- relación de transferencia.
- frecuencia de corte.
- impedancias de entrada y salida.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/amplificador_emisorcomun.svg)



En el montaje en emisor común la entrada de la señal se aplica a la base y la salida se obtiene en el colector. Las ganancias de tensión y corrientes son muy altas, obteniéndose una alta ganancia de potencia.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/amplificador_basecomun.svg)

En base común la entrada es aplicada al emisor y la salida se obtiene en el colector. LA ganancia de tensíon es grande y la ganancia de corriente es aproximadamente 1.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/amplificador_colectorcomun.svg)

En el colector común la entrada de la señal se aplica en la base y la salida se obtiene en el emisor. Tiene una alta ganancia de corriente y una ganancia de tensión ligeramente menor a 1.

#### 3.5.3 Impedancias de entrada y salida de los anteriores circuitos.

El circuito de emisor común tiene la impedancia de entrada entre media y alta y la de salida es alta. Por sus características es el circuito más utilizados de los tres. La corriente de entrada y la de salida están en oposición de fase y realimentación a través de la resistencia de emisor es negativa, por ello, se trata de un amplificador muy estable.

El circuito de base común tiene baja impedancia de entrada y alta impedancia de salida. La corriente de entrada y la de salida están en fase. El circuito de colector común tiene alta impedancia de entrada y baja impedancia de salida. La corriente de entrada y la de salida están en fase.

#### 3.5.4 Métodos de polarización.

La polarización usual en transistores es que la unión de entrada quede con polarización directa, mientras que la unión de salida queda en polarización inversa. El transistor tiene el inconveniente de que a altas frecuencias la ganancia de corriente disminuye. 

Se produce [saturación](https://es.wikipedia.org/wiki/Amplificador_operacional#Saturaci%C3%B3n) cuando la corriente del colector deja de depender de la corriente de entrada y pasa a depender de la tensión del propio colector. Tensión máxima del colector es la tensión máxima continua que puede aplicarse al colector sin dañar el transistor. La tensión inmediatamente superior es la tensión de ruptura. 

#### 3.6 Circuitos integrados lineales.

![](https://www.ariston.es/Portals/0/img/productos/sg3524.jpg)

Hay dos tipos de [circuitos integrados](https://es.wikipedia.org/wiki/Circuito_integrado), los lineales y los lógicos.

Los lineales, también llamados microcircuitos, se componen básicamente de unos cientos de transistores bipolares y/o FET integrados en un único sustrato, una pastilla di silicio. También se integran diodos, condensadores y resistencias. Vienen a funcionar, básicamente, como hemos vista para los transistores y en la mayoría de las aplicaciones su funcionamiento es lineal. Los circuitos integrados analógicos pueden ser desde simples transistores encapsulados juntos hasta dispositivos completos como amplificadores, osciladores y otros y están diseñados para realizar funciones que de otras forma precisarían el empleo de multitud de componentes discretos. Ejemplos de sus aplicaciones pueden ser también los [mezcladores](https://es.wikipedia.org/wiki/Mezclador_electr%C3%B3nico) y los detectores.

![](https://upload.wikimedia.org/wikipedia/commons/6/63/Mezclador_pasivo.jpg)

#### 3.6.1 Amplificadores operacionales.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/PCB/amplificador_operacional.svg)

Un amplificador operacional `AO` es un amplificador diferencial de elevada ganancia, con acoplo directo y cuyas características están determinadas fundamentalmente pro los componentes externos al `CI`.

De manera sencilla diremos que es un tipo de amplificador que aumenta considerablemente las tensiones aplicadas a sus entradas, su salida es la diferencia entre sus dos entradas multiplicada por el factor de ganancia. 

Un `AO` ideal tiene una ganancia infinita, una impedancia de entrada infinita, un ancho de banda también infinito, una impedancia de salida nula, un tiempo de respuesta nulo y ninguno ruido. Como la impedancia de entrada es infinita también se dice que las corrientes de entrada son cero. Aunque sus aplicaciones son numerosas, la más usuales son en circuitos de amplificadores, osciladores, mezcladores, filtros y pre amplificadores de audio y vídeo. 

#### 3.7 Dispositivos termoiónicos simples (válvulas) (solo cualitativamente).

![](https://upload.wikimedia.org/wikipedia/commons/c/cd/5C3Ss.jpg)

Actualmente las válvulas solo se usan en los amplificadores de gran potencia, describimos las de emisión [termoiónica](https://es.wikipedia.org/wiki/V%C3%A1lvula_termoi%C3%B3nica), los diodos y los [triodos](https://es.wikipedia.org/wiki/Triodo).

Cuando a determinados cuerpos se les suministra energía por ejemplo calorífica la unión de los electrones al núcleo se debilita llegando al desprendimiento de electrones que quedan libres. A este fenómeno se llama [emisión termoiónica](https://es.wikipedia.org/wiki/Emisi%C3%B3n_termoi%C3%B3nica). En los cuerpos incandescentes los electrones forman una nube alrededor de los mismos llamada [carga espacial](https://en.wikipedia.org/wiki/Space_charge), volviendo nuevamente al cátodo si no son atraídos en otro lugar. En esta propiedad están basados los tubos o válvulas termoiónicas. Constan de una cápsula de vidrio donde se ha hecho el vacío, una placa metálica que se conecta al polo positivo y un filamento que al calentarse emite electrones. estos van a la placa o ánodo por el interior de la cápsula, recorren el circuito exterior y vuelven al cátodo. 

La válvula o tubo electrónico más simple es el diodo, que está formado pro dos electrodos llamados placa o ánodo y filamento o cátodo. La placa es un buen conductor metálico. El cátodo puede ser de caldeo directo cuando se trata de un hilo metálico o filamento por el que puede pasar la corriente. También puede ser el cátodo de caldeo indirecto cuando es un tubito de níquel recubierto de una capa de [oxido de calcio](https://es.wikipedia.org/wiki/%C3%93xido_de_calcio) u otro elemento semejante, materiales que emiten electrones con mucha facilidad. Dentro del tubito va el filamento que lo calienta para que emita electrones. 

## Bibliografía

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Euskal Herriko Unibertsitatea](http://www.ehu.es/), Industri Ingeniaritza Teknikorako Unibertsitate Eskola, [Curso de Electrónica Básica en Internet](http://www.sc.ehu.es/sbweb/electronica/elec_basica/)

