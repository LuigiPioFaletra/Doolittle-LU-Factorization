function n_op_p=calcolo_costo_computazionale(A)
% Funzione di calcolo dell'ordine della matrice A per costo computazionale:
% {[(n^3)/3]+2*(n^2)} per n piccolo e (n^3)/3 per n grande
% A è la matrice dei coefficienti del sistema iniziale Ax=b
% n_op_p è il numero di operazioni previste per il costo computazionale

ordine=rank(A);     % Calcolo dell'ordine della matrice A
if ordine<100       % Caso in cui l'ordine della matrice A è piccolo
    n_op_p=((ordine^3)/3)+(2*(ordine^2));   % Calcolo del costo
                                            % computazionale con ordine
                                            % della matrice A piccolo
else                % Caso in cui l'ordine della matrice A è grande
    n_op_p=((ordine^3)/3);      % Calcolo del costo computazionale con
                                % ordine della matrice A grande
end