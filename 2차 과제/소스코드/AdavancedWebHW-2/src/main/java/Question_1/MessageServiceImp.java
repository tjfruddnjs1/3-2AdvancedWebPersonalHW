package Question_1;

import org.springframework.stereotype.*;

@Component
public class MessageServiceImp implements IMessageService{
   
   public String getMessage() {
      return "Hello World";
   }
}
