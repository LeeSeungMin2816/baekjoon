# BOJ 1259 - 팰린드롬수 (C)

## 문제
여러 개의 자연수가 주어질 때, 각 수가 팰린드롬(앞에서 읽으나 뒤에서 읽으나 같은 수)인지 판별한다. 입력은 마지막에 `0`이 주어지면 종료한다.

- **입력**: 한 줄에 하나씩 자연수가 주어진다. 입력의 마지막 줄은 `0`이며, 이는 처리하지 않고 종료 신호이다.
- **출력**: 각 자연수에 대해 팰린드롬이면 `yes`, 아니면 `no`를 한 줄에 하나씩 출력한다.

## 예제 입력
```
121
1231
12421
0
```

## 예제 출력
```
yes
no
yes
```

## 링크
[https://www.acmicpc.net/problem/1259](https://www.acmicpc.net/problem/1259)

---

## C 코드
```c
#include <stdio.h>
#include <string.h>

int main(void) {
    char s[1005]; // 버퍼 크기 여유 있게
    while (scanf("%s", s) == 1) {
        if (strcmp(s, "0") == 0) break;

        int i = 0;
        int j = (int)strlen(s) - 1;
        int is_pal = 1;
        while (i < j) {
            if (s[i] != s[j]) { is_pal = 0; break; }
            i++; j--;
        }
        puts(is_pal ? "yes" : "no");
    }
    return 0;
}
```

### 코드 설명
1. `scanf("%s", s)` → 문자열 입력 (공백 전까지 읽음)
2. 입력이 `"0"`이면 종료
3. `strlen(s)`으로 문자열 길이 계산
4. 양 끝 인덱스(`i`, `j`)에서 중앙으로 오며 비교
5. 하나라도 다르면 `is_pal = 0`, 끝까지 같으면 `yes`
6. `puts()`로 결과 출력 (자동 개행)

---

## 복잡도
- 시간: O(L) (L = 문자열 길이)
- 공간: O(1) (고정 길이 버퍼만 사용)
