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



## Bibliografía 

- Libro de examen de radioaficionado, Luis Alarcón Palencia `EA4DXP`
- [Símbolos eléctricos & electrónicos](https://www.simbologia-electronica.com/). 