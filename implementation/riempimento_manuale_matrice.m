function A=riempimento_manuale_matrice(intervallo,elementi,equazioni)
% Funzione di riempimento manuale della matrice A con n*n elementi
% intervallo è l'insieme dei valori di cui fanno parte gli elementi di A
% elementi è il numero di elementi di cui è costituita la matrice A
% equazioni è il numero di equazioni scelto dall'utente per il sistema Ax=b
% A è la matrice avente i coefficienti del sistema iniziale Ax=b

A=[];               % Inizializzazione della matrice A come matrice vuota
r=[];               % Vettore riga per inserire elementi nella matrice A
riga=1;             % Indice che identifica il numero di riga
colonna=1;          % Indice che identifica il numero di colonna
e=intervallo(2)+1;  % Inizializzazione dell'elemento da inserire in A

for i=1:elementi    % Ciclo per inserire gli elementi nella matrice A
    while e<intervallo(1) || e>intervallo(2)    % Ciclo di controllo degli
                                                % errori inserendo gli
                                                % elementi nella matrice A
        % Messaggio per gli elementi da inserire nella matrice A
        fprintf("Inserire il %d° elemento (a%d%d) (Coefficiente che moltiplica l'incognita x%d nella %d° equazione) (Da %d a %d)",i,riga,colonna,colonna,riga,intervallo(1),intervallo(2));
        e=input(": ");          % Inserimento dell'elemento richiesto per A
        if e<intervallo(1) || e>intervallo(2)
            % Messaggio di errore per gli elementi di A
            fprintf("\nErrore! Deve essere inserito un valore compreso tra %d e %d!\n",intervallo(1),intervallo(2));
        end
    end
    r=[r,e];                    % Aggiunta dell'elemento al vettore riga
    colonna=colonna+1;          % Incremento del valore della colonna
    if colonna==equazioni+1     % Controllo del valore della colonna
        A=[A;r];    % Inserimento elementi vettore riga nella matrice A
        r=[];       % Eliminazione precedenti elementi nel vettore riga
        riga=riga+1;    % Incremento del contatore del numero di riga
        colonna=1;      % Ripristino del valore del numero di colonna
    end
    e=intervallo(2)+1;  % Inizializzazione per rientrare nel ciclo while
end