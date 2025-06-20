import com.intuit.karate.junit5.Karate;
import org.junit.jupiter.api.BeforeAll;

class KarateBasicTest {
    
    @BeforeAll
    static void setup() {
        // Configuración SSL para todas las pruebas
        System.setProperty("karate.ssl", "true");
        // Configuración del entorno
        System.setProperty("karate.env", "local");
    }
    
    @Karate.Test
    Karate testMasterFeature() {
        // Ejecutar el feature principal que llama a todos los demás
        return Karate.run("classpath:karate-test.feature").relativeTo(getClass());
    }
}
