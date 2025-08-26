# 10988 파이썬 풀이 (팰린드롬인지 확인하기)

## 문제
주어진 단어가 팰린드롬(앞에서 읽으나 뒤에서 읽으나 같은 문자열)인지 판별하여, 맞으면 1, 아니면 0을 출력하시오.

- 링크: <https://www.acmicpc.net/problem/10988>

---

## 핵심 개념
- **팰린드롬(Palindrome)**: 좌우가 대칭인 문자열  
  예) `level`, `abba`, `a` (O) / `baekjoon` (X)

---

## 알고리즘 개요
1. 문자열을 입력받는다.
2. 문자열이 뒤집은 문자열과 같은지 확인한다.
3. 같으면 1, 다르면 0을 출력한다.

시간복잡도: O(n)  
공간복잡도: O(1) (슬라이싱은 내부적으로 새 문자열을 만들기 때문에 O(n))

---

## 파이썬 코드 (슬라이싱 활용 - 간단 버전)

```python
import sys

def is_palindrome(s: str) -> bool:
    """문자열 s가 팰린드롬이면 True, 아니면 False 반환"""
    return s == s[::-1]

def main():
    s = sys.stdin.readline().strip()
    print(1 if is_palindrome(s) else 0)

if __name__ == "__main__":
    main()
```

---

## 파이썬 코드 (투 포인터 방식 - 원리 중심)

```python
import sys

def is_palindrome_two_pointers(s: str) -> bool:
    """양 끝에서 중앙으로 좁혀오며 문자를 비교"""
    i, j = 0, len(s) - 1
    while i < j:
        if s[i] != s[j]:
            return False
        i += 1
        j -= 1
    return True

def main():
    s = sys.stdin.readline().strip()
    print(1 if is_palindrome_two_pointers(s) else 0)

if __name__ == "__main__":
    main()
```

---

## 테스트 예시
입력:
```
level
```
출력:
```
1
```

입력:
```
baekjoon
```
출력:
```
0
```
