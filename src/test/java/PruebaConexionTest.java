import com.intuit.karate.junit5.Karate;

class PruebaConexionTest {

    @Karate.Test
    Karate testPruebaConexion() {
        return Karate.run("classpath:prueba-conexion.feature").relativeTo(getClass());
    }
}
