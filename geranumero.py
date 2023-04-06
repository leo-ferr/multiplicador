from random import randrange
import numpy as np

int_to_bin = lambda x, size=8: np.binary_repr(x, width=size)

numbers1 = [randrange(-128, 127) for _ in range(50)]
numbers2 = [randrange(-128, 127) for _ in range(50)]
result = [int_to_bin( a * b , 16) for a, b in zip(numbers1, numbers2)]


with open("numeros.txt", "+w") as file:
   for i, j, r in zip(numbers1, numbers2, result):
      file.write(f"{int_to_bin(i)}{int_to_bin(j)}{r}\n")



# print()



# print(f'{15:08b}')
# print( )
