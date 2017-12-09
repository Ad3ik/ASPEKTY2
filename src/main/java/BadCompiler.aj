public aspect BadCompiler {

    pointcut pc3(): call(void java.io.PrintStream.println(..));

    before(): pc3() {
        System.out.print("Nie można wywołać println! Brak Uprawnień! ");

    }
}
