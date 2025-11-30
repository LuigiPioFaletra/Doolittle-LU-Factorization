# MATLAB Project - Doolittle LU Factorization

## Introduction
The MATLAB program implements the Doolittle LU factorization method. This is part of the LU factorization methods, where the matrix `A` of the system `A * x = b` is decomposed into the product of two matrices `L` and `U`, which are lower and upper triangular matrices, respectively.

- **Lower triangular matrix (L):** elements above the main diagonal are zero.  
  ```text
  For i < j, a_ij = 0
  ```
- **Upper triangular matrix (U):** elements below the main diagonal are zero.  
  ```text
  For i > j, a_ij = 0
  ```

Matrix `A` can therefore be written as:
```text
A = L * U
```

The system `A * x = b` can be rewritten as:
(L * U) * x = b  =>  L * (U * x) = b
By setting `U * x = y`, the system is solved in two steps:
1. `L * y = b` using forward substitution.
2. `U * x = y` using backward substitution.

---

## Doolittle Factorization Method
Given a 3×3 matrix `A`:

A =
a11  a12  a13
a21  a22  a23
a31  a32  a33

L =
l11   0    0
l21  l22   0
l31  l32  l33

U =
u11  u12  u13
 0   u22  u23
 0    0   u33

To reduce the unknowns from 12 to 9, we impose:

l11 = l22 = l33 = 1

This allows solving the system of 9 equations in 9 unknowns directly.

---

## Examples

### Example 1
A =
1   3   6
2  -1   1
4  -2   3

b =
3
9
19

L =
1  0  0
2  1  0
4  2  1

U =
1   3   6
0  -7 -11
0   0   1

y =
3
3
1

x =
3
-2
1

---

### Example 2
A =
3   1   1
-3 -3   1
3  -3   6

b =
2
-4
0

L =
1  0  0
-1 1  0
1  2  1

U =
3   1   1
0  -2   2
0   0   1

y =
2
-2
2

x =
-1
3
2

---

### Example 3
A =
2    2    1
1   -1   13/2
-2  -10/3  6

b =
6
-15
-24

L =
1    0    0
1/2  1    0
-1   2/3  1

U =
2    2    1
0   -2    6
0    0    3

y =
6
-18
-6

x =
1
3
-2

---

## Computational Cost
- **LU factorization:** about `n^3/3` operations.
- **Forward and backward substitution:** about `n^2` operations each.
- **Total:** `(n^3/3) + 2 n^2` operations.  
  For large `n`, the cost is approximately `n^3/3`.

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
