# 2609 Python 풀이

## 문제
두 개의 자연수를 입력받아 최대공약수와 최소공배수를 출력하는 프로그램을 작성하시오.

- 링크: [https://www.acmicpc.net/problem/2609](https://www.acmicpc.net/problem/2609)

## 풀이 과정

### 필요한 개념
1. 최대공약수(GCD): 두 수의 공통된 약수 중 가장 큰 값
2. 최소공배수(LCM): 두 수의 공통된 배수 중 가장 작은 값
3. 유클리드 호제법: gcd(a, b) = gcd(b, a % b)

### 코드

```python
import sys

def gcd(a, b):
    while b != 0:
        a, b = b, a % b
    return a

def lcm(a, b):
    return (a * b) // gcd(a, b)

if __name__ == "__main__":
    a, b = map(int, sys.stdin.readline().split())
    print(gcd(a, b))
    print(lcm(a, b))
```

### 라이브러리 활용 (간단 버전)

```python
import math

a, b = map(int, input().split())
print(math.gcd(a, b))
print(math.lcm(a, b))
```
