% pex5.pl
% USAFA UFO Sightings 2024
%
% name: C2C Tyler Clifton
%
% Documentation: I asked C2C Woodring whether or not we should make each object appear exactly once for the problem.
% Otherwise, most of my code came from HW7 prolog code

% The query to get the answer(s) or that there is no answer
% ?- solve.

solve :-
    % Define the solution structure: [tue, wed, thu, fri]
    % Each element is (Cadet, Object)
    Solution = [(TueCadet, TueObj), (WedCadet, WedObj), 
                (ThuCadet, ThuObj), (FriCadet, FriObj)],
    
    % Define valid cadets and objects
    Cadets = [smith, garcia, chen, jones],
    Objects = [balloon, kite, cloud, fighter],
    
    % Each cadet appears once
    permutation(Cadets, [TueCadet, WedCadet, ThuCadet, FriCadet]),
    
    % Each object appears once
    permutation(Objects, [TueObj, WedObj, ThuObj, FriObj]),
    
    % constraints:
    % C4C Smith saw a cloud
    member((smith, cloud), Solution),
    
    % C4C Smith did not see a weather balloon, nor kite
    \+ member((smith, balloon), Solution),
    \+ member((smith, kite), Solution),
    
    % The one who saw the kite isn't C4C Garcia
    \+ member((garcia, kite), Solution),
    
    % Fighter aircraft was spotted on Friday
    FriObj = fighter,
    
    % Friday's sighting was made by either C4C Chen or the one who saw the fighter
    (FriCadet = chen ; member((FriCadet, fighter), Solution)),
    
    % The kite was not sighted on Tuesday
    TueObj \= kite,
    
    % Neither C4C Garcia nor C4C Jones saw the weather balloon
    \+ member((garcia, balloon), Solution),
    \+ member((jones, balloon), Solution),
    
    % C4C Jones did not make their sighting on Tuesday
    TueCadet \= jones,
    
    % The weather balloon was not spotted on Wednesday
    WedObj \= balloon,
    
    % Print the solution in day order
    write('Tuesday: C4C '), write(TueCadet), write(' saw a '), write(TueObj), nl,
    write('Wednesday: C4C '), write(WedCadet), write(' saw a '), write(WedObj), nl,
    write('Thursday: C4C '), write(ThuCadet), write(' saw a '), write(ThuObj), nl,
    write('Friday: C4C '), write(FriCadet), write(' saw a '), write(FriObj), nl.
