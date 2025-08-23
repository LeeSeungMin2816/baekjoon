# 9506 Python 풀이

- 문제:  
정수 n이 주어질 때, n의 자기 자신을 제외한 모든 양의 약수(진약수)의 합이 n과 같으면 n을 완전수라고 한다. 여러 개의 n이 입력될 때 각 n에 대해 완전수 여부를 판단하라. (입력은 -1로 종료)

- 입력:  
여러 줄에 걸쳐 정수 n이 한 줄에 하나씩 주어진다. 마지막 줄은 -1이며 이 값은 처리하지 않는다.

- 출력:  
각 n마다 완전수이면 `n = d1 + d2 + ... + dk` 형태로, 아니면 `n is NOT perfect.`를 출력한다.

- 예제 입력:
```
6
12
28
-1
```

- 예제 출력:
```
6 = 1 + 2 + 3
12 is NOT perfect.
28 = 1 + 2 + 4 + 7 + 14
```

- 링크:  
https://www.acmicpc.net/problem/9506

## 필요한 개념
- **완전수(Perfect number)**: 진약수의 합이 자기 자신과 같은 수 (예: 6, 28, 496 …)
- **진약수(proper divisors)**: 자기 자신을 제외한 양의 약수
- **효율적인 약수 탐색**: 약수는 짝을 이루므로 `1`과 `√n`까지만 확인하고, 나누어떨어지면 `(i, n//i)`를 함께 추가한다. `i == n//i`인 경우 중복 추가 금지.

## 파이썬 코드
```python
import sys

def proper_divisors(n: int) -> list[int]:
    if n <= 1:
        return []
    divs = [1]
    i = 2
    while i * i <= n:
        if n % i == 0:
            divs.append(i)
            j = n // i
            if j != i:
                divs.append(j)
        i += 1
    return divs

def main():
    for line in sys.stdin:
        n = int(line.strip())
        if n == -1:
            break
        if n == 1:
            print("1 is NOT perfect.")
            continue
        divs = proper_divisors(n)
        if sum(divs) == n:
            divs.sort()
            print(f"{n} = " + " + ".join(map(str, divs)))
        else:
            print(f"{n} is NOT perfect.")

if __name__ == "__main__":
    main()
```
