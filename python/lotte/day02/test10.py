def my_add(a = 10, b = 20):
    return a + b
print
(my_add())
print
(my_add(100))
print
(my_add(100, 200))

print("-" * 30)

def connect_sock(ip, port, host):
    print("Connected : " + str(ip) + " : " + str(port) + " : " + str(host))
connect_sock("192.168.0.110", 8000, "mlec")
connect_sock(host="mlec", port=8000, ip="192.168.0.110")
connect_sock("192.168.0.110", host="mlec", port=8000)

print("-" * 30)

def arg_func(*args):
    print(type(args))
    return args
retVal = arg_func(
"banana", "berry", "graph")
print(type(retVal))
print(retVal)
print()
retVal = arg_func(10, 20, 30, "user")
print(type(retVal))
print(retVal)