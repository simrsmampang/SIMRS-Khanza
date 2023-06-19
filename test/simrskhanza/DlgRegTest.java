/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit3TestClass.java to edit this template
 */
package simrskhanza;

import java.io.Writer;
import javax.swing.JButton;
import javax.swing.JTextField;
import junit.framework.TestCase;

/**
 *
 * @author USER
 */
public class DlgRegTest extends TestCase {
    
    public DlgRegTest(String testName) {
        super(testName);
    }
    
    @Override
    protected void setUp() throws Exception {
        super.setUp();
    }
    
    @Override
    protected void tearDown() throws Exception {
        super.tearDown();
    }

    /**
     * Test of main method, of class DlgReg.
     */
    public void testMain() {
        System.out.println("main");
        String[] args = null;
        DlgReg.main(args);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of emptTeks method, of class DlgReg.
     */
    public void testEmptTeks() {
        System.out.println("emptTeks");
        DlgReg instance = null;
        instance.emptTeks();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getTextField method, of class DlgReg.
     */
    public void testGetTextField() {
        System.out.println("getTextField");
        DlgReg instance = null;
        JTextField expResult = null;
        JTextField result = instance.getTextField();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getButton method, of class DlgReg.
     */
    public void testGetButton() {
        System.out.println("getButton");
        DlgReg instance = null;
        JButton expResult = null;
        JButton result = instance.getButton();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of isCek method, of class DlgReg.
     */
    public void testIsCek() {
        System.out.println("isCek");
        DlgReg instance = null;
        instance.isCek();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of ctk method, of class DlgReg.
     */
    public void testCtk() {
        System.out.println("ctk");
        DlgReg instance = null;
        instance.ctk();
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of sendCommand method, of class DlgReg.
     */
    public void testSendCommand() throws Exception {
        System.out.println("sendCommand");
        char[] command = null;
        Writer writer = null;
        DlgReg instance = null;
        instance.sendCommand(command, writer);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of SetPasien method, of class DlgReg.
     */
    public void testSetPasien_3args() {
        System.out.println("SetPasien");
        String norm = "";
        String nosisrute = "";
        String FaskesAsal = "";
        DlgReg instance = null;
        instance.SetPasien(norm, nosisrute, FaskesAsal);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of SetPasien method, of class DlgReg.
     */
    public void testSetPasien_String() {
        System.out.println("SetPasien");
        String norm = "";
        DlgReg instance = null;
        instance.SetPasien(norm);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setPasien method, of class DlgReg.
     */
    public void testSetPasien_10args() {
        System.out.println("setPasien");
        String NamaPasien = "";
        String Kontak = "";
        String Alamat = "";
        String TempatLahir = "";
        String TglLahir = "";
        String JK = "";
        String NoKartuJKN = "";
        String NIK = "";
        String nosisrute = "";
        String FaskesAsal = "";
        DlgReg instance = null;
        instance.setPasien(NamaPasien, Kontak, Alamat, TempatLahir, TglLahir, JK, NoKartuJKN, NIK, nosisrute, FaskesAsal);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
