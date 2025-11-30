function b=riempimento_manuale_vettore(intervallo,equazioni)
% Funzione di riempimento manuale del vettore colonna b con n*1 elementi
% intervallo è l'insieme dei valori di cui fanno parte gli elementi di b
% equazioni è il numero di equazioni scelto dall'utente per il sistema Ax=b
% b è il vettore colonna avente i termini noti del sistema iniziale Ax=b

b=[];           % Inizializzazione del vettore colonna come vettore vuoto
e=intervallo(2)+1;  % Inizializzazione dell'elemento da inserire in b
for i=1:equazioni   % Ciclo per inserire gli elementi nel vettore b
    while e<intervallo(1) || e>intervallo(2)    % Ciclo di controllo degli
                                                % errori inserendo gli
                                                % elementi nel vettore b
        % Messaggio per gli elementi da inserire nel vettore b
        fprintf("Inserire il %d° elemento (b%d) (Termine noto della %d° equazione) (Da %d a %d)",i,i,i,intervallo(1),intervallo(2));
        e=input(": ");  % Inserimento dell'elemento richiesto per b
        if e<intervallo(1) || e>intervallo(2)
            % Messaggio di errore per gli elementi di b
            fprintf("\nErrore! Deve essere inserito un valore compreso tra %d e %d!\n",intervallo(1),intervallo(2));
        end
    end
    b=[b;e];            % Aggiunta elemento al vettore b
    e=intervallo(2)+1;  % Inizializzazione per rientrare nel ciclo while
end