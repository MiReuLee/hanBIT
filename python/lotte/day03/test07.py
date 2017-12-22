class MyFunc:
    data = "World"
    def print_info(self):
        print("Hello {0}".format(self.data))
my = MyFunc()
my.print_info()
my.data = "Good Korea"
my.print_info()
