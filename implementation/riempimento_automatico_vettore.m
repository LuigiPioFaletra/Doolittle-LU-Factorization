function b=riempimento_automatico_vettore(intervallo,equazioni)
% Funzione di riempimento automatico della vettore colonna con n*1 elementi
% intervallo è l'insieme dei valori di cui fanno parte gli elementi di b
% equazioni è il numero di equazioni scelto dall'utente per il sistema Ax=b
% b è il vettore colonna dei termini noti del sistema iniziale Ax=b

b=randi(intervallo,equazioni,1);            % Immissione n*1 valori casuali