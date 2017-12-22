one = 1
two = 1
while one < 9:
    one += 1
    while two < 9:
        two += 1
        """print(str(one)+"X"+str(two)+" = "+str(two*one))"""
    two = 1

index = [1, 2, 3, 4, 5, 6, 7, 8, 9]
for i in index[1:]:
    for j in index:
        print(str(i)+"X"+str(j)+" = "+str(i*j))