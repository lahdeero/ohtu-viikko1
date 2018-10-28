package ohtu.ohtuvarasto;

import ohtu.ohtuvarasto.*;
import org.junit.*;
import static org.junit.Assert.*;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

public class VarastoTest {

    Varasto varasto;
    Varasto varasto2;
    double vertailuTarkkuus = 0.0001;

    @Before
    public void setUp() {
        varasto = new Varasto(10);
        varasto2 = new Varasto(10, 0);
    }

    @Test
    public void konstruktoriLuoTyhjanVaraston() {
        assertEquals(0, varasto.getSaldo(), vertailuTarkkuus);
        assertEquals(0, varasto2.getSaldo(), vertailuTarkkuus);
    }
    
    @Test
    public void konstruktoriLuoTyhjanVaraston2() {
        Varasto varasto3 = new Varasto(-10, -10);
        Varasto varasto4 = new Varasto(-11);
        assertEquals(0, varasto3.getSaldo(), vertailuTarkkuus);
        assertEquals(0, varasto4.getSaldo(), vertailuTarkkuus);
    }
    
    @Test
    public void konstruktoriLuoTaydenVaraston() {
        Varasto varasto3 = new Varasto(10, 11);
        assertEquals(10, varasto3.getSaldo(), vertailuTarkkuus);
    }

    @Test
    public void uudellaVarastollaOikeaTilavuus() {
        assertEquals(10, varasto.getTilavuus(), vertailuTarkkuus);
        assertEquals(10, varasto2.getTilavuus(), vertailuTarkkuus);
    }

    @Test
    public void lisaysLisaaSaldoa() {
        varasto.lisaaVarastoon(8);
        varasto2.lisaaVarastoon(8);

        // saldon pitäisi olla sama kun lisätty määrä
        assertEquals(8, varasto.getSaldo(), vertailuTarkkuus);
        assertEquals(8, varasto2.getSaldo(), vertailuTarkkuus);
    }

    @Test
    public void lisaysLisaaPienentaaVapaataTilaa() {
        varasto.lisaaVarastoon(8);
        varasto2.lisaaVarastoon(8);
        
        // vapaata tilaa pitäisi vielä olla tilavuus-lisättävä määrä eli 2
        assertEquals(2, varasto.paljonkoMahtuu(), vertailuTarkkuus);
        assertEquals(2, varasto2.paljonkoMahtuu(), vertailuTarkkuus);
    }

    @Test
    public void lisaaNegatiivinen() {
        varasto.lisaaVarastoon(-1.1);
        assertEquals(0, varasto.getSaldo(), vertailuTarkkuus);
    }
    @Test
    public void lisaaTayteen() {
        varasto.lisaaVarastoon(11);
        assertEquals(10, varasto.getSaldo(), vertailuTarkkuus);
    }
    @Test 
    public void otaNegatiivista() {
        varasto.otaVarastosta(-1);
        assertEquals(0, varasto.getSaldo(), vertailuTarkkuus);
    }
    @Test 
    public void otaTyhjasta() {
        varasto.otaVarastosta(10);
        varasto.otaVarastosta(1);
        assertEquals(0, varasto.getSaldo(), vertailuTarkkuus);
    }
    @Test 
    public void otaYlivaraston() {
        varasto.lisaaVarastoon(10);
        assertEquals(10, varasto.otaVarastosta(18), vertailuTarkkuus);
    }
    @Test
    public void ottaminenPalauttaaOikeanMaaran() {
        varasto.lisaaVarastoon(8);
        varasto2.lisaaVarastoon(8);

        double saatuMaara = varasto.otaVarastosta(2);
        double saatuMaara2 = varasto2.otaVarastosta(2);
        
        assertEquals(2, saatuMaara, vertailuTarkkuus);
        assertEquals(2, saatuMaara2, vertailuTarkkuus);
    }

    @Test
    public void ottaminenLisääTilaa() {
        varasto.lisaaVarastoon(8);

        varasto.otaVarastosta(2);

        // varastossa pitäisi olla tilaa 10 - 8 + 2 eli 4
        assertEquals(4, varasto.paljonkoMahtuu(), vertailuTarkkuus);
    }
    @Test
    public void testaaToString() {
        assertEquals("saldo = 0.0, vielä tilaa 10.0", varasto.toString());
    }
    @Test
    public void testaaToString2() {
        Varasto varasto5 = new Varasto(10, 10);
        assertEquals("saldo = 10.0, vielä tilaa 0.0", varasto5.toString());
    }

}