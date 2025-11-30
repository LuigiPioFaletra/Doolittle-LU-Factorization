function [equazioni,elementi,creazione]=dati_input(ordine_max)
% Funzione di inserimento di dati da input
% ordine_max è l'ordine massimo consentito per la matrice A
% equazioni è il numero di equazioni scelto dall'utente per il sistema Ax=b
% elementi è il numero di elementi di cui è costituita la matrice A
% creazione è la modalità di creazione di A e b scelta dall'utente

equazioni=0;    % Inizializzazione del valore di equazioni
creazione=0;    % Inizializzazione del valore di creazione
while equazioni<1 || equazioni>ordine_max   % Ciclo di controllo errori
                                            % inserendo valore di equazioni
    % Messaggio per il numero di equazioni e incognite
    fprintf("\nInserire il numero di equazioni e incognite del sistema (Da 1 a %d)",ordine_max);
    equazioni=input(": ");  % Inserimento numero di equazioni e incognite
    if equazioni<1 || equazioni>ordine_max  % Caso valore errato equazioni
       % Messaggio di errore per equazioni
       fprintf("\nErrore! Deve essere inserito un valore compreso tra 1 e %d!",ordine_max);
    end
end
while creazione<1 || creazione>2    % Ciclo di controllo degli errori
                                    % inserendo il valore di creazione
    % Procedura di inserimento della modalità di creazione di A e b
    creazione=input("\nScelta 1 - Creazione manuale delle matrici\nScelta 2 - Creazione automatica delle matrici\nScegliere come creare le matrici: ");
    if creazione<1 || creazione>2   % Caso di valore errato per creazione
       % Messaggio di errore per creazione
       fprintf("\nErrore! Deve essere inserito un valore che sia 1 o 2!");
    end
end
elementi=equazioni^2;   % Numero di elementi della matrice A, di tipo n*n
fprintf("\n");          % Stampa per andare a capo