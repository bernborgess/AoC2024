l1: list[int] = []
l2: list[int] = []

while True:
    try:
        line = input()
        [x, y] = list(map(int, line.split()))
        l1.append(x)
        l2.append(y)
    except:
        break


l1.sort()
l2.sort()


# TODO: Type the lambda
# fn = lambda x : lambda y : abs(x-y)
def fn(xy: tuple[int, int]):
    [x, y] = xy
    return abs(x - y)


print(sum(map(fn, zip(l1, l2))))
