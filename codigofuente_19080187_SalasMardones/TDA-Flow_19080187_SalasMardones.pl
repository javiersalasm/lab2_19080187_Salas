:-consult('PredicadosAuxiliares_19080187_SalasMardones.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3. TDA Flow - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: flow
% Descripcion: Predicado constructor de un flujo de un chatbot. Los flujos estan identificados por un ID unico. Su unicidad se verifica al momento
%			   de argregarlo a un chatbot a fin de evitar duplicidad. El predicado tambien verifica que las opciones aniadidas no se repitan
%              en base al ID de estos
% Dominio: Integer X String X List X TDA Flow
% Meta Principal: flow
% Meta Secundaria: integer, string, is_list, optionsRepetidosPorId
flow(Id, NameMsg, Option, [Id, NameMsg, Option]):-
    integer(Id),
    string(NameMsg),
    is_list(Option),
    \+ tieneDuplicadosOptionIds(Option).



% isFlow/1
% Descripción: Predicado que verifica si una lista representa un flujo válido.
% Da como resultado true si es un flujo válido; de lo contrario, da como resultado false.
% Dominio: Lista
% Meta Principal: isFlow
% Meta Secundaria: flow, integer, string, is_list
isFlow(Flow):-
    flow(Id, NameMsg, Option, Flow),
    integer(Id),
    string(NameMsg),
    is_list(Option).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDA Flow - Selector %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% getFlowId/2
% Descripción: Predicado que obtiene el ID de un flujo dado una lista si es un flujo válido.
% Da como resultado el ID del flujo.
% Dominio: Lista X ID
% Meta Principal: getFlowId
% Meta Secundaria: NA
getFlowId([FlowId,_,_], FlowId).

% getFlowNameMsg/2
% Descripción: Predicado que obtiene el nombre del flujo o el mensaje
%              asociado a partir de una lista
%              Da como resultado el nombre del flujo
%              o el mensaje asociado. Dominio: Lista X Nombre o Mensaje
% Meta Principal: getFlowNameMsg
getFlowNameMsg([_, NameMsg,_], NameMsg).

% getFlowOption/2
% Descripción: Predicado que obtiene la opción de un flujo a partir de una lista.
%              Da como resultado la opción del flujo.
% Dominio: Lista X Opcion
% Meta Principal: getFlowOption
getFlowOption([_, _, Option], Option).





