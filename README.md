## Api con informacion sobre dinosaurios
IMPORTANTE IMPORTAR LA BASE DE DATOS, LA CUAL SE ENCUENTRA EN:
## database/dinosaurios.sql

***
end-point : /api/dinosaurios/
***

Ejemplos:  
[GET]/api/dinosaurios/ (Lista de todo los dinosaurios).  

[GET]/api/dinosaurios/1 (Muestra el dinosaurio con la id 1).  

[POST]/api/dinosaurios/ (Lee el body y agrega el nuevo dinosaurio **REQUIERE AUTENTICACION**) 

[PUT]/api/dinosaurios/1 (Lee el body y actualiza el dinosaurio 1 **REQUIERE AUTENTICACION**)  

[DELETE]/api/dinosaurios/1 (Elimina el dinosaurio con la id 1 **REQUIERE AUTENTICACION**)  


## POST/PUT

Para poder realizar estas acciones, ademas de estar atuenticado es necesario ingresar los datos a travez del body de la siguente manera:  

```json
{  
    "nombre_cientifico": "Tyranosaurio Rex",  
    "altura": 1000,  
    "peso": 67,  
    "alimentacion": "carnivoro",  
    "anios_vivo": 20,  
    "id_habitat_fk": 3,   
    "descripcion": "El tiranosaurio rex fue denominado “king of the tyrant lizards”, que se traduce como “el rey de los lagartos tiranos”."  
}
```

***
## ORDENAR CONTENIDO  
***

Ordenar ascendentemente: `.../api/dinosaurios?order=asc`  

Ordenar descendentemente: `.../api/dinosaurios?order=desc`  

Ordenar por atributos: `.../api/dinosaurios?sortby=(ATRIBUTO)`  

Atributos validos:  

* nombre_cientifico
* altura
* peso
* alimentacion
* anios_vivos
* id_habitat_fk
* descripcion  

El atributo tambien se puede ordenar ascendente o descendentemente utilizando "&order=asc/desc" al final de la url  
Tambien se pueden realizar busquedas por atributo: 
   
`.../api/dinosaurios?ATRIBUTO=VALOR` 
   
`.../api/dinosaurios?nombre_cientifico=Triceratops` (solo muestra el dinosaurio con el nombre "Triceratops")  
  
`.../api/dinosaurios?peso&order=desc` (nos mostrar los dinosaurios ordenados descendientemente segun su peso)  
  
El valor podemos ponerlo entre % para asi nos mostrara atributos que contengan el valor ingresado:  
  
`.../api/dinosaurios?nombre_cientifico=%aurus%` (mostrara los dinosaurios cuyos nombres contengan "aurus", ejemplo: 
espinosaurus)  
  

***
## PAGINACION
***  

`.../api/dinosaurios?limit=VALOR&page=VALOR`  

Esta funcion nos permite ver todo los dinosaurios separados en "paginas", en limit pondremos la cantidad de dinosaurios que queremos ver y page el numero de pagina, ejemplo: 

`.../api/dinosaurios?limit=3&page=1`  



```json
[
    {
        "id_dinosaurio": 41,
        "nombre_cientifico": "Edmontosaurio",
        "altura": 130,
        "peso": 8000,
        "alimentacion": "herviboro",
        "anios_vivos": 73,
        "id_habitat_fk": 1,
        "descripcion": "Edmontosaurus (\"lagarto de Edmonton\") es un género extinto conocido de dinosaurio ornitópodo hadrosáurido. Contiene dos especies conocidas: Edmontosaurus regalis y Edmontosaurus annectens. Se han encontrado fósiles de E. regalis en rocas del oeste de América del Norte que datan de fines del Campaniense hace 73 millones de años, mientras que las de E. annectens se encontraron en la misma región geográfica, pero en rocas que datan de finales del Maastrichtiense, hace 66 millones de años. Edmontosaurus fue uno de los últimos dinosaurios no aviares, y vivió junto a dinosaurios como Triceratops, Tyrannosaurus y Pachycephalosaurus poco antes de la extinción masiva del Cretácico-Paleógeno.",
        "Imagen": "img/634cce349af403.09611850.jpg"
    },
    {
        "id_dinosaurio": 42,
        "nombre_cientifico": "Triceratops",
        "altura": 300,
        "peso": 5000,
        "alimentacion": "herviboro",
        "anios_vivos": 65,
        "id_habitat_fk": 1,
        "descripcion": "El Triceratops es un género con dos especies conocidas de dinosaurios ceratopsianos ceratópsidos, que vivieron a finales del período Cretácico, hace aproximadamente entre 68 y 66 millones de años, durante el Maastrichtiense, en lo que hoy es Norteamérica. Su nombre de lo castellaniza como el tricerátops. Es uno de los últimos géneros en aparecer antes del gran evento de extinción masiva del Cretácico-Terciario.​ Poseía una gran gola ósea que le cubria dorsal y lateral del cuello y tres cuernos, un cuerpo grande sobre cuatro fornidas patas, y varias similitudes con respecto al moderno rinoceronte y los bovinos. Triceratops es uno de los más reconocidos de todos los dinosaurios. También fue uno de los más grandes, de hasta 8 a 9 metros de largo y de 5 a 9 toneladas métricas de masa corporal. Aunque compartiera el territorio con el temible Tyrannosaurus y fuera cazado por él,​ no está claro si los dos lucharon de la manera representada a menudo en exhibiciones de museo o en imágenes populares.",
        "Imagen": "img/634ccf1c333df0.08940646.jpg"
    },
    {
        "id_dinosaurio": 44,
        "nombre_cientifico": "Edmontonia",
        "altura": 200,
        "peso": 3000,
        "alimentacion": "herviboro",
        "anios_vivos": 83,
        "id_habitat_fk": 3,
        "descripcion": "Edmontonia (\"de Edmonton\") es un género representado por dos o tres especies según el autor, de dinosaurios tireóforos nodosáuridos, que vivió a finales del período Cretácico, hace aproximadamente 83 y 65 millones de años, en el Campaniense y el Maastrichtiense, en lo que hoy es Norteamérica. Las especies son Edmontonia longiceps, la especie tipo, Edmontonia rugosidens y una tercera, a veces incluida en Glyptodontopelta mimus, Edmontonia australis.",
        "Imagen": "img/634cda11a1cf29.66805370.jpg"
    }
]
```