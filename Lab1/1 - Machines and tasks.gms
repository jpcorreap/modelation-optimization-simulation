$ontext
Una compa��a posee cuatro m�quinas que deben completar cuatro trabajos. Cada m�quina debe ser asignada para completar un �nico trabajo.
El tiempo requerido (en horas) por cada m�quina para que complete cada trabajo se muestra en la siguiente figura:

Maquina  Trabajo 1   Trabajo 2   Trabajo 3   Trabajo 4
1        14          5           8           7
2        2           12          6           5
3        7           8           3           9
4        2           4           6           10

La compa��a desea minimizar el tiempo total requerido por las m�quinas para completar los cuatro trabajos. Dise�e un modelo matem�tico que resuelva el problema.


Realizado por:

Maria Alejandra Pab�n Galindo   201728807
Juan Pablo Correa Puerta        201717404

$offtext

Sets
 i         maquinas /m1*m4/
 j         trabajos /t1*t4/

Variables
 x(i,j)     Variable binaria que determina si se elige o no el proyecto en la posici�n i-j.
 v(j)       Variable binaria para garantizar la biyecci�n m�quina - trabajos.
 z          Funci�n objetivo que se busca minimizar;

parameter tablaTrabajos(i,j);
          tablaTrabajos("m1","t1") = 14;
          tablaTrabajos("m1","t2") = 5;
          tablaTrabajos("m1","t3") = 8;
          tablaTrabajos("m1","t4") = 7;

          tablaTrabajos("m2","t1") = 2;
          tablaTrabajos("m2","t2") = 12;
          tablaTrabajos("m2","t3") = 6;
          tablaTrabajos("m2","t4") = 5;

          tablaTrabajos("m3","t1") = 7;
          tablaTrabajos("m3","t2") = 8;
          tablaTrabajos("m3","t3") = 3;
          tablaTrabajos("m3","t4") = 9;

          tablaTrabajos("m4","t1") = 2;
          tablaTrabajos("m4","t2") = 4;
          tablaTrabajos("m4","t3") = 6;
          tablaTrabajos("m4","t4") = 10;

Binary Variable x;
Binary Variable v;

Equations

fObjetivo                Funcion Objetivo

res1                     Solo debe haber un valor m�nimo por columna
res2                     Solo debe haber un valor m�nimo por fila

;

fObjetivo           ..      z  =e=  sum( (i,j), tablaTrabajos(i,j) * x(i,j) );


res1(i)             ..      sum((j), x(i,j)) =e=1;
res2(j)             ..      sum((i), x(i,j)) =e=1;


Model modell /all/;

option mip=CPLEX;

Solve modell using mip minimizing z;

Display tablaTrabajos;

Display z.l