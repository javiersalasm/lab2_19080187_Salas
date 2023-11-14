%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 2. TDA Option - Constructor %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Representacion: Code (Integer) X Message (String) X ChatbotCodeLink (Integer) X InitialFlowCodeLink (Integer) X Keyword (List)
% Nombre predicado: option
% Descripcion: Predicado constructor de una opcion para flujo de un chatbot. Cada opcion se enlaza a un chatbot y flujo especificados
%              por sus respectivos codigos. El codigo de un option es unico. Su unicidad se verifica al momento de agregarlo a un flow
%              a fin de evitar duplicidad
% Dominio: Integer X String X Integer X Integer X List X TDA Option
% Meta Principal: Option
% Meta Secundaria: integer, string, integer, integer, is_list
option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, [Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword]):-
    integer(Code),
    string(Message),
    integer(ChatbotCodeLink),
    integer(InitialFlowCodeLink),
    is_list(Keyword).

% isOption/1
% Descripcion: Verifica que una lista sea una opcion valida
% Dominio: Integer X String X Integer X Integer X List
% Meta Principal: isOption
% Meta Secundaria: NA
isOption(Option):-
    option(Code, Message, ChatbotCodeLink, InitialFlowCodeLink, Keyword, Option),
    integer(Code),
    string(Message),
    integer(ChatbotCodeLink),
    integer(InitialFlowCodeLink),
    is_list(Keyword).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TDA Option - Selector %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% getOptionCode/2
% Descripcion: Selector que extrae el Codigo de una opcion
% Dominio: List X Integer
% Meta Principal: getOptionCode
% Meta Secundaria: isOption
getOptionCode(Option, Code) :-
    isOption(Option),  % Asegurarse de que Option es una opción válida
    Option = [Code, _, _, _, _].


