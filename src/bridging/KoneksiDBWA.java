/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bridging;

import AESsecurity.EnkripsiAES;
import com.mysql.jdbc.jdbc2.optional.MysqlDataSource;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Properties;

/**
 *
 * @author USER
 */
public final class KoneksiDBWA {
    private Connection koneksi = null;
    private final Properties prop = new Properties();
    private final MysqlDataSource ds = new MysqlDataSource();
    
    private KoneksiDBWA() {}
    
    public Connection condb() throws SQLException {
        try (FileInputStream fs = new FileInputStream("setting/database.xml")) {
            prop.loadFromXML(fs);
            String HOST = EnkripsiAES.decrypt(prop.getProperty("WAHOST")),
                   PORT = EnkripsiAES.decrypt(prop.getProperty("WAPORT")),
                   NAME = EnkripsiAES.decrypt(prop.getProperty("WADATABASE")),
                   USER = EnkripsiAES.decrypt(prop.getProperty("WAUSER")),
                   PASS = EnkripsiAES.decrypt(prop.getProperty("WAPASS"));
            
            ds.setURL(String.format("jdbc:mysql://%s:%s/%s?zeroDateTimeBehavior=convertToNull&useCompression=true", HOST, PORT, NAME));
            ds.setUser(USER);
            ds.setPassword(PASS);
            koneksi = ds.getConnection();
            return koneksi;
        } catch (SQLException e) {
            throw e;
        } catch (Exception e) {
            System.out.println("Notif : " + e);
        }
        return null;
    }
    
    public boolean kirimPesanWA(String nomor, String pesan, Date tanggal, String asal) {
        try (PreparedStatement ps = koneksi.prepareStatement(
            "insert into wa_gateway (NOWA, PESAN, TANGGAL_JAM, STATUS, SOURCE, SENDER, TYPE) values (?, ?, ?, ?, ?, ?, ?)"
        )) {
            ps.setString(1, nomor);
            ps.setString(2, pesan);
            ps.setTimestamp(3, (Timestamp) tanggal);
            ps.setString(4, "ANTRIAN");
            ps.setString(5, asal);
            ps.setString(6, "NODEJS");
            ps.setString(7, "TEXT");
            
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Notif : " + e);
        }
        return false;
    }
    
    public boolean kirimUlangPesanWA(String nomor, )
}
