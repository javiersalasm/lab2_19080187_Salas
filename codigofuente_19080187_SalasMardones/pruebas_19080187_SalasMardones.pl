:-consult('TDA-Flow_19080187_SalasMardones.Pl').
:-consult('TDA-Option_19080187_SalasMardones.pl').
:-consult('PredicadosAuxiliares_19080187_SalasMardones.pl').
:-consult('TDA-Chatbot_19080187_SalasMardones.pl').
:-consult('TDA-System_19080187_SalasMardones.pl').
:-consult('Main_19080187_SalasMardones.pl').



% Primero copiar y pegar esto en la consulta de Prolog para poder visualizar todo el contenido (excluyendo el simbolo %):
% set_prolog_flag(answer_write_options,[max_depth(0)]).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Script de Pruebas N°1 Profesor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
option(1, "1) Viajar", 12, 1, ["viajar", "turistear", "conocer"], OP1),
option(2, "2) Estudiar", 2, 1, ["estudiar", "aprender", "perfeccionarme"], OP2),
flow(1, "flujo1", [OP1], F10),
flowAddOption(F10, OP2, F11),
% flowAddOption(F10, OP1, F12), %si esto se descomenta, debe dar false, porque es opción con id duplicada.
chatbot(0, "Inicial", "Bienvenido\n¿Qué te gustaría hacer?", 1, [F11], CB0), %solo añade una ocurrencia de F11
%Chatbot1
option(1, "1) New York, USA", 1, 2, ["USA", "Estados Unidos", "New York"], OP3),
option(2, "2) París, Francia", 1, 1, ["Paris", "Eiffel"], OP4),
option(3, "3) Torres del Paine, Chile", 1, 1, ["Chile", "Torres", "Paine", "Torres Paine", "Torres del Paine"], OP5),
option(4, "4) Volver", 0, 1, ["Regresar", "Salir", "Volver"], OP6),
%Opciones segundo flujo Chatbot1
option(1, "1) Central Park", 1, 2, ["Central", "Park", "Central Park"], OP7),
option(2, "2) Museos", 1, 2, ["Museo"], OP8),
option(3, "3) Ningún otro atractivo", 1, 3, ["Museo"], OP9),
option(4, "4) Cambiar destino", 1, 1, ["Cambiar", "Volver", "Salir"], OP10),
option(1, "1) Solo", 1, 3, ["Solo"], OP11),
option(2, "2) En pareja", 1, 3, ["Pareja"], OP12),
option(3, "3) En familia", 1, 3, ["Familia"], OP13),
option(4, "4) Agregar más atractivos", 1, 2, ["Volver", "Atractivos"], OP14),
option(5, "5) En realidad quiero otro destino", 1, 1, ["Cambiar destino"], OP15),
flow(1, "Flujo 1 Chatbot1\n¿Dónde te Gustaría ir?", [OP3, OP4, OP5, OP6], F20),
flow(2, "Flujo 2 Chatbot1\n¿Qué atractivos te gustaría visitar?", [OP7, OP8, OP9, OP10], F21),
flow(3, "Flujo 3 Chatbot1\n¿Vas solo o acompañado?", [OP11, OP12, OP13, OP14, OP15], F22),
chatbot(1, "Agencia Viajes",  "Bienvenido\n¿Dónde quieres viajar?", 1, [F20, F21, F22], CB1),
%Chatbot2
option(1, "1) Carrera Técnica", 2, 1, ["Técnica"], OP16),
option(2, "2) Postgrado", 2, 1, ["Doctorado", "Magister", "Postgrado"], OP17),
option(3, "3) Volver", 0, 1, ["Volver", "Salir", "Regresar"], OP18),
flow(1, "Flujo 1 Chatbot2\n¿Qué te gustaría estudiar?", [OP16, OP17, OP18], F30),
chatbot(2, "Orientador Académico",  "Bienvenido\n¿Qué te gustaría estudiar?", 1, [F30], CB2),
system("Chatbots Paradigmas", 0, [CB0], S0),
% systemAddChatbot(S0, CB0, S1), %si esto se descomenta, debe dar false, porque es chatbot id duplicado.
systemAddChatbot(S0, CB1, S01),
systemAddChatbot(S01, CB2, S02),
systemAddUser(S02, "user1", S2),
systemAddUser(S2, "user2", S3),
% systemAddUser(S3, "user2", S4), %si esto se descomenta, debe dar false, porque es username duplicado
systemAddUser(S3, "user3", S5),
% systemLogin(S5, "user8", S6), %si esto se descomenta, debe dar false ;user8 no existe.
systemLogin(S5, "user1", S7),
% systemLogin(S7, "user2", S8), %si esto se descomenta, debe dar false, ya hay usuario con login
systemLogout(S7, S9),
systemLogin(S9, "user2", S10).
*/

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PREDICADOS NO IMPLEMENTADOS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
/*
% systemTalkRec(S10, "hola", S11), % si se descomenta, daría false por que “hola” no es un option o keyword
systemTalkRec(S10, "1", S12),
systemTalkRec(S12, "1", S13),
systemTalkRec(S13, "Museo", S14),
systemTalkRec(S14, "1", S15),
systemTalkRec(S15, "3", S16),
systemTalkRec(S16, "5", S17),
systemSynthesis(S17, "user2", Str1),
systemSimulate(S3, 5, 32131, S99).
*/






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Script de Pruebas Propio %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 2. TDA Option - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: option

% Para ejecutar estos ejemplos copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1), %op1
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2), %op2
option(1, "1- dulces", 1, 1, ["postres", "dulces", "pasteles"], O3), %op3
option(2, "2- salados", 1, 1, ["salados", "comida salada", "plato salado"], O4), %op4
option(3, "3- tragos", 1, 1, ["copete", "alcohol", "algo para tomar"], O5), %op5
option(4, "4- volver", 0, 1, ["regresar", "salir", "volver"], O6), %op6
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7), %op7
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8), %op8
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9), %op9
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10), %op10
option(1, "1- maniana", 1, 3, ["maniana"], O11), %op11
option(2, "2- tarde", 1, 3, ["tarde"], O12), %op12
option(3, "3- noche", 1, 3, ["noche"], O13), %op13
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15), % op15
option(1, "1- cardio", 2, 2, ["cardio"], O16), %op16
option(2, "2- fuerza", 2, 2, ["pesas", "musculo", "fuerza"], O17), %op17
option(3, "3- volver", 0, 2, ["volver", "salir", "regresar"], O18), %op18
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19), %op19
option(1, "1- leer libros", 3, 1, ["leer", "libros", "leer libros"], O20), %op20
option(2, "2- ver peliculas", 3, 1, ["ver", "peliculas", "ver peliculas"], O21). %op21
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 3. TDA Flow - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: flow

% Ejemplo 1: Da Falso, ya que se intenta añadir la misma opcion
% flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O1, O2, O2, O19], F1).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O1, O2, O2, O19], F1).
*/


% Ejemplo 2: Flujo 1 de Chatbot 1
% flow(1, "flujo 1: Chatbot1\n¿Que te gustaria realizar?"", [O3, O4, O5, O6], F2).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- dulces", 1, 1, ["postres", "dulces", "pasteles"], O3),
option(2, "2- salados", 1, 1, ["salados", "comida salada", "plato salado"], O4),
option(3, "3- tragos", 1, 1, ["copete", "alcohol", "algo para tomar"], O5),
option(4, "4- volver", 0, 1, ["regresar", "salir", "volver"], O6),
flow(1, "flujo 1: Chatbot1\n¿Que te gustaria realizar?", [O3, O4, O5, O6], F2).
*/


% Ejemplo 3: Flujo 2 de Chatbot 1
% flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3).
*/




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 4. TDA Flow - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: flowAddOption

% Ejemplo 1: Se añade opcion 1 y 2 al flujo que esta vacío
% flowAddOption(F1, O1, F2).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
flow(1, "Flujo 1: Chatbot Principal", [], F1),
flowAddOption(F1, O1 , F2),
flowAddOption(F2, O2, F3).
*/


% Ejemplo 2: Se intenta añadir opcion duplicada, da false
% flowAddOption(F1, O1, F2).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
flow(1, "Flujo 1: Chatbot Principal", [O1], F1),
flowAddOption(F1, O1 , F2).
*/

% Ejemplo 3: Se añade opcion 2 al flujo que ya contiene la opcion 1.
% flowAddOption(F1, O2, F2).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
flow(1, "Flujo 1: Chatbot Principal", [O1], F1),
flowAddOption(F1, O2 , F2).
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 5. TDA Chatbot - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: chatbot

% Ejemplo 1: Se crea el Chatbot Inicial con su flujo principal
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0).
*/


% Ejemplo 2: Se crea el Chatbot 1 sin flujos
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog (Sin el simbolo %):
% chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1).


% Ejemplo 3: Se crea el Chatbot 2 sin flujos
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog (Sin el simbolo %):
% chatbot(2, "Chatbot Entrenador", "Bienvenido\n¿Qué tipo de ejercicio te gustaría hacer?", 2, [], CB2).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 6. TDA Chatbot - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: chatbotAddFlow

% Ejemplo 1: Se intenta añadir flujo duplicado al chatbot inicial, da falso
% chatbotAddFlow(CB0, F1, CB1).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
chatbotAddFlow(CB0, F1, CB1).
*/


% Ejemplo 2: Se añades flujos al chatbot 1
% chatbotAddFlow(CB1, F2, CB3).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
chatbotAddFlow(CB1, F3, CB2).
*/


% Ejemplo 3: Se añade otro flujo al chatbot1
% chatbotAddFlow(CB1, F2, CB3).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3).
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 7. TDA system - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: system


% Ejemplo 1: Se crea system0 sin chatbots
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog (Sin el simbolo %):
% system("system0", 1, [], S0).


% Ejemplo 2: Se crea system1 con el chatbot principal
% system("system1", 0, [CB0], S0).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
system("system1", 0, [CB0], S1).
*/

% Ejemplo 3: Se crea system2 con el chatbot 1
% system("system2", 1, [CB2], S0).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
chatbotAddFlow(CB1, F3, CB2),
system("system1", 1, [CB2], S1).
*/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 8. TDA system - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemAddChatbot


% Ejemplo 1: Se añade chatbot principal al sistema0
% systemAddChatbot(S0, CB0, S1).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1).
*/

% Ejemplo 2: Se intenta añadir un chatbot diferente pero con el mismo ID, da como resultado false
% systemAddChatbot(S1, CB2, S2).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
chatbot(0, "Chatbot Entrenador", "Bienvenido\n¿Qué tipo de ejercicio te gustaría hacer?", 2, [], CB2),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB2, S2).
*/

% Ejemplo 3: Se añade chatbot 2 al system0
% systemAddChatbot(S0, CB3, S1).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2).
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 9. TDA system - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemAddUser

% Ejemplo 1: Se añade usuario "Priscilla" al system2
% systemAddUser(S2, "Priscilla", S3).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3).
*/

% Ejemplo 2: Se añade usuario "Javier" al system2
% systemAddUser(S3, "Javier", S4).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4).
*/


% Ejemplo 3: Se añade usuario "Consuelo" al system2
% systemAddUser(S2, "Consuelo", S3).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5).
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 10. TDA system - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemLogin


% Ejemplo 1: Se intenta iniciar sesion con usuario "Isa", da false, ya que no está registrado
% systemLogin(S5, "Isa", S6).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Isa", S6).
*/


% Ejemplo 2: Se inicia sesion con usuario "Javier"
% systemLogin(S5, "Javier", S6).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Javier", S6).
*/


% Ejemplo 3: Se intenta iniciar sesion con usuario "Priscilla", da false ya que existe una sesion iniciada
% systemLogin(S6, "Priscilla", S7).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Javier", S6),
systemLogin(S6, "Priscilla", S7).
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ejemplos 11. TDA system - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemLogout


% Ejemplo 1: Se cierra sesion de usuario "Javier"
% systemLogout(S6, S7).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Javier", S6),
systemLogout(S6, S7).
*/



% Ejemplo 2: Se inicia sesión con "Consuelo" y se cierra la sesión
% systemLogout(S8, S9).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Javier", S6),
systemLogout(S6, S7),
systemLogin(S7, "Consuelo", S8),
systemLogout(S8, S9).
*/



% Ejemplo 3: Se inicia sesión con "Priscilla" y se cierra la sesión
% systemLogout(S10, S11).
% Para ejecutar este ejemplo copiar  y pegar lo siguiente en la consulta de Prolog:
/*
option(1, "1- alfajor de manjar", 1, 2, ["alfajor", "manjar", "alfajor de manjar"], O7),
option(2, "2- torta pompadour", 1, 2, ["torta", "pompadour", "torta pompadour"], O8),
option(3, "3- ninguna otra receta", 1, 2, ["torta pompadour"], O9),
option(1, "1- maniana", 1, 3, ["maniana"], O11),
option(2, "2- tarde", 1, 3, ["tarde"], O12),
option(3, "3- noche", 1, 3, ["noche"], O13),
option(4, "4- en realidad no quiero comer", 1, 3, ["volver"], O15),
option(4, "4- cambiar receta", 1, 2, ["cambiar", "volver", "salir"], O10),
flow(2, "flujo 2: Chatbot1\n¿Que dulces te gustan?", [O7, O8, O9, O10], F3),
flow(3, "flujo 3: chatbot1\n¿En que momento del dia?", [O11, O12, O13, O15], F4),
chatbot(1, "Chatbot Chef", "Bienvenido, Que te gustaria cocinar?", 1, [], CB1),
chatbotAddFlow(CB1, F3, CB2),
chatbotAddFlow(CB2, F4, CB3),
system("system0", 1, [], S0),
option(1, "1- cocinar", 1, 1, ["cocinar", "comida", "comer"], O1),
option(2, "2- ejercitar", 2, 1, ["ejercitar", "ejercicio", "gimnasia"], O2),
option(3, "3- descansar", 3, 1, ["descansar", "flojear", "dormir"], O19),
flow(1, "Flujo 1: Flujo principal Chatbot 1\nBienvenido\n¿Qué te gustaria hacer?", [O1, O2, O19], F1),
chatbot(0, "Inicial", "Bienvenido\n¿Qué quieres hacer hoy?", 1, [F1], CB0),
systemAddChatbot(S0, CB0, S1),
systemAddChatbot(S1, CB3, S2),
systemAddUser(S2, "Priscilla", S3),
systemAddUser(S3, "Javier", S4),
systemAddUser(S4, "Consuelo", S5),
systemLogin(S5, "Javier", S6),
systemLogout(S6, S7),
systemLogin(S7, "Consuelo", S8),
systemLogout(S8, S9),
systemLogin(S9, "Priscilla", S10),
systemLogout(S10, S11).
*/














