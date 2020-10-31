import com.intuit.karate.FileUtils;
import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.netty.FeatureServer;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import java.io.File;
import java.util.Collections;

@KarateOptions(tags = {"~@ignore", "@mock"} )
public class MockDemoTest {
    // this will run all *.feature files that exist in sub-directories
    // refer to https://github.com/intuit/karate#naming-conventions
    // for folder-structure recommendations and naming conventions

    private static FeatureServer server;

    @BeforeClass
    public static void beforeClass() throws InterruptedException {
        File file = FileUtils.getFileRelativeTo(MockDemoTest.class, "alltests/MockService.feature");
        System.out.println("File file");
        server = FeatureServer.start(file, 8080, false, Collections.emptyMap());
    }

    @Test
    public void name() {
        String karateOutputPath = "target/surefire-reports";
        Results results = Runner.parallel(getClass(), 1, karateOutputPath);
    }
    @AfterClass
    public static void afterClass() {
        server.stop();
    }

}