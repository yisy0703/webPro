IP 체크 할일이 생겨서 다음과 같이 검색을 했더니  
<%=request.getRemoteAddr()%> 의 결과가 
0:0:0:0:0:0:0:1 만 나온다.
IPV6 문제이다. WIN7 이상은 기본이 IPV6  

그래서 톰캣 실행시 JVM 환경변수를 추가 해야 한다. 
0:0:0:0:0:0:0:1  이거랑 127.0.0.1 이랑 같다고..

eclipse > Run > Run Configurations > Apache Tomcat > Tomcat v9.0 Server >
Arguiments > 
Program arguments에 "-Djava.net.preferIPv4Stack=true" 입력
VM arguments:에 "-Djava.net.preferIPv4Stack=true" 입력

- 톰캣 재 실행후 재 확인 하면 IPv4로 나온다. 

IPv6
Arguiments > 
Program arguments에 "start"
VM arguments:에 "-Dcatalina.base="D:\webPro\IDE\apache-tomcat-spring" -Dcatalina.home="D:\webPro\IDE\apache-tomcat-spring" -Dwtp.deploy="D:\webPro\IDE\apache-tomcat-spring\wtpwebapps" -Djava.endorsed.dirs="D:\webPro\IDE\apache-tomcat-spring\endorsed"""