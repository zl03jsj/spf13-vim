
#### references:
https://3.jetbra.in/
https://www.exception.site/essay/idea-reset-eval

#### download idea 2022.2.3
https://download-cdn.jetbrains.com/idea/ideaIU-2022.2.3.dmg

#### modify idea.vmoption
macos path : 
`/Users/zl/Library/Application Support/JetBrains/IntelliJIdea2022.2/idea.vmoptions`

content:
```
-Xms128m
-Xmx1024m
-XX:ReservedCodeCacheSize=512m
-XX:+IgnoreUnrecognizedVMOptions
-XX:+UseG1GC
-XX:SoftRefLRUPolicyMSPerMB=50
-XX:CICompilerCount=2
-XX:+HeapDumpOnOutOfMemoryError
-XX:-OmitStackTraceInFastThrow
-ea
-Dsun.io.useCanonCaches=false
-Djdk.http.auth.tunneling.disabledSchemes=""
-Djdk.attach.allowAttachSelf=true
-Djdk.module.illegalAccess.silent=true
-Dkotlinx.coroutines.debug=off
-XX:ErrorFile=$USER_HOME/java_error_in_idea_%p.log
-XX:HeapDumpPath=$USER_HOME/java_error_in_idea.hprof

--add-opens=java.base/jdk.internal.org.objectweb.asm=ALL-UNNAMED
--add-opens=java.base/jdk.internal.org.objectweb.asm.tree=ALL-UNNAMED

-javaagent:/Users/zl/Downloads/jetbra/ja-netfilter.jar=jetbrains
```
