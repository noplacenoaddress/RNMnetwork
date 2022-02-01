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

Si la reactancia de C es mayor que la de L: circuito inductivo.

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

En condiciones de resonancia se compensan los desfases entra I y E, el condensador adelanta a la intensidad y en la bobina en cambio se adelante la tensión E, ambas de 90°. La curva que representa la intensidad es exactamente opuesta a la curva que representaría la impedancia. 

##### Resonante paralelo

## Bibliografía 

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Símbolos eléctricos & electrónicos](https://www.simbologia-electronica.com/). 
- [Xcircuit](http://opencircuitdesign.com/xcircuit/)
- Física práctica - [Electricidad](https://www.fisicapractica.com/electricidad.php). 
- Proyecto 987 - [Corriente alterna](http://www.proyecto987.es/corriente_alterna_0.html).