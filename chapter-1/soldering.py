""" Problem:
Given a list of S points in a plane, traverse all the points in a way that distance travelled is minimized
"""
from math import sqrt
S = [(-2, 3), (0, 4), (1,-2), (-3, -1)]

naive_distance = 0

for i in range(0, len(S) - 1):
    naive_distance += sqrt((S[i][0] - S[i + 1][0])**2 + (S[i][1] - S[i+1][1])**2)

print(f"Naive distance: {naive_distance:.2f}")

visited = set()
shortest_order = list()
shortest_distance = 0

i = 1
while len(visited) != len(S):
    shortest_order.append(S[i])
    if (S[i] in visited): continue
    visited.add(S[i])
    D = list()
    for j in range(0, len(S)):
        if (S[j] in visited): continue
        d = sqrt((S[i][0] - S[j][0])**2 + (S[i][1] - S[j][1])**2)
        D.append((j, d)) # append the tuple (index, distance)

    if not D: break
    next_point = min(D, key=lambda p: p[1])
    shortest_distance += next_point[1]
    i = next_point[0]
    
print("Sortest order: ", shortest_order)
print(f"Sortest distance: {shortest_distance:.2f}")


# After have written this, I thought if I could pick any starting point, I could further reduce the distance travelled.
# I tried and found out i = 1 and i = 2 is the most optimal case, reduce the distasnce travelled to 10.48 unit!
