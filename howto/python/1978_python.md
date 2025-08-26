# 1978 파이썬 풀이 (소수 찾기)

## 문제
주어진 N개의 정수 중에서 소수가 몇 개인지 구하는 프로그램을 작성하시오.

- 링크: <https://www.acmicpc.net/problem/1978>

---

## 핵심 개념
- 소수(Prime number): 1과 자기 자신만 약수로 가지는 2 이상의 자연수
  - 1은 소수가 아님
- 소수 판정은 2부터 정수 제곱근까지 검사하면 충분 (약수는 대칭쌍으로 존재)

---

## 알고리즘 개요
1. 정수 N을 입력받는다.
2. N개의 정수를 순회하며 각 수가 소수인지 판정한다.
3. 소수의 개수를 카운트하여 출력한다.

시간복잡도: O(N · sqrt(M)) (M은 입력 값의 최댓값, 문제에선 ≤ 1000)  
공간복잡도: O(1)

---

## 파이썬 코드

```python
import sys
from math import isqrt

def is_prime(x: int) -> bool:
    """
    x가 소수인지 판별한다.
    - 2 미만: 소수 아님
    - 2: 소수
    - 짝수(2 제외): 소수 아님
    - 홀수에 대해 3부터 정수 제곱근까지 홀수만 검사
    """
    if x < 2:
        return False
    if x == 2:
        return True
    if x % 2 == 0:
        return False
    # 3,5,7,...,isqrt(x) 까지 검사
    limit = isqrt(x)
    for i in range(3, limit + 1, 2):
        if x % i == 0:
            return False
    return True

def main():
    data = sys.stdin.read().strip().split()
    if not data:
        return
    n = int(data[0])
    nums = map(int, data[1:1+n])
    count = sum(1 for v in nums if is_prime(v))
    print(count)

if __name__ == "__main__":
    main()
```

---

## 테스트 예시
입력:
```
4
1 3 5 7
```
출력:
```
3
```
