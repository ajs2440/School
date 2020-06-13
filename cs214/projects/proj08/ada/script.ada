Script started on Thu 11 Apr 2019 02:36:15 PM EDT
ajs244@gold12:~/cs214/projects/proj08/ada$ cat     ^C
ajs244@gold12:~/cs214/projects/proj08/ada$ cd ..
ajs244@gold12:~/cs214/projects/proj08$ subl                  mkdir       cd clojure
ajs244@gold12:~/cs214/projects/proj08/clojure$ cd src
ajs244@gold12:~/cs214/projects/proj08/clojure/src$ subl temperature.clj
ajs244@gold12:~/cs214/projects/proj08/clojure/src$ subl temperature       _driver.clj
\ajs244@gold12:~/cs214/projects/proj08/clojure/src$ \ cd ..
ajs244@gold12:~/cs214/projects/proj08/clojure$ make      ^V[Kclojure -m temp_driver
Exception in thread "main" java.lang.RuntimeException: Unable to resolve symbol: isValid in this context, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:19:7)
	at clojure.lang.Compiler.analyze(Compiler.java:6792)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3813)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7005)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$IfExpr$Parser.parse(Compiler.java:2817)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve symbol: isValid in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler.resolveIn(Compiler.java:7299)
	at clojure.lang.Compiler.resolve(Compiler.java:7243)
	at clojure.lang.Compiler.analyzeSymbol(Compiler.java:7204)
	at clojure.lang.Compiler.analyze(Compiler.java:6752)
	... 56 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" java.lang.RuntimeException: Unable to resolve symbol: isValid in this context, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:19:7)
	at clojure.lang.Compiler.analyze(Compiler.java:6792)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3813)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7005)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$IfExpr$Parser.parse(Compiler.java:2817)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve symbol: isValid in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler.resolveIn(Compiler.java:7299)
	at clojure.lang.Compiler.resolve(Compiler.java:7243)
	at clojure.lang.Compiler.analyzeSymbol(Compiler.java:7204)
	at clojure.lang.Compiler.analyze(Compiler.java:6752)
	... 56 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" java.lang.RuntimeException: Unable to resolve symbol: isValid in this context, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:19:7)
	at clojure.lang.Compiler.analyze(Compiler.java:6792)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3813)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7005)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$IfExpr$Parser.parse(Compiler.java:2817)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve symbol: isValid in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler.resolveIn(Compiler.java:7299)
	at clojure.lang.Compiler.resolve(Compiler.java:7243)
	at clojure.lang.Compiler.analyzeSymbol(Compiler.java:7204)
	at clojure.lang.Compiler.analyze(Compiler.java:6752)
	... 56 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" java.lang.RuntimeException: Unable to resolve symbol: K in this context, compiling:(temp_driver.clj:25:13)
	at clojure.lang.Compiler.analyze(Compiler.java:6792)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3881)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7005)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$LetExpr$Parser.parse(Compiler.java:6368)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve symbol: K in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler.resolveIn(Compiler.java:7299)
	at clojure.lang.Compiler.resolve(Compiler.java:7243)
	at clojure.lang.Compiler.analyzeSymbol(Compiler.java:7204)
	at clojure.lang.Compiler.analyze(Compiler.java:6752)
	... 52 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid InputInvalid InputInvalid Input
All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" java.lang.IllegalArgumentException: Only long and double primitives are supported, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:36:1)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7010)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.IllegalArgumentException: Only long and double primitives are supported
	at clojure.lang.Compiler$FnMethod.classChar(Compiler.java:5312)
	at clojure.lang.Compiler$FnMethod.primInterface(Compiler.java:5318)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5354)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	... 43 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clear
[3;J[H[2Jajs244@gold12:~/cs214/projects/proj08/clojure$ clear[17@ojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ [Kajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
(Enter the temperature in the format --- degrees, scale): )Exception in thread "main" clojure.lang.ArityException: Wrong number of args (0) passed to: core/read-string
	at clojure.lang.AFn.throwArity(AFn.java:429)
	at clojure.lang.AFn.invoke(AFn.java:28)
	at temp_driver$readTemp.invokeStatic(temperature.clj:126)
	at temp_driver$readTemp.invoke(temperature.clj:122)
	at temp_driver$_main.invokeStatic(temp_driver.clj:34)
	at temp_driver$_main.invoke(temp_driver.clj:22)
	at clojure.lang.AFn.applyToHelper(AFn.java:152)
	at clojure.lang.AFn.applyTo(AFn.java:144)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.core$apply.invokeStatic(core.clj:657)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
ajs244@gold12:~/cs214/projects/proj08/clojure$ [Kajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" clojure.lang.ExceptionInfo: Call to clojure.core/let did not conform to spec:
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/map-binding at: [:args :bindings :binding :map :mb] predicate: vector?
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/ns-keys at: [:args :bindings :binding :map :nsk] predicate: vector?
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/map-bindings at: [:args :bindings :binding :map :msb] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/map-binding at: [:args :bindings :binding :map :mb] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/ns-keys at: [:args :bindings :binding :map :nsk] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/map-bindings at: [:args :bindings :binding :map :msb] predicate: vector?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/local-name at: [:args :bindings :binding :sym] predicate: simple-symbol?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/seq-binding-form at: [:args :bindings :binding :seq] predicate: vector?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/map-special-binding at: [:args :bindings :binding :map] predicate: map?
 #:clojure.spec.alpha{:problems ({:path [:args :bindings :binding :sym], :pred clojure.core/simple-symbol?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/local-name], :in [0 0]} {:path [:args :bindings :binding :seq], :pred clojure.core/vector?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/seq-binding-form], :in [0 0]} {:path [:args :bindings :binding :map :mb], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/map-binding], :in [0 0 0]} {:path [:args :bindings :binding :map :nsk], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/ns-keys], :in [0 0 0]} {:path [:args :bindings :binding :map :msb], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings], :in [0 0 0]} {:path [:args :bindings :binding :map :mb], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/map-binding], :in [0 0 1]} {:path [:args :bindings :binding :map :nsk], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/ns-keys], :in [0 0 1]} {:path [:args :bindings :binding :map :msb], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings], :in [0 0 1]} {:path [:args :bindings :binding :map], :pred map?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-special-binding], :in [0 0]}), :spec #object[clojure.spec.alpha$regex_spec_impl$reify__2436 0x3c7c886c "clojure.spec.alpha$regex_spec_impl$reify__2436@3c7c886c"], :value ([(read-string degree) (read-string scale)] (make-Temperature degree scale)), :args ([(read-string degree) (read-string scale)] (make-Temperature degree scale))}, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:124:3)
	at clojure.lang.Compiler.checkSpecs(Compiler.java:6891)
	at clojure.lang.Compiler.macroexpand1(Compiler.java:6907)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6989)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: clojure.lang.ExceptionInfo: Call to clojure.core/let did not conform to spec:
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/map-binding at: [:args :bindings :binding :map :mb] predicate: vector?
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/ns-keys at: [:args :bindings :binding :map :nsk] predicate: vector?
In: [0 0 0] val: read-string fails spec: :clojure.core.specs.alpha/map-bindings at: [:args :bindings :binding :map :msb] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/map-binding at: [:args :bindings :binding :map :mb] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/ns-keys at: [:args :bindings :binding :map :nsk] predicate: vector?
In: [0 0 1] val: degree fails spec: :clojure.core.specs.alpha/map-bindings at: [:args :bindings :binding :map :msb] predicate: vector?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/local-name at: [:args :bindings :binding :sym] predicate: simple-symbol?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/seq-binding-form at: [:args :bindings :binding :seq] predicate: vector?
In: [0 0] val: (read-string degree) fails spec: :clojure.core.specs.alpha/map-special-binding at: [:args :bindings :binding :map] predicate: map?
 {:clojure.spec.alpha/problems ({:path [:args :bindings :binding :sym], :pred clojure.core/simple-symbol?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/local-name], :in [0 0]} {:path [:args :bindings :binding :seq], :pred clojure.core/vector?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/seq-binding-form], :in [0 0]} {:path [:args :bindings :binding :map :mb], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/map-binding], :in [0 0 0]} {:path [:args :bindings :binding :map :nsk], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/ns-keys], :in [0 0 0]} {:path [:args :bindings :binding :map :msb], :pred vector?, :val read-string, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings], :in [0 0 0]} {:path [:args :bindings :binding :map :mb], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/map-binding], :in [0 0 1]} {:path [:args :bindings :binding :map :nsk], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings :clojure.core.specs.alpha/ns-keys], :in [0 0 1]} {:path [:args :bindings :binding :map :msb], :pred vector?, :val degree, :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-bindings], :in [0 0 1]} {:path [:args :bindings :binding :map], :pred map?, :val (read-string degree), :via [:clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/bindings :clojure.core.specs.alpha/binding :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/binding-form :clojure.core.specs.alpha/map-binding-form :clojure.core.specs.alpha/map-special-binding], :in [0 0]}), :clojure.spec.alpha/spec #object[clojure.spec.alpha$regex_spec_impl$reify__2436 0x3c7c886c "clojure.spec.alpha$regex_spec_impl$reify__2436@3c7c886c"], :clojure.spec.alpha/value ([(read-string degree) (read-string scale)] (make-Temperature degree scale)), :clojure.spec.alpha/args ([(read-string degree) (read-string scale)] (make-Temperature degree scale))}
	at clojure.core$ex_info.invokeStatic(core.clj:4739)
	at clojure.core$ex_info.invoke(core.clj:4739)
	at clojure.spec.alpha$macroexpand_check.invokeStatic(alpha.clj:689)
	at clojure.spec.alpha$macroexpand_check.invoke(alpha.clj:681)
	at clojure.lang.AFn.applyToHelper(AFn.java:156)
	at clojure.lang.AFn.applyTo(AFn.java:144)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.lang.Compiler.checkSpecs(Compiler.java:6889)
	... 51 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ [Kajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Exception in thread "main" java.lang.RuntimeException: Unable to resolve symbol: degree in this context, compiling:(/home/ajs244/cs214/projects/proj08/clojure/src/temperature.clj:126:15)
	at clojure.lang.Compiler.analyze(Compiler.java:6792)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$InvokeExpr.parse(Compiler.java:3881)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7005)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$LetExpr$Parser.parse(Compiler.java:6368)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler$BodyExpr$Parser.parse(Compiler.java:6100)
	at clojure.lang.Compiler$FnMethod.parse(Compiler.java:5460)
	at clojure.lang.Compiler$FnExpr.parse(Compiler.java:4022)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7001)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:6991)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.access$300(Compiler.java:38)
	at clojure.lang.Compiler$DefExpr$Parser.parse(Compiler.java:595)
	at clojure.lang.Compiler.analyzeSeq(Compiler.java:7003)
	at clojure.lang.Compiler.analyze(Compiler.java:6773)
	at clojure.lang.Compiler.analyze(Compiler.java:6729)
	at clojure.lang.Compiler.eval(Compiler.java:7066)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.Compiler.loadFile(Compiler.java:7452)
	at clojure.lang.RT$3.invoke(RT.java:325)
	at temp_driver$eval155.invokeStatic(temp_driver.clj:16)
	at temp_driver$eval155.invoke(temp_driver.clj:16)
	at clojure.lang.Compiler.eval(Compiler.java:7062)
	at clojure.lang.Compiler.load(Compiler.java:7514)
	at clojure.lang.RT.loadResourceScript(RT.java:379)
	at clojure.lang.RT.loadResourceScript(RT.java:370)
	at clojure.lang.RT.load(RT.java:460)
	at clojure.lang.RT.load(RT.java:426)
	at clojure.core$load$fn__6548.invoke(core.clj:6046)
	at clojure.core$load.invokeStatic(core.clj:6045)
	at clojure.core$load.doInvoke(core.clj:6029)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invokeStatic(core.clj:5848)
	at clojure.core$load_one.invoke(core.clj:5843)
	at clojure.core$load_lib$fn__6493.invoke(core.clj:5888)
	at clojure.core$load_lib.invokeStatic(core.clj:5887)
	at clojure.core$load_lib.doInvoke(core.clj:5868)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$load_libs.invokeStatic(core.clj:5925)
	at clojure.core$load_libs.doInvoke(core.clj:5909)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invokeStatic(core.clj:659)
	at clojure.core$require.invokeStatic(core.clj:5947)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
Caused by: java.lang.RuntimeException: Unable to resolve symbol: degree in this context
	at clojure.lang.Util.runtimeException(Util.java:221)
	at clojure.lang.Compiler.resolveIn(Compiler.java:7299)
	at clojure.lang.Compiler.resolve(Compiler.java:7243)
	at clojure.lang.Compiler.analyzeSymbol(Compiler.java:7204)
	at clojure.lang.Compiler.analyze(Compiler.java:6752)
	... 58 more
ajs244@gold12:~/cs214/projects/proj08/clojure$ [Kajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
10
(Enter the temperature in the format --- degrees, scale): )
All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
10
K
(Enter the temperature in the format --- degrees, scale): )Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
1Invalid Input
Invalid Input
Invalid Input
0  10.0
K
(Enter the temperature in the format --- degrees, scale): )Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
100.0
C
(Enter the temperature in the format --- degrees, scale): )Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
10
K
(Enter the temperature in the format --- degrees, scale): )Invalid Input

All tests passed!

ajs244@gold12:~/cs214/projects/proj08/clojure$ clojure -m temp_driver
Invalid Input
Invalid Input
Invalid Input
10
K
(Enter the temperature in the format --- degrees, scale): )Exception in thread "main" java.lang.ClassCastException: clojure.lang.Symbol cannot be cast to java.lang.Number
	at clojure.lang.RT.charCast(RT.java:1053)
	at temp_driver$readTemp.invokeStatic(temperature.clj:130)
	at temp_driver$readTemp.invoke(temperature.clj:122)
	at temp_driver$_main.invokeStatic(temp_driver.clj:34)
	at temp_driver$_main.invoke(temp_driver.clj:22)
	at clojure.lang.AFn.applyToHelper(AFn.java:152)
	at clojure.lang.AFn.applyTo(AFn.java:144)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.core$apply.invokeStatic(core.clj:657)
	at clojure.main$main_opt.invokeStatic(main.clj:317)
	at clojure.main$main_opt.invoke(main.clj:313)
	at clojure.main$main.invokeStatic(main.clj:424)
	at clojure.main$main.doInvoke(main.clj:387)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.lang.Var.applyTo(Var.java:702)
	at clojure.main.main(main.java:37)
ajs244@gold12:~/cs214/projects/proj08/clojure$ [Kajs244@gold12:~/cs214/projects/proj08/clojure$ 