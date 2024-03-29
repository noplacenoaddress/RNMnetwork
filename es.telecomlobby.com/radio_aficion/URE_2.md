# Circuitos en corriente alterna. Filtros. Transformadores. Formas de onda no sinusoidales.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/simbolos_resistencias.jpg)

#### 2.1 Circuitos en corriente alterna.

La ley de Ohm se aplica también a circuitos de `CA` siempre y cuando solo haya resistencias o elementos que se comporten como tales.

En el caso existan [bobinas](https://es.wikipedia.org/wiki/Inductor) encontraremos la llamada [reactancia inductiva](https://es.wikipedia.org/wiki/Reactancia_inductiva) y si hay [condensadores](https://es.wikipedia.org/wiki/Condensador_el%C3%A9ctrico) la [reactancia](https://es.wikipedia.org/wiki/Reactancia) [capacitiva](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/Documentos/9_t3s2_c5_html_contex_1.pdf); las dos son consecuencia del desfase que se produce entre tensión y corriente.

#### 2.1.1 Reactancia inductiva.

$$
\begin{align*}
X_L\space=\space 2\pi fL
\end{align*}
$$

La oposición al paso de corriente alterna que presenta una bobina de inductancia `L` se llama reactancia inductiva `XL`. Si la tensión aplicada por el generador es `E`, la su frecuencia `f`, la oposición es explicada por la ecuación sobre escrita. 

Si la `f` es `0` la `XL` también es `0` entonces la bobina se comporta como un conductor permitiendo el paso de la corriente. Mejor dicho <u>una bobina no se opone al paso de la corriente continua</u>.

#### 2.1.2 Reactancia capacitiva. 

$$
\begin{align*}
X_c\space= \frac{1}{2\pi fC}
\end{align*}
$$

Es la oposición `XC` al paso de `CA` que presenta un condensador `C`. A mayor `f` o mayor `C` del condensador corresponderá menor reactancia capacitativa y viceversa. Cuanto mayor sea `C` y `f` mayor intensidad de `CA` atraviesa el condensador. Si `f` es `0` `XC` es infinita porqué el condensador se comporta como un aislante, impidiendo el paso de corriente. 

Un condensador se opone al paso de corriente continua.

#### 2.1.3 Combinación de componentes. Impedancia. 

$$
\begin{align*}
Z\space=\space R+jX
\end{align*}
$$



Se oponen al paso de CA en los circuitos tanto resistencias, cuanto condensadores y bobinas.

La [impedancia](https://es.wikipedia.org/wiki/Impedancia) `Z` de un circuito es la suma de su resistencia `R` y su reactancia `X`. La letra `j` se trata da un [número imaginario](https://es.wikipedia.org/wiki/N%C3%BAmero_imaginario) ya que como hemos visto anteriormente para definir correctamente una reactancia, hay que tener en cuenta tanto su valor absoluto como el ángulo de desfase introducido por las bobinas y/o condensadores del circuito. Una impedancia, pues, debe definirse de tal forma que se conozca su magnitud y el desfasaje que produzca.

#### 2.1.3.1 Circuitos serie.

![](https://github.com/noplacenoaddress/RNMnetwork/raw/master/Images/circuito_resistencia.jpg)

Si intercalamos una resistencia en un circuito recurrido por CA la intensidad según la ley de Ohm es  `I = E/R` y la tensión estará en fase con la intensidad.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_condensador.jpg)

La oposición que opone `C` a la `CA` se llama reactancia capacitiva, presenta menor resistencia al paso de la corriente cuando:

- su capacidad es alta.
- aumenta la frecuencia de la corriente.

Se produce un desfase en el que la intensidad `I` se adelanta a la tensión `E` en 90°.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_bobina.jpg)

La bobina `L` se opone al paso de `CA` a través de reactancia inductiva, proporcional al [coeficiente](https://es.wikipedia.org/wiki/Coeficiente_(matem%C3%A1tica)) de [autoinducción](https://es.wikipedia.org/wiki/Autoinducci%C3%B3n) `L` , a la [pulsación](https://es.wikipedia.org/wiki/Velocidad_angular) `ω` y por consiguiente a la frecuencia `f`. A mayor frecuencia de la `CA`, mayor reactancia inductiva. `L` se opone con más fuerza a los aumentos de la frecuencia se comporta de forma contraria al condensador, la tensión `E` se adelanta de 90° a la intensidad `I`.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_bobina_serie.jpg)

In un circuito con una resistencia y una bobina en [serie](https://es.wikipedia.org/wiki/Circuito_en_serie) como la resistencia no desfasa y la bobina si que lo hace predomina el efecto de `L`. El desfase en este caso es menor de 90° porqué interviene `R`.

Cuando hay condensadores, bobinas y resistencias en un circuito aparecen [tensiones combinadas](http://ingenieriaelectricafravedsa.blogspot.com/2014/11/tensiones-simples-y-compuestas.html) o de conjunto, intensidades combinadas o del conjunto e impedancias. 

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_condensador_serie.jpg)

En los circuitos `R-C` también hay caída de tensión menor de 90°. `R` aminora este desfase. La tensión del conjunto es la suma de la caídas en `R` y `C`.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_bobina_condensador_serie.jpg)

En serie `R-L-C` bobina y condensador ejercen efectos opuestos tanto en reactancia cuanto en caídas de tensión. La impedancia en este caso es la suma de la resistencia de `L` y `C`. La tensión total también es la suma de la caída de tensión en la `R` y la resultante en `L` y `C`. Los valores tensión aplicada se reparten en los distintos componentes `R`, `L` y `C` dependiendo del valor resistivo de cada una de ellas, en cada elemento `R`, `L` y `C` la tensión es el producto de intensidad por resistencia (o reactancia en los casos de `L` y `C`).

Los desfases dependen de los valores de `R`, `L` y `C` y son menores de 90°. Si la reactancia del condensador es mayor que la de la bobina, nos encontramos ante un [circuito inductivo](https://www.fisicapractica.com/inductivos-alterna.php). Si predominan componentes capacitivas será un [circuito capacitivo](https://www.fisicapractica.com/capacitivos-alterna.php). Si se compensan el circuito será [resistivo puro](http://www.proyecto987.es/corriente_alterna_6.html#Circuito_resistivo_puro).

#### 2.1.3.2 Circuitos en paralelo

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_bobina_paralelo.jpg)

Las caídas de tensión en `R` y `L` son iguales dependiendo con la tensión aplicada. La intensidad de línea `I` tiene que ser mayor que la que circula por cada rama, equivaliendo a la [suma pitagórica](https://es.wikipedia.org/wiki/Teorema_de_Pit%C3%A1goras) de ambas.

El desfase es también menor de 90° adelantándose `E` a `I`. Si la reactancia inductiva de la bobina es menor que la resistencia `R` la corriente va por la bobina: circuito inductivo.

Si la reactancia inductiva es mayor que la resistencia `R` la corriente va por la resistencia: el circuito es resistivo.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_condesador_paralelo.jpg)

Con la caída de tensión ocurre igual que en el caso anterior, pero referido a `R` y `C`, en el desfase, siempre menor de 90°, `C` hace que se adelante la intensidad `I` a la tensión `E`. 

Si la reactancia capacitiva es menor que `R` la corriente va por `C`: circuito capacitivo.

Si la reactancia capacitiva es mayor que `R` la corriente va por `R`: circuito resistivo.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/circuito_resistencia_bobina_condensador_paralelo.jpg)

La tensión es la misma en cada rama. La intensidad es según la ley de Ohm la tensión dividida por la resistencia `R` o las reactancias `L` y `C`.

Si la reactancia de `C` es mayor que la de `L`: circuito inductivo.

Si predominan las componentes capacitivas: circuito capacitivo.

Si los componentes son iguales: circuito resistivo puro.

#### 2.2 Circuitos resonantes. 

![](https://upload.wikimedia.org/wikipedia/commons/f/f8/VariacionIZ.jpg)

Circuitos donde se igualen las reactancias inductivas y capacitivas a una determinada frecuencia, llamada [frecuencia de resonancia](https://es.wikipedia.org/wiki/Resonancia_el%C3%A9ctrica):
$$
\begin{align*}
f\space=\space\frac{1}{2\pi\sqrt{LC}}
\end{align*}
$$
`L` es la autoinducción en henrios y `C` la capacidad en faradios. 

Por debajo de la resonancia predomina el carácter inductivo porque la corriente pasará mejor por la bobina que por el condensador. Por encima el circuito será capacitivo porqu el condensador para estas frecuencias presenta menos dificultades al paso de la corriente.

La intensidad será por la ley de Ohm la tensión dividida pro la impedancia del conjunto `I=E/Z`

##### Resonante serie

La tensión es la misma en los terminales de la autoinducción que en los terminales de la capacidad, se reduce al mínimo y la intensidad es máxima.

Se pueden conseguir corrientes muy elevadas haciendo que la resistencia sea muy pequeña y puede el circuito entregar tensiones mucho mayores que las que recibe.

La [curva de resonancia](https://es.wikipedia.org/wiki/Resonancia#Curva_de_resonancia_universal) nos dice que la corriente varía según sea la frecuencia. Al variar `R`, la frecuencia de resonancia no varía. Si aumenta `R` la intensidad disminuye pero si `R` es muy grande pierde el circuito la facultad de seleccionar tensiones y no habrá diferencias entre las corrientes que circulan a la frecuencia de resonancia y las que lo hacen a otras frecuencias. 

Si `f` es baja el condensador se opone más, habrá un efecto de reactancia capacitiva. Si aumentamos la frecuencia llegan a igualarse la reactancia capacitiva y la inductiva, haciéndose la impedancia mínima; coincide entonces con la frecuencia de resonancia y el circuito resuena. La impedancia se reduce a `R` y entonces la intensidad es máxima.

Por encima de esta frecuencia la oposición al paso es de efecto inductivo ya que la bobina `L` presente siempre pegas al aumento de la frecuencia al contrario del condensador `C`. Al ejercer la bobina un efecto inductivo alto el circuito se comporta como capacitivo, discurre mayor corriente a toda ella por la capacidad o condensador.

En condiciones de resonancia se compensan los desfases entra `I` y `E`, el condensador adelanta a la intensidad y en la bobina en cambio se adelante la tensión `E`, ambas de 90°. La curva que representa la intensidad es exactamente opuesta a la curva que representaría la impedancia. 

##### Resonante paralelo

![](https://upload.wikimedia.org/wikipedia/commons/1/1d/Tuned_circuit_animation_3.gif)

La tensión de alimentación se origina fuera del circuito, no así en el resonante en serie. Toma el nombre de [circuito tanque](https://es.wikipedia.org/wiki/Circuito_LC) el que contiene una inducción `L` y una capacidad `C` sin fuente de alimentación por su facultad de almacenar energía perdiéndola y restituyéndola cíclicamente. 

El circuito tanque ideal está formado por una combinación `LC` en paralelo con las reactancias `RL` y `RC` iguales. 

La corriente de línea que entrega el generador es la intensidad en `L` menos la intensidad en `C`.

La impedancia `Z` es el producto de las reactancias en `L` y `C` dividido por su suma, como que son iguales y de signo contrario resulta que:

- El [denominador](https://es.wikipedia.org/wiki/Fracci%C3%B3n) se anula, por lo que Z tiende a infinito. 
- La corriente de línea en resonancia en este circuito se hace cero.

En el interior del tanque la corriente es muy grande, aunque la de línea sea cero.

#### 2.2.1 Características de los circuitos resonantes.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/XC12548.svg)

La anchura de banda `B`, banda de paso o [pasabanda](https://es.wikipedia.org/wiki/Pasabanda) de un circuito resonante es el número de ciclos a un lado y otro de la frecuencia de resonancia que prácticamente proporciona la misma corriente. Se define por convención como aquel margen en que la energía de la señal es igual o mayor a la mitad de energía máxima, esto es el margen comprendido entro los puntos donde el valor de la tensión o de la corriente está 6 `dB` por debajo del valor máximo.

Concepto de factor de calidad delos circuitos resonantes: dado que `L` y `C` se eligen para que el conjunto resuene a determinada frecuencia y que esa [frecuencia de resonancia](https://es.wikipedia.org/wiki/Frecuencia_de_resonancia) puede conseguirse con distintos conjuntos los cuales tendrán mayor o menos dispersión en la curva de selectividad.
$$
\begin{align*}
Q\space=\space\frac{F_{res}}{B}
\end{align*}
$$


El [factor de calidad](https://es.wikipedia.org/wiki/Factor_de_calidad) `Q`  es la relación que hay entre la frecuencia de resonancia y su ancho de banda. Para los circuitos en serie y paralelo se convierte en:
$$
\begin{align*}
Q\space=\space\frac{2\pi fL}{R_s}\\
Q\space=\space\frac{R_p}{2\pi fL}
\end{align*}
$$
`Q` es la facultad que tiene dicho circuito para seleccionar una frecuencia eliminando las demás. A mayor `Q` mayor agudeza en la curva de resonancia. La curva de un circuito de alta calidad, `Q` alto, será una curva muy estrecha; `Q` bajo corresponde a una cima más suave y baja, las variaciones de corriente serán más pequeñas y la curva será [chata](https://dle.rae.es/chato). A mayor `R` menor factor de calidad `Q`.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/Radio%20Astor%20modelo%20PS.gif)

En los circuitos de radio y TV los circuitos serie son sistemas de resonancia con un factor `Q` de valores entra `50` y `200`. Hay diferencias entre  de una bobina y el de un condensador, ambos tienen su `Q` propio; se eligen según la frecuencia a que deba resonar el conjunto, influyendo más `L`. `L` tiene un `Q` bajo y `C` alto; para altas frecuencias se requiere `Q` alto.

#### 2.3 Comportamiento de resistencias, condensadores y bobinas reales en altas frecuencias.

Hay que tener en cuenta que `R`, `C` y `L` a altas frecuencias, mayor de  [1 MHz](https://es.wikipedia.org/wiki/Megahercio), no presentan un valor igual a su nominal, debido sobre todo a la aparición de capacidades e [inductancias parásitas](http://rubensm.com/el-inductancia-parasita-serie-de-un-condensador/).

En la utilización de estos elementos en [filtros](https://es.wikipedia.org/wiki/Filtro_paso_banda) para supresión de interferencias hay que tener bien en cuenta su comportamiento real ya que se pueden hasta comportar de forma opuesta a la deseada, hecho de tener bien en cuenta en el diseño de los circuitos.

La resistencia en continua difiere de la resistencia en alterna, en esta última crece al aumentar la frecuencia debido al efecto pelicular.

Los condensadores no presentan solo una capacidad sino que tienen asociadas una resistencia e inductancia, debidas a los terminales y a la estructura del componente. Al aumentar la frecuencia disminuye la reactancia de un condensador y viceversa.

Las bobinas presentan, además de la inductancia, una resistencia en serie y una capacidad distribuida en el bobinado. Por ello a alta frecuencia la inductancia equivalente puede ser negativa es decir, el inductor se puede comportar como un condensador. Por lo tanto el factor de calidad real es siemrpe inferior al teórico.

#### 2.4 Filtros.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/radio%20espa%C3%B1ola.jpg)

En los sistemas de comunicación necesitamos acoplar diferentes circuitos bien sea para transferir una señal o bien para eliminar otras. Dos circuitos están acoplados cuando una tensión o corriente en una red produce otra tensión corriente en la otra. Puede ser deseado o indeseado como consecuencia de un error de diseño.

Existen numerosas configuraciones para realizar el acoplamiento entre dos circuitos siendo desde le punto de vista de la radio afición las más interesantes los filtros y las llamadas redes en [escalera](https://es.wikipedia.org/wiki/Red_R-2R).

Los filtros son redes que permiten o detienen el paso de una terminada frecuencia o grupo de frecuencias, banda de frecuencias. Un filtro es un circuito con al menos un elemento reactivo, `L` o `C`. Los que tienen solo un elemento toman el nombre de «filtro de primer orden» siguiendo así de par en par con el número de elementos. 

La principal característica de un filtro es su frecuencia de corte, que delimita la banda de frecuencias que pasan o no por el filtro.

Además de que lo podemos clasificar en pasivos o activos:

- <u>pasivos</u>: formados por combinaciones serie o paralelo de elementos pasivos `R`, `L` o `C`.
- <u>activos</u>: aquellos que emplean dispositivos activos como [transistores](https://es.wikipedia.org/wiki/Transistor) o [amplificadores operacionales](https://es.wikipedia.org/wiki/Amplificador_operacional) conjuntamente a `R`, `L` o `C`. 

Según su uso se pueden clasificar en:

- <u>paso alto</u>.
- <u>paso bajo</u>.
- <u>paso de banda</u>.
- <u>supresión de banda</u>.

#### 2.4.1 Filtros compuestos de elementos pasivos: paso alto, paso bajo, paso de banda, supresión de banda. Ancho de banda.

![](https://musiki.org.ar/images/2/2f/Captura_de_pantalla_2016-10-09_a_la%28s%29_10.16.52_a.m..png)

Paso alto el que permite paso de frecuencias desde una determinada hacia arriba; paso bajo es aquel que permite el paso de frecuencias bajas desde la frecuencia 0 o continua hasta una determinada.

Un filtro pasa banda o supresión de banda es el que permite o impide el paso de componentes de frecuencia dentro de un determinado rango, comprendido entre una frecuencia de corte superior y otra inferior. Es una combinación de paso alto y paso bajo. Si se modifican estas frecuencias de corte, se modifica el rango de frecuencias, ampliando o disminuyendo las frecuencias que pueden pasar por él.

Diremos pues que el ancho de banda de un filtro es la anchura, medida en hercios, del rango de frecuencias en el que se concentra la mayor parte de la potencia de la señal. Como veremos más adelante puede ser calculado a a partir de una señal temporal mediante el [análisis de Fourier](https://es.wikipedia.org/wiki/An%C3%A1lisis_de_Fourier).

#### 2.4.2 Redes en escalera. Factor de calidad de un circuito sintonizado.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/red_escalera.svg)

## 

Las redes en escalera son redes formadas por combinaciones en serie y paralelo de inductancias y condensadores, en ocasiones hay también resistencias, además de las propias internas de los componentes. En caso no haya se dicen redes no disipativas, no consuman potencia.

El funcionamiento de un filtro se basa en la combinación de dos principios:

- Al aumentar f disminuye la reactancia de C y viceversa.
- Al aumenta f aumenta la reactancia de L y viceversa.

Recordemos que la reactancia capacitiva es negativa mientras que la inductiva es positiva. Su suma puede ser 0 aunque ninguna de las dos sean nulas.
$$
\begin{align*}
Q\space=\space\frac{2\pi fL}{R_s}\space=\space\frac{R_p}{2\pi fL}\space=\space\frac{frecuencia\space de\space resonancia}{Ancho\space de\space banda}
\end{align*}
$$
La caída de voltaje sobre la bobina o el condensador es `Q` veces el voltaje aplicado, el valor de `Q` para un circuito resonante serie tiene su mayor importancia cuando se consideran circuitos de equipos de radio aficionado, donde es necesario que se lo más alto posible, pues de ese factor dependerá la sobre tensión que pueda obtenerse.

#### 2.4.3 Respuesta en frecuencia.

![](http://www2.imse-cnm.csic.es/~rafael/SETI/escaRCact2.gif)

En cada filtro hay dos zonas principales llamadas [banda de paso y banda de atenuación](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/SETI/tema2.pdf). En la banda de paso, es donde las frecuencias pasan con un máximo de su valor, o hasta un valor del `50%` con respecto a su original y con una atenuación de `6 dB`, a partir de aquí nos encontramos en la banda de atenuación.

#### 2.4.4 Filtro en PI y filtro en T.

![](https://raw.githubusercontent.com/noplacenoaddress/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/filtro_PI.svg)

Se llama [filtro en PI](https://es.wikipedia.org/wiki/Filtro_electr%C3%B3nico) a lo que tiene uno de sus brazos en serie y dos paralelos y cuya configuración se asemeja a la letra griega π.

Se llama filtro en T a lo que tiene uno de sus brazos en serie y otro en paralelo y cuya configuración se asemeja a la letra T.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/filtro_T.svg)

#### 2.4.5 filtro de cristal de cuarzo.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/cristales-de-cuarzo.jpg)

Basado en un circuito sintonizado, o resonante, de muy elevada selectividad que utiliza uno o más cristales de cuarzo.

El cuarzo es un mineral cristalino de sílice en el que se descubrieron hacia 1930 [propiedades piezoelectricas](https://es.wikipedia.org/wiki/Piezoelectricidad), tales que el mineral cuando comprimido produce una separación de cargas eléctricas que genera a su vez una diferencia de potencial y reacciona mecánicamente cuando se somete a cun cierto voltaje.

El cristal de cuarzo se usa como componente de control de la frecuencia de circuitos osciladores convirtiendo las vibraciones mecánicas en voltajes eléctricos a una frecuencia específica, dado que presenta un comportamiento resonante. Así como un [péndulo](https://es.wikipedia.org/wiki/P%C3%A9ndulo) oscila a una frecuencia propia si, tras darle impulso, se le deja moverse libremente, un cristal de cuarzo sometido a un estímulo eléctrico puede continuar vibrando a una cierta frecuencia. Si se mantiene el estímulo de manera periódica y sincronizada, tendremos una [señal](https://es.wikipedia.org/wiki/Se%C3%B1al_el%C3%A9ctrica) a una frecuencia extraordinariamente precisa. Es la contrapartida electrónica de un reloj de péndulo. 

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/equi_cristal.svg)

La gama de frecuencias de resonancia va desde las [frecuencias audibles](https://es.wikipedia.org/wiki/Espectro_audible) hasta varios centenares de MHz y tiene un bajo [coeficiente de expansión](https://es.wikipedia.org/wiki/Coeficiente_de_dilataci%C3%B3n) por temperatura lo que permite construir dispositivos electrónicos muy estables dentro de un amplio rango de temperaturas. Para aplicaciones que demandan una extremada estabilidad, se colocan en los llamados «hornos de cristal» que son receptáculos calentados mantenidos a una temperatura constante.

`C0` representa la capacidad dentro los electrodos del cristal más la capacidad de la carcasa y sus terminales. R1, C1 y L1 conforman la rama principal del cristal y se conocen como componentes o parámetros «de movimiento», siendo:

-  `L1` la masa vibrante del cristal.
- `C1` la classicidad del cuarzo.
- `R1` las pérdidas producidas dentro del cristal.

Los filtros de cristal de cuarzo tienen `Q` mucho más alto que los basados en `L`, `C` y `R`. Se construyen para ser utilizados como filtros de paso bajo, paso alto, paso banda o supresión de banda.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/filtro_cristal.png)

#### 2.4.6 Efectos debidos a componentes reales

Los componentes no siempre se comportan según el modelo ideal de diseño. Fundamentalmente la presencia de capacidades parásitas, las variaciones del valor y comportamiento de los distintos componentes y las pérdidas de inserción, nos obligan a la realización de pruebas para evaluar su comportamiento y efectuar las correcciones pertinentes con el fin de cumplir con las especificaciones de diseño.

#### 2.5 Aplicación y uso de los transformadores. Transformador ideal.

$$
\begin{align*}
P_{prim}\space=\space P_{sec}
\end{align*}
$$

Es un dispositivos compuesto por al menos dos bobinas acopladas una conectada a una fuente de energía eléctrica denominada primario y otra que recibe la energía inducida denominada secundario.

Un transformador ideal es aquel que no tiene pérdidas.

Se emplean para transferir energía eléctrica entre dos circuitos independientes, desde uno a otro, mediante inducción y en esa trasferencia es posible cambiar la tensión existente en el primario en otra más alta igual o menos en el secundario. 

Se emplea un núcleo de material magnetizable para que al aumentar la inductancia de las bobinas puedan tener un menor número de espiras. El secundario comunica la corriente a un circuito de utilización. el primario conectado a un fuente de alimentación alterna e recurrido pro una corriente produciendo en su núcleo un flujo alterno de igual frecuencia; así induce en el secundario una fem alterna de la misma frecuencia que la aplicada en el primario. La potencia aplicada en el primario es igual a la obtenida en el secundario salvo las pérdidas en los devanados y el núcleo. Su rendimiento es:
$$
\begin{align*}
RENDIMIENTO\space=\space \frac{Potencia\space útil}{Potendia\space útil\space+\space pérdidas}\space=\space\frac{Potencia\space útil}{Potencia\space real}
\end{align*}
$$
Los devanados deben estar bien aislados para evitar cortocircuitos.

#### 2.5.1 Relación entre número de espiras y tensión.

$$
\begin{align*}
Relación\space de\space transformación\space = \space \frac{n_{sec}}{n_{prim}}
\end{align*}
$$

Se llama [relación de transformación](https://es.wikipedia.org/wiki/Dise%C3%B1o_de_transformadores#Relaci%C3%B3n_de_transformaci%C3%B3n) a la relación que hay entre el número de espiras del primario y el número de espiras del secundario. Si se trata del trasformador ideal, esta relación es la misma que hay entre las tensiones del primario y del secundario. O sea que las tensiones en cada devanado son proporcionales al número de espiras que lleva:
$$
\begin{align*}
\frac{E_{sec}}{E_{prim}}\space=\space\frac{n_{sec}}{n_{prim}}
\end{align*}
$$

#### 2.5.2 Relación entre número de espiras y corriente.

$$
\begin{align*}
\frac{I_{sec}}{I_{prim}}\space=\space\frac{E_{prim}}{E_{sec}}\space=\space\frac{n_{prim}}{n_{sec}}
\end{align*}
$$

Las intensidades son inversamente proporcionales a los devanados y tensiones propias. Es el único dato inversamente proporcional a los anteriores.

Como las potencias son iguales en abos devanados, si es uno de ellos `I` es mayor `E` será menor para que la potencia `W` se mantenga constante `W=EI`.

#### 2.5.3 Relación entre número de espiras e impedancia. 

La impedanca es la propiedad que tiene un componente para limtar el paso de la corriente a través de un circuito.

La transformación o cambio de impedancia del primario al secundario es proporcional al cuadrod de la realación de espiras entre primera y secundario.

Siendo `N` realación de epsieras entre el bobinado primario y el secundario:
$$
\begin{align*}
N\space=\space\frac{E_{sec}}{E_{prim}}\space=\space\frac{I_{sec}}{I_{prim}} \\
N²\space=\space\frac{Z_{sec}}{Z_{prim}}
\end{align*}
$$

#### 2.5.4 Tipos de transformadores.

![](https://upload.wikimedia.org/wikipedia/commons/3/33/Transformer3d_col3_es.svg)

Generalmente llevan núcleo de hierro cuando se usan en bajas frecuencias y núcleo de aire o de ferrita para las altas frecuencias.

Los transformadores de núcleo de hierro se componen de un núcleo de [hierro dulce](https://es.wikipedia.org/wiki/Hierro_forjado) laminado a cuyo alrededor hay dos o más devanados o bobinas independientes entre sí llamados primario y secundario. Los encontramos en [fuentes de alimentación](https://es.wikipedia.org/wiki/Fuente_de_alimentaci%C3%B3n) y pasos de audio de equipos antiguos. Caso particular aquellos que toman el nombre de [autotransformadores](https://es.wikipedia.org/wiki/Autotransformador) que tienen solo un devanado del que derivan las conexiones del primario y del secundario.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/transformador_RF.svg)

Transformadores RF cuyas bobinas suelen estar devanadas sobre un soporte de [baquelita](https://es.wikipedia.org/wiki/Baquelita) o de cartón son de núcleo de aire o de ferrita para facilitar los ajustes entra etapas. En los acoplamientos por transformador el transformador hace variar la tensión manteniendo igual la potencia, adaptando además los valores de la corriente y tensión en cada circuito. Estos transformadores de acoplamiento deben calcularse para una frecuencia determinada de trabajo y ser ajustables para adaptar las impedancias, lo que se logra induciendo generalmente un núcleo de ferrita. 

#### 2.6 Formas de onda no sinusoidales.

Existen numerosos tipos de formas de onda eléctricas de CA que no son de forma sinusoidal:

- Ciertas señales de audio.
- Las ondas cuadradas y rectangulares.
- Las ondas triangulares y en diente de sierra.
- Los pulsos y flancos o escalones.

#### 2.6.1 Señales de audio.

![](https://w3.ual.es/~vruiz/Docencia/Apuntes/Transduction/Audio/amplificacion.png)



Una señal de audio es una señal electrónica que es una representación eléctrica exacta de una señal sonora. Está acotada dentro del rango de frecuencias audibles pro los seres humanos desde los 20 hasta los 20.000 hercios.

![](https://upload.wikimedia.org/wikipedia/commons/9/9b/Ondes_compression_2d_20_petit.gif)

Dado que el sonido es una [onda de presión](https://es.wikipedia.org/wiki/Onda_de_presi%C3%B3n) se requiere un [transductor](https://es.wikipedia.org/wiki/Transductor) que convierte las ondas de presión de aire, [ondas sonoras](https://es.wikipedia.org/wiki/Onda_sonora), en señales eléctricas analógicas. La conversión contraria se realiza mediante un altavoz.

Una señal de audio se caracteriza por su dinámica en cuanto a valor de pico, rango dinámico, potencia, [relación señal-ruido](https://es.wikipedia.org/wiki/Relaci%C3%B3n_se%C3%B1al/ruido) y por su espectro de potencia, ancho de banda, [frecuencia fundamental](https://es.wikipedia.org/wiki/Frecuencia_fundamental), [armónicos](https://es.wikipedia.org/wiki/Arm%C3%B3nico), [distorsión armónica](https://es.wikipedia.org/wiki/Distorsi%C3%B3n_arm%C3%B3nica).

Por ejemplo una señal que representa voz humana, una señal vocal transformada de una [señal de voz](https://es.wikipedia.org/wiki/Se%C3%B1al_de_voz), no suele tener información relevante más allá de los 10000 hercios y de hecho en telecomunicaciones se toman solo primeros 3500 hercios; con unos 2000 hercios basta para que la voz sea comprensible pero no para reconocer al hablante.

#### 2.6.2 Ondas cuadradas y rectangulares. Presentación gráfica en función del tiempo.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/tipos-ondas-blog.png)

Las ondas cuadradas son las que pasan de un estado a otro de tensión, a intervalos regulares en un tiempo muy reducido. Son utilizadas usualmente para probar amplificadores debido a que este tipo de señales contienen en sí mismas todas las frecuencias. La televisión la radio y los ordenadores utilizan mucho este tipo de señales, fundamente como temporizadores.

Las rectangulares se diferencian de las cuadradas en no tener iguales los intervalos en los que la tensión permanece a nivel alto y bajo. Importantes para analizar circuitos digitales.

#### 2.6.3 Ondas triangulares y en diente de sierra. Pulsos y flancos o escalones.

![](https://upload.wikimedia.org/wikipedia/commons/8/82/Sawtooth-td_and_fd.png)

Generadas por una serie de circuitos diseñados para controlar voltajes linealmente, como puede ser el barrido horizontal de un osciloscopio analógico o el barrido tanto horizontal cuanto vertical de una televisión. Las transiciones entre nivel mínimo y máximo de la señal cambian a un ritmo constante, se denominan rampas.

La onda en [diente de sierra](https://es.wikipedia.org/wiki/Onda_de_sierra) es un caso especial de señal triangular con una rampa descendente de mucha más pendiente que la rampa ascendente. 

Otras como los [flancos](https://es.wikipedia.org/wiki/Flanco_(electr%C3%B3nica)) o los pulsos se denominan señales [transitorias](https://es.wikipedia.org/wiki/R%C3%A9gimen_transitorio_(electr%C3%B3nica)). Un flanco indica un cambio repentino en el voltaje, por ejemplo cuando se conecta un interruptor de alimentación, el pulso en este caso indicaría que se ha conectado el interruptor y un determinado tiempo se ha desconectado. Se encuentran en ordenadores, equipos de rayos X y comunicaciones.

#### 2.6.4 Onda fundamental y armónicos superiores.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/tumblr_inline_p9qoqj5U381t7xk4o_500.png)

Una función periódica no sinusoidal puede ser descompuesta en la suma de una función sinusoidal de la frecuencia fundamental y de otras funciones sinusoidales, cuyas frecuencias son múltiplos enteros de la frecuencia fundamental. Estas adicionales son conocidas como componentes armónicas o armónicos.

#### 2.6.5 Ruido; térmico del receptor, de banda, densidad de ruido, potencia de ruido en la anchura de banda del receptor.

![](https://upload.wikimedia.org/wikipedia/commons/2/26/White_noise_image.png)

El término ruido en radiocomunicación se utiliza para denominar las señales no deseadas que aparecen, sobre las que no tenemos ninguna capacidad de control y que limitan su capacidad de recepción. Puede ser natural o artificial.

El ruido artificial aparece como consecuencia de actividades industriales; tracción de vehículos, transporte y distribución de energía eléctrica. El espectro del ruido artificial disminuye conforme aumenta la frecuencia. Un tipo de ruido artificial que existen en todas las bandas de frecuencia es el ruido impulsivo que se genera en fluorescentes, motores, pantallas de televisión y ordenador que se caracteriza por su elevada amplitud y corta duración.

Las fuentes naturales de ruido se modelan con una densidad espectral de potencia plana. Las fuentes naturales se clasifican en externas e internas al sistema.

Las externas se deben a la radiación producida por elementos naturales como la Tierra o el Sol y a los efectos del medio como lluvia, gases atmosféricos vegetación, sobre esta radiación.

Las internas se encuentran en los propios circuitos pasivos de conexión de la antena al receptor y en el propio receptor. 

El [ruido térmico](https://es.wikipedia.org/wiki/Ruido_de_Johnson-Nyquist) es una perturbación de carácter aleatorio que aparece de forma natural en los conductores por agitación de los electrones; aumenta su potencia conforme aumenta la temperatura. Se puede considerar con [densidad espectral](https://es.wikipedia.org/wiki/Densidad_espectral) uniforme en una gama particular de frecuencias de trabajo. 

El [ruido de banda](https://es.wikipedia.org/wiki/Ruido_blanco) es aquel cuya densidad espectral de potencia es constante y no depende de la frecuencia.

En un receptor, la señal, junto con el ruido suele pasar por filtros suficientemente selectivos para dejar pasar solo la señal. El tipo de filtro empleado suele ser un filtro de banda estrecha cuya frecuencia central es grande comparada con su ancho de banda. El ruido que puede aparecer después de este filtro se llama ruido de banda estrecha.

La potencia media de ruido es la que se entrega al receptor visto como una carga, y su valor máximo se puede obtener en condiciones de adaptación de impedancias. Su expresión es:
$$
\begin{align*}
P_M\space=\space kTB
\end{align*}
$$
`k` es la [constante de Boltzmann](https://es.wikipedia.org/wiki/Constante_de_Boltzmann), `T` la temperatura absoluta en [Kelvin](https://es.wikipedia.org/wiki/Kelvin) y `B` el ancho de banda en hercios.

#### 2.7 Las ondas de radio como ondas electromagnéticas. Velocidad de propagación y su relación con la frecuencia y la longitud de onda. Polarización.

![](https://www.areatecnologia.com/imagenes/onda-electromagnetica.jpg)

Las ondas radio son una forma de radiación electromagnética y gracias a esta característica, debidamente utilizada, es posible transmitir información de un punto a otro. 

No precisas de un medio material para desplazarse, pasan a través de los materiales aislantes, del aire y del vacío.

La velocidad de propagación de las ondas electromagnéticas en el vacío es la misma que la de la luz, es decir unos 300000 km/s. En otros medios es distinto.

Las ondas de radio, como cualquier otra radiación electromagnética, tienen dos campos, uno eléctrico y otro magnético que son variables y se encuentran siempre perpendiculares entre sí y con la dirección de propagación de la onda.

Si imaginamos los tres [ejes de coordenadas](https://es.wikipedia.org/wiki/Coordenadas_cartesianas) `X`, `Y` y `Z` que forman entre sí ángulos de 90°, si `X` es la dirección de propagación de la onda, el campo eléctrico seguirá el eje `Y` y el magnético `Z`.

Se denomina [longitud de onda](https://es.wikipedia.org/wiki/Longitud_de_onda) el espacio que recorre la onda durante un periodo o ciclo.

La relación entre longitud de onda, su velocidad de propagación en el vacío y su frecuencia viene dada por la conocida expresión:
$$
\begin{align*}
\lambda\space=\space\frac{300000}{f}
\end{align*}
$$
Para conocer la velocidad de propagación de una onda de una longitud determinada utilizaremos la expresión:
$$
\begin{align*}
v\space=\space \lambda f k
\end{align*}
$$
siendo `k` la constante dieléctrica del medio distinto al vacío. 

Se llama [polarización](https://es.wikipedia.org/wiki/Polarizaci%C3%B3n_electromagn%C3%A9tica) de una onda a la posición que ocupa el campo eléctrico de la misma con respecto a la superficie de la Tierra.

## Resumen secundo capitulo 

- **Ondas electromagnéticas**
  - La ondas de radio son de naturaleza electromagnética.
  - La velocidad de propagación de las ondas es de 300000 km/s.
  - La ondas de radio están formadas por un campagnético y otro eléctrico perpendiculares entre sí.
  - La longitud de onda es igual a 300 dividido la frecuencia en megaciclos. `L=300/F`
  - La corriente que se genera para uso domestico es alterna.
  - En la corriente alterna los polos cambian continuamente; en continua, los polos permanecen siendo siempre o positivo o negativo.
  - Los alternadores o generadores tienen colectores.
  - Un ciclo se completa cuando una onda toma todos sus valores positivos y negativos.
  - Toda onda tienen un semiciclo positivo y otro negativo.
  - Se llama cresta al valor máximo de una onda.
  - Se llama seno al valor mínimo de una onda.
  - Se llama nodo al punto en el que la onda vale cero.
  - Longitud de onda en metros es el tamaño físico del ciclo.
  - Periodo es el tiempo que tarda en completarse un ciclo.
  - Elongación el valor que toma la onda en un momento concreto.
  - Frecuencia es la cantidad de ciclos que se completan en un segundo.
  - Se denomina hercio a un ciclo por segundo.
  - Valor pico a pico de una onda es el valor entre su máximo y su mínimo.

## Bibliografía

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Símbolos eléctricos & electrónicos](https://www.simbologia-electronica.com/). 
- [Xcircuit](http://opencircuitdesign.com/xcircuit/)
- Física práctica - [Electricidad](https://www.fisicapractica.com/electricidad.php). 
- Proyecto 987 - [Corriente alterna](http://www.proyecto987.es/corriente_alterna_0.html).
- Tecnológico de Costa Rica, William Marin, «[sistemas de comunicaciones - conceptos básicos](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/Documentos/conceptos_basicos_previos.pdf)». 
- [Xcircuit tutorial](http://opencircuitdesign.com/xcircuit/tutorial/).
- [Rubén Sánchez - electrónica](http://rubensm.com/category/electronica/).
- [ngspice](http://ngspice.sourceforge.net/) 
- ngspice - [manual](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/Documentos/ngspice-manual.pdf). 
- [Rafael Domínguez Castro](http://www2.imse-cnm.csic.es/~rafael/), [SETI](http://www2.imse-cnm.csic.es/~rafael/SETI/).
- [Lessons in Electric Circuits](http://www.ibiblio.org/kuphaldt/electricCircuits/)
- [Vicente González Ruiz](https://vicente-gonzalez-ruiz.github.io/), [Transducción de Señales de Audio](https://w3.ual.es/~vruiz/Docencia/Apuntes/Transduction/Audio/index.html)
- [Temario simplificado del libro de examen de Radioficionado](https://github.com/redeltaglio/RNMnetwork/raw/master/es.telecomlobby.com/radio_aficion/Documentos/89754710-Temario-Simplificado-Del-Libro-de-Examen-de-Radio-Aficionado.pdf), Juan Antonio Moran `EA4VJ`