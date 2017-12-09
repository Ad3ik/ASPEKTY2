import org.aspectj.lang.Signature;
import org.aspectj.lang.reflect.MethodSignature;

public aspect IsNotNull {

    pointcut pc(): @annotation(NotNullArgs);

    before():  pc(){
        Object[] args = thisJoinPoint.getArgs();

        for (int i=0;i<args.length; i++){
            if(args[i]==null){
                Signature method = thisJoinPoint.getSignature();
                MethodSignature ms = (MethodSignature)method;
                String[] msParametersName = ms.getParameterNames();
                Class[] msParameterClass = ms.getParameterTypes();

                String msg= msParametersName[i] + "  " + msParameterClass[i].getSimpleName();
                throw new NullPointerException(msg);

            }

        }
    }
}
