# 1065 파이썬 풀이 (한수) — 주석/함수설명 보강판

## 문제
자연수 N이 주어졌을 때, 1 이상 N 이하의 수 중에서 각 자리수가 등차수열을 이루는 수(한수)의 개수를 구하시오.  
- 링크: <https://www.acmicpc.net/problem/1065>

---

## 핵심 개념
- 한수(등차수열 수): 각 자리수의 인접한 차이가 모두 같은 수
  - 1자리(1~9), 2자리(10~99)는 항상 한수
  - 3자리(100~999)는 `(백 - 십) == (십 - 일)`이면 한수
  - 1000은 한수가 아님 (문제 정의상 3자리까지만 판정)

---

## 알고리즘 개요
1. `is_hansu(n)`으로 n이 한수인지 O(1)로 판정
2. `count_hansu_upto(N)`으로 1..N 순회하며 개수 카운트
3. 입력 N을 읽어 결과 출력

시간복잡도: O(N) (각 수에 대해 O(1) 판정), N ≤ 1000 이므로 충분히 빠름.

---

## 파이썬 코드 (함수 설명/주석 강화)

```python
import sys

def is_hansu(n: int) -> bool:
    """
    n이 '한수(등차수열 수)'인지 여부를 반환한다.
    규칙
    - 1자리(1~9), 2자리(10~99): 항상 True
    - 3자리(100~999): (백-십) == (십-일) 이어야 True
    - 1000: False (문제 정의상 제외)
    """
    # 1~99: 모두 한수
    if n < 100:
        return True
    # 1000: 한수가 아님
    if n == 1000:
        return False

    # 세 자리 수 처리
    a = n // 100        # 백의 자리
    b = (n // 10) % 10  # 십의 자리
    c = n % 10          # 일의 자리

    # 등차 여부 확인: (a - b) == (b - c)
    return (a - b) == (b - c)


def count_hansu_upto(N: int) -> int:
    """
    1 이상 N 이하에서 한수의 개수를 반환한다.
    각 정수는 is_hansu로 O(1)에 판정 가능. 전체 시간복잡도는 O(N).
    """
    count = 0
    for x in range(1, N + 1):
        if is_hansu(x):
            count += 1
    return count


def main():
    # 백준에서는 표준 입력으로 단일 정수 N이 주어진다.
    N = int(sys.stdin.readline().strip())
    print(count_hansu_upto(N))


if __name__ == "__main__":
    main()
```

---

## 대안: 문자열 기반 판정
정수 연산 대신 문자열로 자리 비교를 할 수도 있다.
```python
def is_hansu_str(n: int) -> bool:
    s = str(n)
    if len(s) <= 2:
        return True
    d = int(s[0]) - int(s[1])
    for i in range(1, len(s) - 1):
        if int(s[i]) - int(s[i+1]) != d:
            return False
    # 문제 정의상 4자리(1000)는 한수로 취급하지 않으므로 False로 처리하려면:
    return len(s) == 3
```

---

## 예시 & 자가 테스트
- 입력: `110` → 출력: `99` (예제와 동일)
- 입력: `99` → 출력: `99` (전부 한수)
- 입력: `1000` → 출력: `144` (1~999에서의 한수 개수)

간단 체크:
```text
N=1   -> 1
N=99  -> 99
N=110 -> 99
N=1000-> 144
```
