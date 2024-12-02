l1: list[int] = list(map(int, input().split()))
l2: list[int] = list(map(int, input().split()))

l1.sort()
l2.sort()


# TODO: Type the lambda
# fn : int -> int  = lambda x y: abs(x - y)
def fn(xy: tuple[int, int]):
    [x, y] = xy
    return abs(x - y)


print(sum(map(fn, zip(l1, l2))))
