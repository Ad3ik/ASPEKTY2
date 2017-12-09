import org.aspectj.lang.Signature;

import java.util.HashMap;
import java.util.Map;

public aspect CountKeeperMethod {
    declare parents: Txt implements interTest;
    public Map<String , Integer> interTest.countKeeper;
    public int interTest.getKeeperCount(String param){
        return this.countKeeper.get(param);

    }

    pointcut pc2(): execution(public* Txt.*(..));

    after(): pc2() {
        interTest target = (interTest) thisJoinPoint.getTarget();
        Signature method = thisJoinPoint.getSignature();
        if(target.countKeeper == null){
            target.countKeeper = new HashMap<>();
        }
        if(target.countKeeper.containsKey(method.getName())){
            target.countKeeper.put(method.getName(), target.countKeeper.get(method.getName()).intValue()+1);
        }
        else{
            target.countKeeper.put(method.getName(),1);
        }

    }
}
interface interTest{}

