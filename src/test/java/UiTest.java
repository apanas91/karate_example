import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

@KarateOptions(tags = {"~@ignore", "@ui"})

public class UiTest {
    @BeforeClass
    public static void beforeClass() throws InterruptedException {
    }

    @Test
    public void name() {
        String karateOutputPath = "target/surefire-reports";
        Results results = Runner.parallel(getClass(), 1, karateOutputPath);
    }

    @AfterClass
    public static void afterClass() {
    }

}
