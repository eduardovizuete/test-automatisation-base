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
        return Karate.run("classpath:karate-test.feature");
    }
    
    // Tests individuales por funcionalidad
    @Karate.Test
    Karate testObtenerPersonajes() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api/obtenerPersonajes.feature");
    }
    
    @Karate.Test
    Karate testCrearPersonajes() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api/crearPersonajes.feature");
    }
    
    @Karate.Test
    Karate testActualizarPersonajes() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api/actualizarPersonajes.feature");
    }
    
    @Karate.Test
    Karate testEliminarPersonajes() {
        return Karate.run("classpath:com/pichincha/features/marvel_characters_api/eliminarPersonajes.feature");
    }
}
