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

El rectificador de onda completa convierte la totalidad de la forma de onda de entrada en una polaridad constante en la salida mediante la inversión de las porciones negativas o positivas de la forma de onda de entrada. Las porciones positivas o negativas se combinan en las inversas para producir una forma de onda continua únicamente en un semiciclo. 

La tensión es rectificada durante el primer semiciclo por el diodo `D1` y durante el segundo por el diodo `D2` de forma que a la carga `R` le llega una tensión continua pulsante muy impura ya que no está filtrada ni estabilizada. 

En este circuito tomamos el valor de potencial cero en la toma intermedia del secundario del transformador.

| ![](https://upload.wikimedia.org/wikipedia/commons/9/91/Tensi%C3%B3n_sinusoidal.png) | ![](https://upload.wikimedia.org/wikipedia/commons/3/34/Diodebridge-eng.gif) | ![](https://upload.wikimedia.org/wikipedia/commons/3/37/Tensi%C3%B3n_rectificada_onda_completa.png) | ![](https://upload.wikimedia.org/wikipedia/commons/8/8b/Diode_bridge.svg) |
| ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ | ------------------------------------------------------------ |

El [rectificador en puente](https://es.wikipedia.org/wiki/Puente_rectificador) es un rectificador de onda completa que pero no necesita de un transformador con toma central.

Monta cuatro diodos `D1`, `D2`, `D3` y `D4`. Tenemos que durante el semiciclo en que el punto superior del secundario del transformador es positivo con respecto al inferior de dicho secundario, la corriente circula a través de `D1`, `R` y `D4` y en el punto inferior del secundario.  En el semiciclo siguiente, cuando el punto superior del secundario es negativo y el inferior positivo la corriente circula por `D2`, `R` y `D3` y el punto superior del secundario. En este caso circula corriente por la carga `R` y en el mismo sentido en el os dos semiciclos con lo que se aprovechan ambos y se obtiene una corriente rectificada más uniforme que en el caso del rectificador de media, donde durante un semiciclo se interrumpe la circulación de corriente por la carga. 

En ambos tipos de rectificadores de onda completa, la forma de onda de la corriente rectificada de salida, será la de una corriente continua pulsatoria, pero con una frecuencia de pulso doble de la corriente alterna de alimentación. 

#### 4.1.2 Circuitos de filtrado

La `CC` que se obtiene a la salida de los rectificadores es pulsante, resulta adecuada para la mayoría de las aplicaciones electrónicas ya que tiene un rizado. Para evitar este inconveniente se procede a un filtrado para eliminar al rizado. El filtrado consiste en la reducción del rizado a un valor mucho más pequeño que la señal de salida de la fuente y se realiza mediante circuitos de filtro, generalmente con configuración en «PI»  formada por un condensador, una bobina de alta inductancia y poca resistencia y otro condensador con lo que se consigue una salida de `CC` utilizable en los distintos circuitos que alimente.

Los condensadores se cargan al valor máximo de tensión entregada por el rectificador y se descargan lentamente cunado la señal pulsante desaparece. Producen pues, junto con la bobina, una gran disminución del rizado.

#### 4.1.3 Circuitos de estabilización y regulación en fuentes de bajo voltaje.

La tensión continua disponible a la salida del rectificador puede que varía su valor ante un cierto tipo de perturbaciones, como variaciones de la tensión de entrada, de la carga o de la temperatura.

En estos casos se necesitan circuitos de regulación o estabilización para conseguir que la tensión continua a utilizar sea lo más constante posible. 

Lo ideal sería que la tensión de salida fuera constante para cualquier condición del circuito pero esto es imposible debido a que:

- La tensión de red puede llegar a tener variaciones de hasta el 20% de su valor nominal.
- El circuito de carga conectado al rectificador puede absorber más o menos corriente. Al aumentar la corriente por la carga, la tensión de salida disminuirá debido a la caída en la resistencia del transformador y la de los diodos.
- En la salida aparece un cierto rizado.
- Cuando se utilizan dispositivos semiconductores, la tensión de salida varia con la temperatura.

Para corregir este tipo de problemas se emplean dos técnicas distintas:

- <u>Fuentes estabilizadas</u>: consiguen la estabilización del valor de salida tensión o corriente utilizando directamente la característica de un dispositivo electrónico.
- <u>Fuentes reguladas</u>: consiguen la estabilización de la magnitud de salida mediante un sistema de control o de realimentación negativa que corrige automáticamente le valor a la salida.

#### 4.1.4 Fuentes de alimentación conmutadas, aislamiento y EMC (compatibilidad electromagnética).

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/c2ec4c96-compatibilidade_eletromagnetica_es.jpg)

Las fuentes de alimentación conmutadas son las utilizadas en casi todos los tipos de sistemas diseñados y vendidos hoy en día. Reemplazan las antiguas fuentes de alimentación lineales que eran más grandes menos eficaces y más costosas.

Las fuentes conmutadas son tan pequeñas y livianas porque utilizan transformadores mucho más pequeños, pero mucho más eficientes la hacerlos funcionar en vez de a `50Hz` a varias decenas de `kHz` de ahí su posibilidad de crear interferencias.

Su tecnología es una de las razones por las que los equipos modernos son más pequeños, se calientan menos y son más económicos. Constan como mínimo de:

- rectificador
- conmutador
- transformador
- otro rectificador 
- salida

Son convertidores `CC-CC` por lo que la tensión de red debe ser previamente rectificada y filtrada con una amplitud de rizado aceptable, en un rectificador de entrada. 

La regulación se obtiene con el conmutador, normalmente un [circuito PWM](https://es.wikipedia.org/wiki/Modulaci%C3%B3n_por_ancho_de_pulsos)  que cambia el ciclo de trabajo.

Las funciones del transformador son las mismas que para fuentes lineales pero su posición es diferente. 

El segundo rectificador convierte la señal alterna pulsante que llega del transformador en un valor continuo.

La salida puede ser también un filtro de condensador o uno de tipo `LC`.

Por su forma de funcionamiento requieren que su diseño tenga en cuenta las necesidades de aislamiento y generación de señales espurias de RF.

La entrada en vigor en 2001 de la [norma](https://es.wikipedia.org/wiki/Norma_UNE) ES 605555-2 sobre el factor corrector de potencia ha obligado a nuevos desarrollos. El principal motivo de esta normativa es que por la forma de trabajo de las fuentes de alimentación conmutadas, suelen generar distorsiones en la línea eléctrica pudiendo influir en el funcionamiento de otros equipos electrónicos conectados. Las fuentes de alimentación con PFC «Power Factor Correction» principalmente reducen los armónicos re inyectados a la red mediante un filtro activo que corrige la forma de la onda de la corriente de entrada haciéndola sinusoidal y en fase con la tensión. 

#### 4.2 Amplificadores. Polarización. Clases A. AB, B y C.

![](https://upload.wikimedia.org/wikipedia/commons/4/49/MFR317_FM_amp.jpg)

Un [amplificador](https://es.wikipedia.org/wiki/Amplificador_electr%C3%B3nico) es un dispositivo que entrega una señal de mayor amplitud que la que recibe sin modificar sensiblemente su forma de onda. Los transistores pueden funcionar como amplificadores dado que, pequeñas variaciones de energía en la entrada, son capaces de producir grandes cambios de corriente en el colector, desarrollando en el circuito de salida una energía mayor que la recibida.

El circuito transfiere la energía procedente de una fuente de alimentación a la señal presente el la entrada que se ve así reproducida y aumentada en el circuito de salida. Aumenta la señal sin modificar la forma de la onda. 

La resistencia de carga es mucho mayor que la resistencia interna y la amplitud de la señal de entrada es pequeña, en comparación con la de salida.

Un [amplificador de tensión](https://es.wikipedia.org/wiki/Amplificador_operacional) se diseña para lograr que una pequeña variación presente en la tensión en la entrada, produzca una gran variación en la tensión en la salida. Esto supone un elevado valor de la impedancia de carga a a salida. Contrariamente un amplificador de corriente se diseña con una carga de baja impedancia para conseguir una corriente de slaida muy intensa.

Un transistor amplifica `I`, `E` o `W`. Se entiende que cuando amplifica `I` o `E` también amplifica `W` por `W = EI`.

Polarizar un amplificador significa fijar las tensiones e intensidades de señal en sus terminales de modo que el dispositivo opere, de acuerdo con sus características, en un punto de trabajo concreto que deseemos. 

Corriente y tensión de reposo en amplificadores son la corriente y tensión en estado régimen cuando no existe señal de entrada. en estas condiciones solo circula la corriente de polarización.

El punto de trabajo representa las condiciones de reposo. Podemos decir que polarización, corriente reposo y punto de trabajo representan lo mismo. En radiofrecuencia tratándose señales no moduladas en amplitud no importa demasiado la distorsión porque los circuitos resonantes del amplificador están sintonizados a la frecuencia de trabajo en una banda muy estrecha y solo dejan pasar la frecuencia que se quiere amplificar.

Los condensadores a la entrada y salida de circuitos amplificadores sirven para obstaculizar la componente continua.

Al polarizar un transistor es cuando se fija la forma de trabajo. La polarización de uno tipo `PNP` no es igual a un `NPN` y en general podemos decir que unión base - emisor se polariza directamente y la unión base - colector inversamente.

Al polarizar un transistor podemos situarle dentro de una de sus tres zonas de trabajo: corte, saturación y activa.

En la zona de corte no circula intensidad por la base luego la intensidad de colector y emisor también es nula. La tensión entre colector y emisor es la de la fuente usada y el transistor, entre colector y emisor, se comporta como un interruptor abierto.

Se encuentra en la zona de saturación cuando por la base circula una intensidad y hay un incremento de la corriente de colector importante y en este caso el transistor, entre colector y emisor, se comporta como un interruptor cerrado. Cuando trabaja en la zona de corte y la de saturación se dice que trabaja en conmutación como si fuera un interruptor.

En la zona activa actúa como amplificador. 

Podemos considerar solo cuatro tipos de circuitos: clase A, clase B, clase AB y clase C:

![![]()](https://upload.wikimedia.org/wikipedia/commons/9/9b/Electronic_Amplifier_Class_A.png)

[Clase A](https://es.wikipedia.org/wiki/Amplificador_electr%C3%B3nico#Clase_A): es el más lineal de todos pero su rendimiento es muy bajo oscilando entre el `20` y `30%` de la potencia de alimentación aplicada. Se pretende conseguir máxima ganancia de tensión. Para ello, la impendancia de carga, se hace tan alta como sea posible con lo cual mayor parte de la tensión generada aparecerá en la carga. La forma de onda a la salida es igual que a la de entrada. 

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/Amplificador%20clase%20AB.jpg)

[Clase AB](https://es.wikipedia.org/wiki/Amplificador_electr%C3%B3nico#Clase_AB): una combinación de las `A` y `B`. La corriente de salida circula entre medio ciclo y el ciclo completo de la señal de entrada. Hay una pequeña distorsión. Su rendimiento es del orden del `50%`, un poco menos lineal que el `A` pero también utilizable.

![](https://upload.wikimedia.org/wikipedia/commons/7/72/Electronic_Amplifier_Push-pull.png)



[Clase B](https://es.wikipedia.org/wiki/Amplificador_electr%C3%B3nico#Clase_B): rinde entre el `60` y `65%` su linealidad es baja pero también es adecuando para nuestros equipos. En este tipo de amplificadores se persigue obtener la máxima potencia de salida posible. Se precisan altos valores de la corriente de colector, por lo que la impedancia de la carga será baja y la señal de entrada deberá ser mayor que su polarización durante una parte de su ciclo. Estos amplificadores, en radio frecuencia, se conocen también con el nombre de amplificadores lineales ya que se ajustan para que la potencia de salida sea proporcional al cuadrado de la tensión de entrada. En la amplificación de clase B la corriente de salida solo circula en los semiciclos positivos de la señal de entrada. Solo conduce si la polarización es directa. Hay una distorsión elevada y si no hay señal de entrada no hay salida.

![](https://upload.wikimedia.org/wikipedia/commons/e/e1/Electronic_Amplifier_Class_C.png)

[Clase C](https://es.wikipedia.org/wiki/Amplificador_electr%C3%B3nico#Clase_C): llega al alcanzar hasta un `85%` de rendimiento pero su linealidad es muy deficiente. La corriente de salida solo circula durante menos de medio ciclo de la señal de entrada lo que da lugar a gran distorsión, pero su rendimiento y potencia son elevados. En ellos la corriente de salida solo se establece por impulsos. Se utilizan en los transistores porque ofrecen gran rendimiento cuando están sintonizados a la frecuencia de la señal de entrada. No pueden usarse en audio o bajas frecuencias por su nula linealidad, aunque podrían utilizarse en aplicaciones que no la requieran. El diseño del circuito de entrada se realiza teniendo en cuenta que las adaptaciones entre la salida del paso anterior y la entrada del amplificador tengan las mínimas pérdidas posibles, es decir, que su impedancia sea la misma. Análogamente se hace con el circuito de salida.

El rendimiento de un amplificador es el cociente entre la potencia que suministra el amplificador y la potencia que le aporta la fuente de alimentación.

![](https://upload.wikimedia.org/wikipedia/commons/a/a6/Pwm_amp_espa%C3%B1ol.svg)

Tienen niveles de distorsión similares a los de clase AB con un elevado rendimiento energético, superior al `95%`, lo que reduce el tamaño de los disipadores de calor necesarios, y por tanto el tamaño y peso general del circuito. La razón de esto es que su funcionamiento se asa en la conmutación entre dos estados, con lo que los dispositivos de salida siempre se encuentran en zonas de corte o de saturación. Al igual que las fuentes de alimentación conmutadas exigen un riguroso blindaje para no generar interferencias.

#### 4.2.1 Amplificadores de LF y HF

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/espectro.jpg)

Para amplificar [bajas frecuencias](https://es.wikipedia.org/wiki/Baja_frecuencia)  o [audio frecuencias](https://es.wikipedia.org/wiki/Espectro_audible) entra 16 y 20000 hercios interesa que no aparezcan distorsiones, importa más la reproducción fil que el rendimiento de potencia.

Parecería lógico usar preferente amplificadores de clase A pero en audio solo se usan en procesos de pequeña señal o equipos de muy alta gama. Actualmente la mayor parte de las [etapas de potencia](https://es.wikipedia.org/wiki/Etapa_de_potencia) son en clase D, donde con una gestión digital de la señal se obtienen valores de distorsión más bajos que en clase A. En los equipos de radioaficionado los amplificadores de audio suelen ser en clase AB.

Los amplificadores para [altas frecuencias](https://es.wikipedia.org/wiki/Onda_corta) se caracterizan por estar diseñados de tal manera que tienen circuitos sintonizados resonantes en la entrada y la salida de la señal es decir los elementos del circuito deben resonar a la frecuencia que se quiere amplificar. Como la resonancia implica amplificación a una sola frecuencia ya no tienen tanta importancia la distorsión. Se eliminan las frecuencias indeseadas y por sintonía variable puede cambiarse la frecuencia de trabajo. Solo se pueden emplear amplificadores en clase C para [CW](https://es.wikipedia.org/wiki/Onda_continua) o [FM](https://es.wikipedia.org/wiki/Frecuencia_modulada), en [AM](https://es.wikipedia.org/wiki/Amplitud_modulada) y sus derivados es preceptiva la case AB o como mínimo la clase B, amplificadores lineales.

![](https://github.com/redeltaglio/RNMnetwork/raw/master/Images/push-pull-2-300x271-5218095.png)

Un tipo de amplificador de potencia, útil para ambos casos, es el llamado en [contrafase](https://es.wikipedia.org/wiki/Salida_en_contrafase) o push-pull. Se compone de transistores colocados tras un inversor 

#### 4.2.2 Ganancia. Relación entre potencia de entrada de salida y eficacia.

$$
\begin{align*}
Belio\space=\space logaritmo\space de\space = \space \frac{Potencia\space de\space salida}{Potencia\space de\space entrada}
\end{align*}
$$

El efecto amplificador se denomina ganancia. La ganancia de un transistor de puede referir a tensión o corriente. Cuando en lugar de aumento se produce una disminución de tensión o corriente se llamará atenuación. La ganancia de potencia expresará la relación entre la potencia de salida y la de entrada, midiéndose en [decibelios](https://es.wikipedia.org/wiki/Decibelio). 

El belio `B` y su submúltiplo el decibelio son unidades logarítmicas utilizadas para expresar la razón o valor relativo entre dos magnitudes de la misma naturaleza como por ejemplo dos potencias.

Por razones prácticas se usa generalmente el decibelio y el número de decibelios que corresponden a una determinada relación de potencia que se calcula con:
$$
\begin{align*}
dB\space =\space 10log_{10}\frac{P_s}{P_e}
\end{align*}
$$
siendo `Pe` la potencia de la señal en la entrada del dispositivo y `Ps`  la potencia de la señal a la salida del mismo. Si hay ganancia de señal, amplificación, la cifra en decibelios será positiva, mientras que si hay pérdida atenuación será negativa. 

La eficacia de un circuito vendrá dada por la fórmula antes indicada. El objetivo es obtener potencia de alguna otra forma que no sea disipar calor. El circuito será tanto más eficaz, cuanto mayor sea su ganancia expresada en `dB`. En un circuito en el que intervienen varios amplificadores, las ganancias individuales expresadas en decibelios se suman.

#### 4.2.2.1 Relación de potencia correspondiente a los siguientes valores en decibelios: 0dB, 3dB, 6dB, 10 dB y 20dB tanto en valores positivos como negativos.

![](https://upload.wikimedia.org/wikipedia/commons/d/d9/10log_x_and_x.svg)

- 0dB equivale a una relación de potencias de 1.
- 3dB de 2.
- 6dB de 4.
- 10dB de 10.
- 20 dB de 100.

Cuando hablamos de amplificadores hablaremos de `dBW`, `dBm` o `dBu`.

En términos de potencia utilizaremos el [dBW](https://es.wikipedia.org/wiki/DBW). Se toma como referencia 1 vatio. Al vatio corresponden 0 dBW y si el valor expresado es muy pequeño se usa el milivatio como referencia usando entonces la expresión [dBm](https://es.wikipedia.org/wiki/DBm).

Cuando se toma como referencia la tensión, el dBu expresa el nivel de señal en decibelios y referido a 0,7746 V, tensión definida por [Comisión Electrotécnica Internacional](https://es.wikipedia.org/wiki/Comisi%C3%B3n_Electrot%C3%A9cnica_Internacional).

#### 4.2.3 Características de amplitud / frecuencia y ancho de banda 

Las características amplitud / frecuencia dependen de los modos de funcionamiento, ya se trata de clase A, clase B, clase AB o clase C.

En un circuito amplificador la ganancia de señal es una variable dependiente de la frecuencia, osea que le factor de amplificación no es igual para cada una de las frecuencia de las señales de entrada.

El ancho de banda del amplificador es solo el rango de frecuencias de señal dentro del cual la ganancia permanece relativamente constante. En un amplificador de banda ancha se amplificaran todas la frecuencias posibles dentro del paso banda permitido por el diseño mientras que en uno sintonizado solo serán amplificadas aquellas que correspondan a la frecuencia de resonancia del amplificador que es muy estrecha. 

#### 4.2.4 Armónicos y distorsión de intermodulación, sobremodulación de las etapas del amplificador 

Cuando una corriente o tensión experimenta una variación con el tiempo se produce un campo electromagnético.  Una onda senoidal produce un campo electromagnético de una sola frecuencia, cualquier deformación en la misma genera frecuencias armónicas de esa frecuencia y estas señales no deseadas pueden afectar el funcionamiento correcto del equipo y de otros equipos distintos del que las genera.

Si un amplificador trabaja fuera delas condiciones que hacen que su respuesta sea lineal estaremos produciendo toda una serie de señales no deseadas.

Los armónicos son producidos por circuitos no lineales, lo cual significa que se respuesta no es constante y pueden llegar a un punto de saturación a partir del cual se deforma la onda, lo que ya hemos visto trae consigo la generación de armónicos y se produce distorsión armónica. Si nos encontramos con señales de crecimiento y caídas rápidas nos indica la presencia de armónicos de alta frecuencia. Lo mismo ocurre con las señales producidas por sistemas de conmutación, puentes de diodos rectificadores, circuitos lógicos, etc. Se denomina [distorsión por intermodulación](https://es.wikipedia.org/wiki/Distorsi%C3%B3n_por_intermodulaci%C3%B3n_de_transistores) a la interferencia causada por la distorsión y que se produce cuando dos o más señales atraviesan simultáneamente un sistema no lineal, es decir, aparecen a la salida del sistema otras señales de entrada y de los armónicos que también se hayan podido generar por la falta de lienalidad del sistema.

Ningún sistema es completamente linea, todos tienen un cierto nivel de distorsión por intermodulación. Niveles altos de distorsión en un sistema pueden llegar a hacer ininteligible una señal.

No hay que confundir la distorsión por intermodulación con la distorsión por la emisión de armónicos. 

#### 4.2.5 Acoplamientos en amplificación

![](https://github.com/noplacenoaddress/RNMnetwork/raw/master/Images/63d4ece5-70a0-4fb8-9d3b-ffbd2280a711.jpeg)

A veces se precisan varios pasos para la amplificación alimentados cada uno por el anterior, formando un amplificador de varios pasos.

El acoplamiento entre dos pasos permite la conexión de sus circuitos para la recíproca transferencia de su energía. El acoplamiento puede ser por inducción mutua, electromagnético, por capacidad, electrostático, o por impedancia común (resistencia, autoinducción, capacidad o circuito sintonizado).

Se llama acoplamiento crítico al límite de acoplamiento entre dos circuitos sintonizados, rebasado el cual la curva de resonancia se desdobla. 

Se llama acoplamiento de reacción o regenerativo al que permite transferir a los circuitos anteriores al que permite transferir a los circuitos anteriores parte de la energía de los siguientes.

Se llama acoplamiento débil o flojo al acoplamiento cuyo coeficiente es inferior al de acoplamiento crítico. Acoplamiento fuerte es el que lo supera.

En el acoplamiento directo se conecta la salida de un paso amplificador directamente a la entrada del siguiente.

![](https://raw.githubusercontent.com/redeltaglio/RNMnetwork/master/es.telecomlobby.com/radio_aficion/PCB/acomplamiento_sintonizado.svg)

Se llama acoplamiento sintonizado al acoplamiento inductivo conseguido por circuitos resonantes o que llevan como carga uno de tales circuitos. Se ajustan para que resuenen a una frecuencia determinada  y la ganancia es grande. Para las demás frecuencias la ganancia es nula. Hay ganancia de tensión solamente a la frecuencia de resonancia.

Los acoplamientos inductivos se usan cuando se requiere una selectividad grande, como un amplificador de frecuencia intermedia de un receptor superheterodino o un amplificador de salida de un transmisor.

Los amplificadores proyectados para amplificar una banda de frecuencia proporcionan una ganancia máxima para la frecuencia central.

## Bibliografía

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Luxorion](http://www.astrosurf.com/luxorion/menu-qsl.htm), `LX4SKY`