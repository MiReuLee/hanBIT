num1, num2 = 10, 20
def my_info(a, b):
    num1, num2 = 100, 200
    num1 += a
    num2 += b
    print(num1, num2)
my_info(num1, num2)
print("num1: {0}, num2: {1}".format(num1, num2))