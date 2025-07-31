from random import gauss

logn = 4
LOGN = logn
DIM = 1 << logn

nb_traces = 1000

# Generate 2D array of keys
keys_matrix = [
    [int(gauss(0, 4)) for _ in range(DIM)]  # Key for each trace
    for _ in range(nb_traces)
]

# Printing 2D array (matrix) in C-style format
for row in keys_matrix:
    print("{", end=" ")
    print(", ".join(map(str, row)), end=" ")
    print("},")
