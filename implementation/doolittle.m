function [L,U,y,x,n_op]=doolittle(A,b)
% Funzione di esecuzione della fattorizzazione di Doolittle
% A è la matrice dei coefficienti del sistema iniziale Ax=b
% b è il vettore colonna dei termini noti del sistema iniziale Ax=b
% L è la matrice triangolare inferiore di A
% U è la matrice triangolare superiore di A
% y è il vettore colonna dato dal prodotto tra la matrice L e il vettore x
% x è il vettore colonna contenente le soluzioni del sistema di partenza
% n_op è il numero di operazioni svolte per trovare il costo computazionale

    n_op=0;         % Inizializzazione del numero di operazioni
    [r,~]=size(A);  % Calcolo del numero di righe e colonne di A
    n=length(b);    % Calcolo del valore maggiore tra righe e colonne di b
    x=zeros(n,1);   % Creazione vettore colonna formato da n elementi 0
    y=zeros(n,1);   % Creazione vettore colonna formato da n elementi 0
    % Decomposizione della matrice mediante fattorizzazione di Doolittle
    for i=1:n       % Ciclo per i che va da 1 a n
        for j=1:(i-1)       % Altro ciclo per j che va da 1 a i-1
            temp=A(i,j);    % Uguaglianza tra temp e l'elemento i,j di A
            for k=1:(j-1)   % Ulteriore ciclo per k che va da 1 a j-1
                temp=temp-A(i,k)*A(k,j);    % Sottrazione tra temp e il
                                            % prodotto degli elementi i,k e
                                            % k,j di A
                n_op=n_op+1;        % Incremento del numero di operazioni
            end
            A(i,j)=temp/A(j,j);     % Divisione tra temp e l'elemento j,j
                                    % di A, con il risultato sostituito
                                    % all'elemento i,j di A
            n_op=n_op+1;            % Incremento del numero di operazioni
        end
        for j=i:n           % Altro ciclo per j che va da i a n
            temp=A(i,j);    % Uguaglianza tra temp e l'elemento i,j di A
            for k=1:(i-1)   % Ulteriore ciclo per k che va da 1 a i-1
                temp=temp-A(i,k)*A(k,j);    % Sottrazione tra temp e il
                                            % prodotto degli elementi i,k e
                                            % k,j di A
                n_op=n_op+1;        % Incremento del numero di operazioni
            end
            A(i,j)=temp;    % Uguaglianza tra l'elemento i,j di A e temp
            n_op=n_op+1;            % Incremento del numero di operazioni
        end
    end
    % Calcolo delle soluzioni di Ly=b
    for i=1:n       % Ciclo per i che va da 1 a n
        temp=0;     % Rimozione del valore salvato in temp, posto a 0
        for j=1:i                   % Altro ciclo per j che va da 1 a i
            temp=temp+A(i,j)*y(j);  % Somma tra temp e il prodotto tra gli
                                    % elementi i,j di A e j di y
            n_op=n_op+1;            % Incremento del numero di operazioni
        end
        y(i)=b(i)-temp;             % Uguaglianza tra l'elemento i di y e
                                    % la sottrazione tra l'elemento i di b
                                    % e il valore di temp
        n_op=n_op+1;                % Incremento del numero di operazioni
    end
    % Calcolo delle soluzioni di Ux=y
    for i=n:(-1):1  % Ciclo per i che va da n a 1
        temp=0;     % Rimozione del valore salvato in temp, posto a 0
        for j=(i+1):n               % Ciclo per j che va da i+1 a n
            temp=temp+A(i,j)*x(j);  % Somma tra temp e il prodotto tra gli
                                    % elementi i,j di A e j di x
            n_op=n_op+1;            % Incremento del numero di operazioni
        end
        x(i)=(y(i)-temp)/A(i,i);    % Uguaglianza tra l'elemento i di x e
                                    % la divisione tra l'elemento i di y
                                    % sottratto temp e quello i,i di A
        n_op=n_op+1;                % Incremento del numero di operazioni
    end
    L=eye(r);                   % Uguaglianza tra la matrice triangolare
                                % inferiore e la matrice identità
    U=triu(A);                  % Inserimento in U della parte triangolare
                                % superiore della matrice A
    L=L+tril(A(1:r,1:r),-1);    % Somma tra i valori di L e quelli della
                                % parte triangolare inferiore di A
end