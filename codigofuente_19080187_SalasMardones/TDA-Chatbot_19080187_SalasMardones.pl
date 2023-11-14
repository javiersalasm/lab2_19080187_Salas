:-consult('PredicadosAuxiliares_19080187_SalasMardones.pl').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 5. TDA Chatbot - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: chatbot
% Descripcion: Predicado constructor de un chatbot. Los chatbots quedan
%              identificados por un ID único. Su unicidad se
%              verifica al momento de agregarlo a un sistema a fin
%              de evitar duplicidad. El predicado también verifica
%              que los flujos añadidos no se repitan en base al id
%              de éstos.
% Dominio: chatbotID (int) X name (String) X welcomeMessage (String) X startFlowId(int) X  flows (Lista de 0 o más flujos) X chabot
% Meta Principal: chatbot
% Meta Secundaria: integer, string, string, integer, is_list,
% flowsRepetidosPorId

chatbot(ChatbotId, Name, WelcomeMsg, StartFlowId, Flows, [ChatbotId, Name, WelcomeMsg, StartFlowId, Flows]):-
    integer(ChatbotId),
    string(Name),
    string(WelcomeMsg),
    integer(StartFlowId),
    is_list(Flows),
    \+ tieneDuplicadosFlowIds(Flows).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDA Chatbot - Selector %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% getChatbotId/2
% Descripción: Predicado que obtiene el ID de un chatbot a partir de una
%              lista. Da como resultado el ID del chatbot.
% Dominio: Lista X ID
% Meta Principal: getChatbotId
% Meta Secundaria: NA
getChatbotId([ChatbotId,_,_,_,_],ChatbotId).

% getChatbotName/2
% Descripción: Predicado que obtiene el nombre de un chatbot a partir de una lista
%              Da como resultado el nombre del chatbot.
% Dominio: Lista X Nombre
% Meta Principal: getChatbotName
% Meta Secundaria: NA
getChatbotName([_,Name,_,_,_],Name).


% getChatbotWelcomeMsg/2
% Descripción: Predicado que obtiene el mensaje de bienvenida de un chatbot a partir de una lista
%              Da como resultado el mensaje de bienvenida del chatbot.
% Dominio: Lista X Mensaje de Bienvenida
% Meta Principal: getChatbotWelcomeMsg
% Meta Secundaria: NA
getChatbotWelcomeMsg([_,_,WelcomeMsg,_,_],WelcomeMsg).


% getChatbotStartFlowId/2
% Descripción: Predicado que obtiene el ID del flujo de inicio de un
%              chatbot a partir de una lista
%              Da como resultado el ID del flujo de inicio del chatbot.
% Dominio: Lista X ID del Flujo
% Meta Principal: getChatbotStartFlowId
% Meta Secundaria: NA
getChatbotStartFlowId([_,_,_,StartFlowId,_],StartFlowId).


% getChatbotFlows/2
% Descripción: Predicado que obtiene la lista de flujos de un chatbot a partir de una lista
%              Da como resultado la lista de flujos del chatbot.
% Dominio: Lista X Lista de Flujos
% Meta Principal: getChatbotFlows
% Meta Secundaria: NA
getChatbotFlows([_,_,_,_,Flows],Flows).








