import com.intuit.karate.junit5.Karate;

class PetstoreRunner {
    
     @Karate.Test
     Karate testAll() {
         return Karate.run().relativeTo(getClass());
     }
}