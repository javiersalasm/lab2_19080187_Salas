:-consult('TDA-Flow_19080187_SalasMardones.Pl').
:-consult('TDA-Option_19080187_SalasMardones.pl').
:-consult('PredicadosAuxiliares_19080187_SalasMardones.pl').
:-consult('TDA-Chatbot_19080187_SalasMardones.pl').
:-consult('TDA-System_19080187_SalasMardones.pl').


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2. TDA Option - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: option
% Predicado realizado en el archivo
% 'TDA-Option_19080187_SalasMardones.pl'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 3. TDA Flow - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: flow
% Predicado realizado en el archivo
% 'TDA-Flow_19080187_SalasMardones.pl'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 4. TDA Flow - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: flowAddOption
% Descripcion: Predicado modificador para aniadir opciones a un flujo. El predicado verifica que las opciones aniadidas no se repitan en base al ID
%              de estros

% Dominio: List(Flow) X List(Option) X List (Flow)
% Meta Principal: flowAddOption
% Meta Secundaria: isFlow, isOption, getFlowId, getFlowNameMsg,
%                  optionsRepetidosPorId, myMember, myAppend
flowAddOption(Flow, Option, FlowS) :-
    isFlow(Flow),
    isOption(Option),
    getFlowOption(Flow, FlowOption),
    \+ optionIdRepetido(Option, FlowOption),  % Verifica que la opción sea única en función del ID
    not(myMember(Option, FlowOption)),         % Verifica que la opción sea única en la lista actual
    myAppend(FlowOption, [Option], NewOptions),
    updateFlowOptions(Flow, NewOptions, FlowS).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 5. TDA Chatbot - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: chatbot
% Predicado realizado en el archivo
% 'TDA-Chatbot_19080187_SalasMardones.pl'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 6. TDA Chatbot - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: chatbotAddFlow
% Descripcion: Predicado modificador para aniadir flujos a un chatbot
% Dominio: List(Chatbot) X List(Flow) X List(Chatbot)
% Meta Principal: chatbotAddFlow
% Meta Secundaria: getChatbotId, getChatbotName, getChatbotWelcomeMsg,
%                  getChatbotStartFlowId, getChatbotFlows,
%                  flowsRepetidosPorId, myMember, insertarAlFinal

chatbotAddFlow(Chatbot, Flow, ChatbotS) :-
    is_list(Chatbot),
    isFlow(Flow),
    getChatbotFlows(Chatbot, FlowsChatbot),
    \+ flowIdRepetido(Flow, FlowsChatbot),  % Verifica que el flujo sea único en función del ID
    not(myMember(Flow, FlowsChatbot)),       % Verifica que el flujo sea único en la lista actual
    insertarAlFinal(Flow, FlowsChatbot, NewFlows),
    updateChatbotFlows(Chatbot, NewFlows, ChatbotS).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 7. TDA System - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: system
% Predicado realizado en el archivo
% 'TDA-System_19080187_SalasMardones.pl'


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 8. TDA System - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemAddChatbot
% Descripcion: Predicado modificador para aniadir chatbots a un sistema.
% Dominio: List(System) X List(Chatbot) X List(System)
% Meta Principal: systemAddChatbot
% Meta Secundaria: is_list, getSystemName,
%                  getSystemInitialChatbotCodeLink, getSystemChatbots,
%                  getSystemUsers, getSystemChatHistory,
%                  getSystemCurrentUser, chatBotsRepetidosPorId,
%                  myMember, insertarAlFinal
systemAddChatbot(System, Chatbot, SystemS) :-
    is_list(System),
    is_list(Chatbot),  % Asegúrate de que Chatbot sea un chatbot válido
    getSystemChatbots(System, SystemChatbots),
    \+ chatbotIdRepetido(Chatbot, SystemChatbots),  % Verifica que el chatbot sea único en función del ID
    not(myMember(Chatbot, SystemChatbots)),          % Verifica que el chatbot sea único en la lista actual
    insertarAlFinal(Chatbot, SystemChatbots, NewChatbots),
    updateSystemChatbots(System, NewChatbots, SystemS).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 9. TDA System - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemAddUser
% Descripcion: Predicado modificador para aniadir usuarios a un sistema.
% Dominio: List(System) X String(User) X List(System)
% Meta Principal: systemAddUser
% Meta Secundaria: is_list, string, getSystemName, getSystemInitialChatbotCodeLink, getSystemChatbots,
%                  getSystemUsers, getSystemChatHistory,
%                  getSystemCurrentUser, myMember, insertarAlFinal
systemAddUser(System, User, SystemS):-
    is_list(System),
    string(User),
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, SystemInitialChatbotCodeLink),
    getSystemChatbots(System, SystemChatbots),
    getSystemUsers(System, SystemUsers),
    getSystemChatHistory(System, SystemChatHistory),
    getSystemCurrentUser(System, SystemCurrentUser),
    not(myMember(User, SystemUsers)),
    insertarAlFinal(User, SystemUsers, NewUsers),
    SystemS = [SystemName, SystemInitialChatbotCodeLink, SystemChatbots, NewUsers,SystemChatHistory, SystemCurrentUser].


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 10. TDA System - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemLogin
% Descripcion: Predicado que permite iniciar una sesion en el sistema
% Dominio: List(System) X String(User) X List(System)
% % Meta Principal: systemLogin
% Meta Secundaria: is_list, string, getSystemName, getSystemInitialChatbotCodeLink, getSystemChatbots,
%                  getSystemUsers, getSystemChatHistory,
%                  getSystemCurrentUser, myMember
systemLogin(System, User, SystemS):-
    is_list(System),
    string(User),
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, SystemInitialChatbotCodeLink),
    getSystemChatbots(System, SystemChatbots),
    getSystemUsers(System, SystemUsers),
    getSystemChatHistory(System, SystemChatHistory),
    getSystemCurrentUser(System, SystemCurrentUser),
    SystemCurrentUser == "NoUser",
    %not(SystemCurrentUser == User), %Verifica que el usuario no esta conectado
    myMember(User, SystemUsers), %Verifica que el usuario existe
    SystemS = [SystemName, SystemInitialChatbotCodeLink, SystemChatbots, SystemUsers, SystemChatHistory, User].



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 11. TDA System - Modificador %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Nombre predicado: systemLogout
% Descripcion: Predicado que permite cerrar una sesion abierta
% Dominio: List(System) X List(System)
% Meta Principal: systemLogout
% Meta Secundaria: is_list, getSystemName, getSystemInitialChatbotCodeLink, getSystemChatbots,
%                  getSystemUsers, getSystemChatHistory,
%                  getSystemCurrentUser
systemLogout(System, SystemS):-
    is_list(System),
    getSystemName(System, SystemName),
    getSystemInitialChatbotCodeLink(System, SystemInitialChatbotCodeLink),
    getSystemChatbots(System, SystemChatbots),
    getSystemUsers(System, SystemUsers),
    getSystemChatHistory(System, SystemChatHistory),
    getSystemCurrentUser(System, SystemCurrentUser),
    not(SystemCurrentUser == "NoUser"), %Verifica que hay un usuario conectado
    SystemS = [SystemName, SystemInitialChatbotCodeLink, SystemChatbots, SystemUsers, SystemChatHistory, "NoUser"].




