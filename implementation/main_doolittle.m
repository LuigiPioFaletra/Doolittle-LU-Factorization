% Main da eseguire riguardante il metodo di fattorizzazione di Doolittle
% Esempio 1: alle richieste del programma, premere nell'ordine:
% 3, 1, 1, 3, 6, 2, -1, 1, 4, -2, 3, 3, 9, 19
% Input:    A=[1,3,6; 2,-1,1; 4,-2,3], B=[3,9,19]
% Output:   L=[1,0,0; 2,1,0; 4,2,1], U=[1,3,6; 0,-7,-11; 0,0,1]
%           y=[3,3,1], x=[3,-2,1]
% Esempio 2: alle richieste del programma, premere nell'ordine:
% 3, 1, 3, 1, 1, -3, -3, 1, 3, -3, 6, 2, -4, 0
% Input:    A=[3,1,1; -3,-3,1; 3,-3,6], B=[2,-4,0]
% Output:   L=[1,0,0; -1,1,0; 1,2,1], U=[3,1,1; 0,-2,2; 0,0,1]
%           y=[2,-2,2], x=[-1,3,2]
% Esempio 3: alle richieste del programma, premere nell'ordine:
% 3, 1, 2, 2, 1, 1, -1, (13/2), -2, -(10/3), 6, 6, -15, -24
% Input:    A=[2,2,1; 1,-1,(13/2); -2,-(10/3),6], B=[6,-15,-24]
% Output:   L=[1,0,0; (1/2),1,0; -1,(2/3),1], U=[2,2,1; 0,-2,6; 0,0,3]
%           y=[6,-18,-6], x=[1,3,-2]

clear all               % Rimozione di tutti gli elementi nel workspace
close all               % Chiusura di tutte le figure e i grafici aperti
clc                     % Pulizia della finestra di comando

intervallo=[-25,25];    % Intervallo di valori entro cui gli elementi di A
                        % e b devono essere contenuti
ordine_max=10;          % Ordine massimo consentito per la matrice A
% Messaggio di esplicitazione del metodo implementato e utilizzato
fprintf("Programma che implementa il metodo di fattorizzazione di Doolittle\nPer chiudere il programma, usare Ctrl+C\n");
[equazioni,elementi,creazione]=dati_input(ordine_max);  % Utilizzo funzione
                                                        % "dati_input"
if creazione==1         % Caso di creazione manuale di A e b
    % Utilizzo funzione "riempimento_manuale_matrice"
    A=riempimento_manuale_matrice(intervallo,elementi,equazioni);
    % Utilizzo funzione "riempimento_manuale_vettore"
    b=riempimento_manuale_vettore(intervallo,equazioni);
elseif creazione==2     % Caso di creazione automatica di A e b
    % Utilizzo funzione "riempimento_automatico_matrice"
    A=riempimento_automatico_matrice(intervallo,equazioni);
    % Utilizzo funzione "riempimento_automatico_vettore"
    b=riempimento_automatico_vettore(intervallo,equazioni);
end
A                   % Visualizzazione in output della matrice A
b                   % Visualizzazione in output del vettore colonna b
[L,U,y,x,n_op]=doolittle(A,b)   % Applicazione fattorizzazione di Doolittle
n_op_p=calcolo_costo_computazionale(A)  % Utilizzo funzione
                                        % "calcolo_costo_computazionale"
err_perc=abs(100-(n_op_p*100)/n_op);    % Calcolo errore percentuale
err_perc=round(err_perc,2)      % Arrotondamento errore percentuale
clear colonna;      % Rimozione del contatore di colonna dal workspace
clear creazione;    % Rimozione della variabile di creazione dal workspace
clear elementi;     % Rimozione del numero di elementi dal workspace
clear e;            % Rimozione del contenitore dell'elemento dal workspace
clear equazioni;    % Rimozione del numero di equazioni dal workspace
clear i;            % Rimozione delle posizioni nella matrice dal workspace
clear intervallo;   % Rimozione dell'intervallo di valori per gli elementi
clear ordine_max;   % Rimozione dell'ordine massimo di A dal workspace
clear r;            % Rimozione della riga degli elementi dal workspace
clear riga;         % Rimozione del contatore di riga dal workspace