/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bridging;

import AESsecurity.EnkripsiAES;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import javax.swing.JOptionPane;

/**
 *
 * @author USER
 */
public final class KoneksiDBWA {
    private static Connection koneksi = null;
    private static final Properties prop = new Properties();
    private static final MysqlDataSource ds = new MysqlDataSource();
    
    private KoneksiDBWA() {}
    
    public static Connection condb() {
        if (koneksi == null) {
            try {
                prop.loadFromXML(new FileInputStream("setting/database.xml"));
                ds.setURL("jdbc:mysql://" + EnkripsiAES.decrypt(prop.getProperty("WAHOST")) + ":" + EnkripsiAES.decrypt(prop.getProperty("WAPORT")) + "/" + EnkripsiAES.decrypt(prop.getProperty("WANAME")) + "?autoReconnect=true&zeroDateTimeBehavior=convertToNull&useCompression=true");
                ds.setUser(EnkripsiAES.decrypt(prop.getProperty("WAUSER")));
                ds.setPassword(EnkripsiAES.decrypt(prop.getProperty("WAPASS")));
                koneksi = ds.getConnection();
            } catch (Exception e) {
                System.out.println("Notif : " + e);
                try {
                    if (koneksi.isClosed()) {
                        prop.loadFromXML(new FileInputStream("setting/database.xml"));
                        ds.setURL("jdbc:mysql://" + EnkripsiAES.decrypt(prop.getProperty("WAHOST")) + ":" + EnkripsiAES.decrypt(prop.getProperty("WAPORT")) + "/" + EnkripsiAES.decrypt(prop.getProperty("WANAME")) + "?autoReconnect=true&zeroDateTimeBehavior=convertToNull&useCompression=true");
                        ds.setUser(EnkripsiAES.decrypt(prop.getProperty("WAUSER")));
                        ds.setPassword(EnkripsiAES.decrypt(prop.getProperty("WAPASS")));
                        
                        koneksi = ds.getConnection();
                    }
                } catch (Exception ex) {
                    System.out.println("Notif : " + ex);
                }
            }
        }
        return koneksi;
    }
    
    public static boolean kirimPesanWA(String nomor, String pesan, String tanggal, String asal) {
        try (PreparedStatement ps = condb().prepareStatement(
            "insert into wa_outbox (NOWA, PESAN, TANGGAL_JAM, STATUS, SOURCE, SENDER, TYPE) values (?, ?, date_add(?, interval ? second), 'ANTRIAN', ?, 'NODEJS', 'TEXT')"
        )) {
            ps.setString(1, nomor);
            ps.setString(2, pesan);
            ps.setString(3, tanggal);
            ps.setInt(4, new Random().nextInt(360) + 15);
            ps.setString(5, asal);
            
            ps.executeUpdate();
            System.out.println(ps.toString());
            return true;
        } catch (Exception e) {
            System.out.println("Notif : " + e);
        }
        return false;
    }
}
