%myMember/2
% Descripcion: Predicado que comprueba si 'Elemento' pertenece a la lista.
%              Responde 'true' si el elemento pertenece, caso contrario responde 'false'
% Dom: Elemento X Lista
% Meta Pricipal: myMember
% Meta Secundaria: NA
myMember(Element,[Element|_]):-!.
myMember(Element,[_|Resto]):-
    myMember(Element,Resto).


% myAppend/3
% Descripción: Predicado que concatena dos listas.
% Dominio: Lista X Lista X Lista
% Meta Principal: myAppend
% Meta Secundaria: NA
myAppend([], L, L):-!.  % Caso base: Si la primera lista está vacía, el resultado es la segunda lista.

myAppend([X|Resto], L, [X|Resultado]) :-  % Si la primera lista no está vacía,
  myAppend(Resto, L, Resultado).         % se añade el primer elemento a la lista resultado
                                         % y se continúa recursivamente con el resto de la primera lista y la segunda lista

% insertarAlFinal/3
% Descripción: Predicado que inserta un 'Elemento' al final de una lista.
%              Da como resultado la lista resultante después de insertar
%              el elemento al final.
% Dominio: Elemento X Lista X Lista
% Meta Principal: insertarAlFinal
% Meta Secundaria: insertarAlFinal
insertarAlFinal( Elemento, [], [Elemento] ):-!.
insertarAlFinal( Elemento, [Cabeza|Resto], [Cabeza|Lista] ) :-
        insertarAlFinal( Elemento, Resto, Lista ).


% optionIdRepetido/2
% Descripción: Predicado auxiliar para verificar si una opción se repite en base a su ID en una lista de opciones.
% Dominio: Opción X Lista de Opciones
% Meta Principal: optionIdRepetido
% Meta Secundaria: getOptionCode, member
optionIdRepetido(Option, Options):-
    getOptionCode(Option, OptionId),
    member(ExistingOption, Options),
    getOptionCode(ExistingOption, ExistingOptionId),
    OptionId = ExistingOptionId.


% updateFlowOptions/3
% Descripción: Predicado auxiliar para actualizar la lista de opciones en un flujo.
% Dominio: Flujo X Lista de Nuevas Opciones X Flujo Actualizado
% Meta Principal: updateFlowOptions
% Meta Secundaria: getFlowId, getFlowNameMsg
updateFlowOptions(Flow, NewOptions, UpdatedFlow):-
    getFlowId(Flow, FlowId),
    getFlowNameMsg(Flow, FlowNameMsg),
    UpdatedFlow = [FlowId, FlowNameMsg, NewOptions].




% flowIdRepetido/2
% Descripción: Predicado auxiliar para verificar si un flujo se repite en base a su ID en una lista de flujos.
% Dominio: Flujo X Lista de Flujos
% Meta Principal: flowIdRepetido
% Meta Secundaria: getFlowId, member
flowIdRepetido(Flow, Flows) :-
    getFlowId(Flow, FlowId),
    member(ExistingFlow, Flows),
    getFlowId(ExistingFlow, ExistingFlowId),
    FlowId = ExistingFlowId.



% updateChatbotFlows/3
% Descripción: Predicado auxiliar para actualizar la lista de flujos en un chatbot.
% Dominio: Chatbot X Lista de Nuevos Flujos X Chatbot Actualizado
% Meta Principal: updateChatbotFlows
% Meta Secundaria: getChatbotId, getChatbotName, getChatbotWelcomeMsg,
%                  getChatbotStartFlowId
updateChatbotFlows(Chatbot, NewFlows, UpdatedChatbot):-
    getChatbotId(Chatbot, ChatbotId),
    getChatbotName(Chatbot, ChatbotName),
    getChatbotWelcomeMsg(Chatbot, ChatbotWelcomeMsg),
    getChatbotStartFlowId(Chatbot, ChatbotStartFlowId),
    UpdatedChatbot = [ChatbotId, ChatbotName, ChatbotWelcomeMsg, ChatbotStartFlowId, NewFlows].

% chatbotIdRepetido/2
% Descripción: Predicado auxiliar para verificar si un chatbot se repite en base a su ID en una lista de chatbots.
% Dominio: Chatbot X Lista de Chatbots
% Meta Principal: chatbotIdRepetido
% Meta Secundaria: getChatbotId, member
chatbotIdRepetido(Chatbot, Chatbots):-
    getChatbotId(Chatbot, ChatbotId),
    member(ExistingChatbot, Chatbots),
    getChatbotId(ExistingChatbot, ExistingChatbotId),
    ChatbotId = ExistingChatbotId.


% updateSystemChatbots/3
% Descripción: Predicado auxiliar para actualizar la lista de chatbots en un sistema.
% Dominio: Sistema X Lista de Nuevos Chatbots X Sistema Actualizado
% Meta Principal: updateSystemChatbots
% Meta Secundaria: getSystemName, getSystemInitialChatbotCodeLink,
%                  getSystemUsers, getSystemChatHistory,
%                  getSystemCurentUser
updateSystemChatbots(System, NewChatbots, UpdatedSystem):-
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, SystemInitialChatbotCodeLink),
    getSystemUsers(System, SystemUsers),
    getSystemChatHistory(System, SystemChatHistory),
    getSystemCurrentUser(System, SystemCurrentUser),
    UpdatedSystem = [SystemName, SystemInitialChatbotCodeLink, NewChatbots, SystemUsers, SystemChatHistory, SystemCurrentUser].




% tieneDuplicados/1
% Descripción: Predicado que verifica si una lista contiene elementos duplicados.
% Dominio: Lista
% Meta Principal: tieneDuplicados
% Meta Secundaria: select, member
tieneDuplicados(List):-
    select(X, List, Rest),
    member(X, Rest).


% tieneDuplicadosOptionIds/1
% Descripción: Predicado que verifica si una lista de opciones contiene IDs de opciones duplicados.
% Dominio: Lista de Opciones
% Meta Principal: tieneDuplicadosOptionIds
% Meta Secundaria: findall, member, getOptionCode, tieneDuplicados
tieneDuplicadosOptionIds(Options):-
    findall(Id, (member(Option, Options), getOptionCode(Option, Id)), Ids),
    tieneDuplicados(Ids).


% tieneDuplicadosFlowIds/1
% Descripción: Predicado auxiliar para verificar si hay IDs de flujo duplicados en una lista de flujos.
% Dominio: Lista de Flujos
% Meta Principal: tieneDuplicadosFlowIds
% Meta Secundaria: findall, member, getFlowId, tieneDuplicados
tieneDuplicadosFlowIds(Flows):-
    findall(Id, (member(Flow, Flows), getFlowId(Flow, Id)), Ids),
    tieneDuplicados(Ids).


% tieneDuplicadosChatbotIds/1
% Descripción: Predicado auxiliar para verificar si hay IDs de chatbot duplicados en una lista de chatbots.
% Dominio: Lista de Chatbots
% Meta Principal: tieneDuplicadosChatbotIds
% Meta Secundaria: findall, member, getChatbotId, tieneDuplicados
tieneDuplicadosChatbotIds(Chatbots):-
    findall(Id, (member(Chatbot, Chatbots), getChatbotId(Chatbot, Id)), Ids),
    tieneDuplicados(Ids).
