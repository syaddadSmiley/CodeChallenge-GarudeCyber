# A farmer has 3 different capacities for a bucket of water, and the waterbucket capacity is a prime number between 0 to 30 liters (0 < Bottle x < 30). How many bottles from each different capacity does the farmer need to contain X litters of water (100 < X < 10000000) such that the total number of bottles needed is the fewest? 

# Example: 
# Bottle 1 = 5 litter 
# Bottle 2 = 7 litter 
# Bottle 3 = 11 liter 
# X = 100 
# Answer: 
# Bottle 3 = 9 bottles, Bottle 1 = 1 bottle, Bottle 2 = 0 bottle, total = 10 bottles 
# or 
# Bottle 3 = 9 bottles, Bottle 1 = 0 bottle, Bottle 2 = 1 bottle, total = 10 bottles

# Solution:
# 1. Find the prime number between 0 to 30
# 2. Find the combination of the prime number to get the X litters of water
# 3. Find the minimum number of bottles needed
import math
import itertools

def bottle_solution(bucket_capacity, target_volume):
    num_bottles = [1] * len(bucket_capacity)
    for i in range(len(bucket_capacity) -1, -1, -1):
        bottle_num = target_volume // bucket_capacity[i]
        if bottle_num > 0 or (bottle_num == 0 and target_volume == 0):
            num_bottles[i] = bottle_num
            target_volume %= bucket_capacity[i]
    return num_bottles

# prime numbers between 0 and 30
bucket_capacity = [5, 7, 11]
target_volume = 100

# Find the smallest total number of bottles needed
min_bottles = math.inf
for capacity in itertools.permutations(bucket_capacity):
    num_bottles = bottle_solution(capacity, target_volume)
    total_bottles = sum(num_bottles)
    if total_bottles < min_bottles:
        min_bottles = total_bottles
        best_solution = num_bottles

print(f"Bottle 1: {best_solution[0]} bottles")
print(f"Bottle 2: {best_solution[1]} bottles")
print(f"Bottle 3: {best_solution[2]} bottles")
print(f"Total: {min_bottles} bottles")
