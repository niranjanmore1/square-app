import sys

n = float(sys.argv[1]) if len(sys.argv) > 1 else 4
result = n * n
print(int(result) if result == int(result) else result)
