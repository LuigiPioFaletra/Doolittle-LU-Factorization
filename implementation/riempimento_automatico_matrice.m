function A=riempimento_automatico_matrice(intervallo,equazioni)
% Funzione di riempimento automatico della matrice A con n*n elementi
% intervallo è l'insieme dei valori di cui fanno parte gli elementi di A
% equazioni è il numero di equazioni scelto dall'utente per il sistema Ax=b
% A è la matrice avente i coefficienti del sistema iniziale Ax=b

A=randi(intervallo,equazioni,equazioni);    % Immissione n*n valori casuali