num = 10
def local_num(a):
    global num
    num = 100
    return a + num
def global_num(a):
    return a + num
print("num : {0}".format(num))
val1 = local_num(100)
val2 = global_num(100)
print(val1)
print(val2)
print("num : {0}".format(num))

num = 10
print(num)
del num
print(num)