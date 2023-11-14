:-consult('PredicadosAuxiliares_19080187_SalasMardones.pl').

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7. TDA System - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: system
% Descripcion: Predicado constructor de un sistema de chatbots.
% Dominio: name (string) X InitialChatbotCodeLink (Int) X chatbots (Lista de 0 o más chatbots) X system
% Meta Principal: system
% Meta secundaria: string, integer, is_list, chatBotsRepetidosPorId
system(Name, InitialChatbotCodeLink, Chatbots, [Name, InitialChatbotCodeLink, Chatbots, [], [], "NoUser"]):-
    string(Name),
    integer(InitialChatbotCodeLink),
    is_list(Chatbots),
    \+ tieneDuplicadosChatbotIds(Chatbots).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDA System - Selector %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% getSystemName/2
% Descripción: Predicado que obtiene el nombre del sistema a partir de una lista
%              (System)
% Dominio: Lista X Nombre del Sistema
% Meta Principal: getSystemName
% Meta Secundaria: NA
getSystemName([Name,_,_,_,_,_],Name).


% getSystemInitialChatbotCodeLink/2
% Descripción: Predicado que obtiene el enlace al código del chatbot inicial del sistema
%              a partir de una lista (System)
% Dominio: Lista X Enlace al Código del Chatbot inicial
% Meta Principal: getSystemInitialChatbotCodeLink
% Meta Secundaria: NA
getSystemInitialChatbotCodeLink([_,InitialChatbotCodeLink,_,_,_,_],InitialChatbotCodeLink).


% getSystemChatbots/2
% Descripción: Predicado que obtiene la lista de chatbots del sistema a partir de una lista
%             (System)
% Dominio: Lista X Lista de Chatbots
% Meta Principal: getSystemChatbots
% Meta Secundaria: NA
getSystemChatbots([_,_,Chatbots,_,_,_],Chatbots).

% getSystemUsers/2
% Descripción: Predicado que obtiene la lista de usuarios del sistema a
%              partir de una lista (System).
% Dominio: Lista X Lista de Chatbots
% Meta Principal: getSystemUsers
% Meta Secundaria: NA
getSystemUsers([_,_,_,Users,_,_],Users).

% getSystemChatHistory/2
% Descripción: Predicado que obtiene la lista del historial del sistema
%              a partir de una lista (System).
% Dominio: Lista X Lista de Chatbots
% Meta Principal: getSystemChatHistory
% Meta Secundaria: NA
getSystemChatHistory([_,_,_,_,ChatHistory,_],ChatHistory).


% getSystemCurrentUser/2
% Descripción: Predicado que obtiene el usuario logueado (o no
%              logueado) a partir de una lista (System).
% Dominio: Lista X Lista de Chatbots
% Meta Principal: getSystemCurrentUser
% Meta Secundaria: NA
getSystemCurrentUser([_,_,_,_,_,CurrentUser],CurrentUser).







