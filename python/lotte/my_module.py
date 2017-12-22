def add(_list):
    result = 0
    for val in _list:
        result += val
    return result

def add2(num1, num2):
    return num1 + num2

print("run_module 실행 됨")

if __name__ == "__main__":
    print("메인으로 실행")
else:
    print("임포트로 실행")