import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

class TestParallel {

    @Test
    void testParallel() {
        // Especificar explícitamente la ruta en src/test/resources donde están los archivos feature
        Results results = Runner.path("classpath:com/pichincha/features")
                .outputCucumberJson(true)
                .outputHtmlReport(true)  // Generar también reporte HTML para mejor visualización
                .parallel(5);
        
        // Imprimir estadísticas de pruebas para diagnóstico
        System.out.println("Pruebas fallidas: " + results.getFailCount());
        if (results.getFailCount() > 0) {
            System.out.println("Mensajes de error: " + results.getErrorMessages());
        }
        
        // Verificar que no haya pruebas fallidas
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
