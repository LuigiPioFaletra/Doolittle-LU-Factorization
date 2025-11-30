# MATLAB Project - Doolittle LU Factorization

## Introduction
The MATLAB program implements the Doolittle LU factorization method. This is part of the LU factorization methods, where the matrix \(A\) of the system \(A \cdot x = b\) is decomposed into the product of two matrices \(L\) and \(U\), which are lower and upper triangular matrices, respectively.

- **Lower triangular matrix (L):** elements above the main diagonal are zero.  
  \(\forall i < j, a_{ij} = 0\)
- **Upper triangular matrix (U):** elements below the main diagonal are zero.  
  \(\forall i > j, a_{ij} = 0\)

Matrix \(A\) can therefore be written as:
\[
A = L \cdot U
\]

The system \(A \cdot x = b\) can be rewritten as:
\[
(L \cdot U) \cdot x = b \quad \Rightarrow \quad L \cdot (U \cdot x) = b
\]
By setting \(U \cdot x = y\), the system is solved in two steps:
1. \(L \cdot y = b\) using forward substitution.
2. \(U \cdot x = y\) using backward substitution.

---

## Doolittle Factorization Method
Given a 3×3 matrix \(A\):

\[
A = 
\begin{bmatrix} 
a_{11} & a_{12} & a_{13} \\ 
a_{21} & a_{22} & a_{23} \\ 
a_{31} & a_{32} & a_{33} 
\end{bmatrix} 
=
\begin{bmatrix} 
l_{11} & 0 & 0 \\ 
l_{21} & l_{22} & 0 \\ 
l_{31} & l_{32} & l_{33} 
\end{bmatrix} 
\cdot
\begin{bmatrix} 
u_{11} & u_{12} & u_{13} \\ 
0 & u_{22} & u_{23} \\ 
0 & 0 & u_{33} 
\end{bmatrix}
\]

To reduce the unknowns from 12 to 9, we impose:
\[
l_{11} = l_{22} = l_{33} = 1
\]

This allows solving the system of 9 equations in 9 unknowns directly.

---

## Examples

### Example 1
\[
A = 
\begin{bmatrix} 
1 & 3 & 6 \\ 
2 & -1 & 1 \\ 
4 & -2 & 3 
\end{bmatrix}, \quad 
b = 
\begin{bmatrix} 
3 \\ 9 \\ 19 
\end{bmatrix}
\]

LU factorization solution:

\[
L = 
\begin{bmatrix} 
1 & 0 & 0 \\ 
2 & 1 & 0 \\ 
4 & 2 & 1 
\end{bmatrix}, \quad
U = 
\begin{bmatrix} 
1 & 3 & 6 \\ 
0 & -7 & -11 \\ 
0 & 0 & 1 
\end{bmatrix}
\]

\[
y = 
\begin{bmatrix} 
3 \\ 3 \\ 1 
\end{bmatrix}, \quad
x = 
\begin{bmatrix} 
3 \\ -2 \\ 1 
\end{bmatrix}
\]

---

### Example 2
\[
A = 
\begin{bmatrix} 
3 & 1 & 1 \\ 
-3 & -3 & 1 \\ 
3 & -3 & 6 
\end{bmatrix}, \quad 
b = 
\begin{bmatrix} 
2 \\ -4 \\ 0 
\end{bmatrix}
\]

\[
L = 
\begin{bmatrix} 
1 & 0 & 0 \\ 
-1 & 1 & 0 \\ 
1 & 2 & 1 
\end{bmatrix}, \quad
U = 
\begin{bmatrix} 
3 & 1 & 1 \\ 
0 & -2 & 2 \\ 
0 & 0 & 1 
\end{bmatrix}
\]

\[
y = 
\begin{bmatrix} 
2 \\ -2 \\ 2 
\end{bmatrix}, \quad
x = 
\begin{bmatrix} 
-1 \\ 3 \\ 2 
\end{bmatrix}
\]

---

### Example 3
\[
A = 
\begin{bmatrix} 
2 & 2 & 1 \\ 
1 & -1 & 13/2 \\ 
-2 & -10/3 & 6 
\end{bmatrix}, \quad 
b = 
\begin{bmatrix} 
6 \\ -15 \\ -24 
\end{bmatrix}
\]

\[
L = 
\begin{bmatrix} 
1 & 0 & 0 \\ 
1/2 & 1 & 0 \\ 
-1 & 2/3 & 1 
\end{bmatrix}, \quad
U = 
\begin{bmatrix} 
2 & 2 & 1 \\ 
0 & -2 & 6 \\ 
0 & 0 & 3 
\end{bmatrix}
\]

\[
y = 
\begin{bmatrix} 
6 \\ -18 \\ -6 
\end{bmatrix}, \quad
x = 
\begin{bmatrix} 
1 \\ 3 \\ -2 
\end{bmatrix}
\]

---

## Computational Cost
- **LU factorization:** about \(n^3/3\) operations.
- **Forward and backward substitution:** about \(n^2\) operations each.
- **Total:** \((n^3/3) + 2 n^2\) operations.  
  For large \(n\), the cost is approximately \(n^3/3\).

---

## MATLAB Implementation
The project contains 8 `.m` files:

- **Main:** `main_doolittle.m` – runs the program.
- **Support functions (7):**
  1. `calcolo_costo_computazionale.m`
  2. `dati_input.m`
  3. `doolittle.m`
  4. `riempimento_automatico_matrice.m`
  5. `riempimento_automatico_vettore.m`
  6. `riempimento_manuale_matrice.m`
  7. `riempimento_manuale_vettore.m`

### Main (`main_doolittle.m`)
- Workspace cleanup: `clear all`, `close all`, `clc`
- Initialize intervals and maximum matrix order
- Display introductory message
- Call `dati_input` function
- Create matrices and vectors (manual/automatic)
- Display matrices A and b
- Call `doolittle` and `calcolo_costo_computazionale`
- Calculate and display absolute percentage error
- Remove temporary variables

### Main Functions
- **`calcolo_costo_computazionale`:** calculates expected number of operations.
- **`dati_input`:** handles user input for number of equations and creation mode.
- **`doolittle`:** performs LU factorization and solves the system.
- **`riempimento_automatico_matrice` & `riempimento_automatico_vettore`:** create random matrices and vectors.
- **`riempimento_manuale_matrice` & `riempimento_manuale_vettore`:** allow manual input of values.

---

## Usage
1. Open MATLAB and navigate to the project folder.
2. Run:
```matlab
main_doolittle
```
3. Follow the instructions to input matrices and vectors.
4. View results of 𝐿, 𝑈, 𝑦, and 𝑥.
