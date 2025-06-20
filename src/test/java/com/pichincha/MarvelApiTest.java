package com.pichincha;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

/**
 * Clase para ejecutar específicamente solo las pruebas de Marvel Characters API
 */
class MarvelApiTest {
    
    @Test
    void testMarvelApi() {
        // Especificar la ruta exacta a la carpeta de features
        Results results = Runner.path("classpath:com/pichincha/features/marvel_characters_api")
                .outputCucumberJson(true)
                .outputHtmlReport(true)
                .parallel(5);
        
        // Verificar resultados
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
