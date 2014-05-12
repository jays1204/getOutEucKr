# Understand Character Encoding
Character Encoding은 말그대로 문자를 암호화하는 것이다. 

암호화하는 이유는 여러분들도 알다시피 컴퓨터는 0, 1만을 사용하므로 저장을 abc그대로 할수는 없으니 암호화하여 저장하는 것이다. 

대표적으로 모스 부호, ASCII 등이 존재한다. 

많이 쓰이는 것으로는 ASCII, UTF-8(리눅스, 대부분의 웹), UTF-16(Java, MS Windows, OS X file system)가 있다.

## Charater Set Vs. Character Encoding 
Character Set(이하 charset)은 표현할 수 있는 문자의 집합을 의미하며 Character Encoding은 문자를 저장한 방식을 말한다. 

예를 들자면 Unicode은 charset이고 UTF-8, EUC-KR은 Character encoding이다.

charset이 보통 두 가지를 다 의미하기도 한다. 

## Character Encoding Scheme


## Etc
### ASCII vs. Unicode
ASCII는 charset이며 character encoding이기도 하다. 현재는 Unicode와의 비교를 위해서 사용하는 단어이므로 charset으로 보면된다.

ASCII는 영어전용이다. 이름에서 알 수 있듯이 American Standard Code for Information Interchage 즉 영어 전용입니다. 

7비트 인코딩으로 여기에 비트를 하나 추가하여 만든 것이 ISO-8859-1 이며 서유럽 언어(u위에 점이 두개 찍힌 녀석이라든가)를 표현할 수 있게 되었다.

하지만 여전히 CJK(Chinese, Japanese, Korean)은 지원하지 않는다.  

참고로 HTML의 기본 charset도 ISO-8859-1이라고 하므로 HTML 문서를 만들 때 header에 charset을 빼먹지 말아야 한다.


### Reason For use UTF-8 

웹개발을 조금 하다보면 EUC-KR을 쓰지 말고 UTF-8을 쓰라는 이야기를 많이 접할 수 있다. 

많은 사람들이 쓰라니까 쓰긴 하는데 왜 한글 한 글자에 2byte인 EUC-KR보다 한 글자에 3byte나 되는 UTF-8을 써야 하는가에 의문을 갖는다면 다음의 이유정도라고 보면 된다.

- 표현불가능한 한글
  - EUC-KR에서는 표현이 안되는 즉 화면에서 보기에 깨져보이는 글자들이 존재한다. 
  NHN의 helloworld 블로그의 인코딩 설명 블로그(http://helloworld.naver.com/helloworld/76650 , 상세하게 설명이 잘되어있다.)를 보면 '똠'이라는 글자를 표현할 수 없다고 되어있다.
  '똠'이외에도 글자가 더 있는 것으로 알고 있다.

  - i18n 
  EUC-KR은 과연 전세계 모든 문자를 표현할 수 있을까? 왠지 EUC는 유럽이고 KR은 코리아니까 다 될거 같다. 
  하지만 아쉽게도 아니다.

-----------------------

## reference

- NHN 개발 블로그 hello World의 한글 인코딩의 이해 (http://helloworld.naver.com/helloworld/76650)
