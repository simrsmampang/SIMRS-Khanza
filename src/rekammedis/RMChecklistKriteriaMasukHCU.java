/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


package rekammedis;

import fungsi.WarnaTable;
import fungsi.akses;
import fungsi.batasInput;
import fungsi.koneksiDB;
import fungsi.sekuel;
import fungsi.validasi;
import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.event.KeyEvent;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.event.DocumentEvent;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.text.Document;
import javax.swing.text.html.HTMLEditorKit;
import javax.swing.text.html.StyleSheet;
import kepegawaian.DlgCariPegawai;


/**
 *
 * @author perpustakaan
 */
public final class RMChecklistKriteriaMasukHCU extends javax.swing.JDialog {
    private final DefaultTableModel tabMode;
    private Connection koneksi=koneksiDB.condb();
    private sekuel Sequel=new sekuel();
    private validasi Valid=new validasi();
    private PreparedStatement ps;
    private ResultSet rs;
    private int i=0,pilihan=0;    
    private DlgCariPegawai pegawai=new DlgCariPegawai(null,false);
    private String finger="",finger2="";
    private StringBuilder htmlContent;
    /** Creates new form DlgRujuk
     * @param parent
     * @param modal */
    public RMChecklistKriteriaMasukHCU(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
        this.setLocation(8,1);
        setSize(628,674);

        tabMode=new DefaultTableModel(null,new Object[]{
            "No.Rawat","No.RM","Nama Pasien","Tgl.Lahir","J.K.","Tanggal","SN/CN","Tindakan","Kode Dokter Bedah","Nama Dokter Bedah",
            "Kode Dokter Anest","Nama Dokter Anestesi","Identitas","Keadaan Umum","Penandaan Area Operasi","Surat Ijin Bedah","Surat Ijin Anestesi",
            "Surat Ijin Transfusi","Persiapan Darah","Keterangan Persiapan Darah","Perlengkapan Khusus","Radiologi","Keterangan Radiologi",
            "EKG","Keterangan EKG","USG","Keterangan USG","CT Scan","Keterangan CT Scan","MRI","Keterangan MRI","NIP Ruangan","Petugas Ruangan",
            "NIP OK","Petugas Ruang OK"
        }){
              @Override public boolean isCellEditable(int rowIndex, int colIndex){return false;}
        };
        tbObat.setModel(tabMode);

        //tbObat.setDefaultRenderer(Object.class, new WarnaTable(panelJudul.getBackground(),tbObat.getBackground()));
        tbObat.setPreferredScrollableViewportSize(new Dimension(500,500));
        tbObat.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);

        for (i = 0; i < 35; i++) {
            TableColumn column = tbObat.getColumnModel().getColumn(i);
            if(i==0){
                column.setPreferredWidth(105);
            }else if(i==1){
                column.setPreferredWidth(70);
            }else if(i==2){
                column.setPreferredWidth(150);
            }else if(i==3){
                column.setPreferredWidth(65);
            }else if(i==4){
                column.setPreferredWidth(25);
            }else if(i==5){
                column.setPreferredWidth(115);
            }else if(i==6){
                column.setPreferredWidth(90);
            }else if(i==7){
                column.setPreferredWidth(160);
            }else if(i==8){
                column.setPreferredWidth(100);
            }else if(i==9){
                column.setPreferredWidth(160);
            }else if(i==10){
                column.setPreferredWidth(100);
            }else if(i==11){
                column.setPreferredWidth(150);
            }else if(i==12){
                column.setPreferredWidth(53);
            }else if(i==13){
                column.setPreferredWidth(85);
            }else if(i==14){
                column.setPreferredWidth(130);
            }else if(i==15){
                column.setPreferredWidth(88);
            }else if(i==16){
                column.setPreferredWidth(98);
            }else if(i==17){
                column.setPreferredWidth(102);
            }else if(i==18){
                column.setPreferredWidth(89);
            }else if(i==19){
                column.setPreferredWidth(149);
            }else if(i==20){
                column.setPreferredWidth(109);
            }else if(i==21){
                column.setPreferredWidth(90);
            }else if(i==22){
                column.setPreferredWidth(120);
            }else if(i==23){
                column.setPreferredWidth(90);
            }else if(i==24){
                column.setPreferredWidth(120);
            }else if(i==25){
                column.setPreferredWidth(90);
            }else if(i==26){
                column.setPreferredWidth(120);
            }else if(i==27){
                column.setPreferredWidth(90);
            }else if(i==28){
                column.setPreferredWidth(120);
            }else if(i==29){
                column.setPreferredWidth(90);
            }else if(i==30){
                column.setPreferredWidth(120);
            }else if(i==31){
                column.setPreferredWidth(90);
            }else if(i==32){
                column.setPreferredWidth(150);
            }else if(i==33){
                column.setPreferredWidth(90);
            }else if(i==34){
                column.setPreferredWidth(150);
            }
        }
        tbObat.setDefaultRenderer(Object.class, new WarnaTable());

        TNoRw.setDocument(new batasInput((byte)17).getKata(TNoRw));
        KeteranganPersiapanDarah.setDocument(new batasInput((byte)20).getKata(KeteranganPersiapanDarah));
        TCari.setDocument(new batasInput((int)100).getKata(TCari));
        
        if(koneksiDB.CARICEPAT().equals("aktif")){
            TCari.getDocument().addDocumentListener(new javax.swing.event.DocumentListener(){
                @Override
                public void insertUpdate(DocumentEvent e) {
                    if(TCari.getText().length()>2){
                        tampil();
                    }
                }
                @Override
                public void removeUpdate(DocumentEvent e) {
                    if(TCari.getText().length()>2){
                        tampil();
                    }
                }
                @Override
                public void changedUpdate(DocumentEvent e) {
                    if(TCari.getText().length()>2){
                        tampil();
                    }
                }
            });
        }
        
        pegawai.addWindowListener(new WindowListener() {
            @Override
            public void windowOpened(WindowEvent e) {}
            @Override
            public void windowClosing(WindowEvent e) {}
            @Override
            public void windowClosed(WindowEvent e) {
                if(pegawai.getTable().getSelectedRow()!= -1){  
                    KodePetugas.setText(pegawai.getTable().getValueAt(pegawai.getTable().getSelectedRow(),0).toString());
                    NamaPetugas.setText(pegawai.getTable().getValueAt(pegawai.getTable().getSelectedRow(),1).toString());
                    btnDokterBedah.requestFocus();
                }  
                    
            }
            @Override
            public void windowIconified(WindowEvent e) {}
            @Override
            public void windowDeiconified(WindowEvent e) {}
            @Override
            public void windowActivated(WindowEvent e) {}
            @Override
            public void windowDeactivated(WindowEvent e) {}
        }); 
        
        ChkInput.setSelected(false);
        isForm();
        
        HTMLEditorKit kit = new HTMLEditorKit();
        LoadHTML.setEditable(true);
        LoadHTML.setEditorKit(kit);
        StyleSheet styleSheet = kit.getStyleSheet();
        styleSheet.addRule(
                ".isi td{border-right: 1px solid #e2e7dd;font: 8.5px tahoma;height:12px;border-bottom: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                ".isi2 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#323232;}"+
                ".isi3 td{border-right: 1px solid #e2e7dd;font: 8.5px tahoma;height:12px;border-top: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                ".isi4 td{font: 11px tahoma;height:12px;border-top: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                ".isi5 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#AA0000;}"+
                ".isi6 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#FF0000;}"+
                ".isi7 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#C8C800;}"+
                ".isi8 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#00AA00;}"+
                ".isi9 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#969696;}"
        );
        Document doc = kit.createDefaultDocument();
        LoadHTML.setDocument(doc);
    }


    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPopupMenu1 = new javax.swing.JPopupMenu();
        MnSkriningNutrisi = new javax.swing.JMenuItem();
        LoadHTML = new widget.editorpane();
        internalFrame1 = new widget.InternalFrame();
        Scroll = new widget.ScrollPane();
        tbObat = new widget.Table();
        jPanel3 = new javax.swing.JPanel();
        panelGlass8 = new widget.panelisi();
        BtnSimpan = new widget.Button();
        BtnBatal = new widget.Button();
        BtnHapus = new widget.Button();
        BtnEdit = new widget.Button();
        BtnPrint = new widget.Button();
        jLabel7 = new widget.Label();
        LCount = new widget.Label();
        BtnKeluar = new widget.Button();
        panelGlass9 = new widget.panelisi();
        jLabel19 = new widget.Label();
        DTPCari1 = new widget.Tanggal();
        jLabel21 = new widget.Label();
        DTPCari2 = new widget.Tanggal();
        jLabel6 = new widget.Label();
        TCari = new widget.TextBox();
        BtnCari = new widget.Button();
        BtnAll = new widget.Button();
        PanelInput = new javax.swing.JPanel();
        ChkInput = new widget.CekBox();
        scrollInput = new widget.ScrollPane();
        FormInput = new widget.PanelBiasa();
        jLabel4 = new widget.Label();
        TNoRw = new widget.TextBox();
        TPasien = new widget.TextBox();
        TNoRM = new widget.TextBox();
        jLabel16 = new widget.Label();
        jLabel8 = new widget.Label();
        TglLahir = new widget.TextBox();
        Tanggal = new widget.Tanggal();
        KeteranganPersiapanDarah = new widget.TextBox();
        jLabel23 = new widget.Label();
        KodePetugas = new widget.TextBox();
        NamaPetugas = new widget.TextBox();
        btnDokterBedah = new widget.Button();
        jLabel56 = new widget.Label();
        PersiapanDarah = new widget.ComboBox();
        PerlengkapanKhusus = new widget.ComboBox();
        jLabel58 = new widget.Label();
        jLabel5 = new widget.Label();
        jLabel65 = new widget.Label();
        jSeparator1 = new javax.swing.JSeparator();
        jSeparator2 = new javax.swing.JSeparator();
        jLabel53 = new widget.Label();

        jPopupMenu1.setName("jPopupMenu1"); // NOI18N

        MnSkriningNutrisi.setBackground(new java.awt.Color(255, 255, 254));
        MnSkriningNutrisi.setFont(new java.awt.Font("Tahoma", 0, 11)); // NOI18N
        MnSkriningNutrisi.setForeground(new java.awt.Color(50, 50, 50));
        MnSkriningNutrisi.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/category.png"))); // NOI18N
        MnSkriningNutrisi.setText("Formulir Checklist Pre Operasi");
        MnSkriningNutrisi.setName("MnSkriningNutrisi"); // NOI18N
        MnSkriningNutrisi.setPreferredSize(new java.awt.Dimension(260, 26));
        MnSkriningNutrisi.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                MnSkriningNutrisiActionPerformed(evt);
            }
        });
        jPopupMenu1.add(MnSkriningNutrisi);

        LoadHTML.setBorder(null);
        LoadHTML.setName("LoadHTML"); // NOI18N

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setUndecorated(true);
        setResizable(false);

        internalFrame1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(240, 245, 235)), "::[ Data Check List Kriteria Masuk HCU ]::", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 0, 11), new java.awt.Color(50, 50, 50))); // NOI18N
        internalFrame1.setFont(new java.awt.Font("Tahoma", 2, 12)); // NOI18N
        internalFrame1.setName("internalFrame1"); // NOI18N
        internalFrame1.setLayout(new java.awt.BorderLayout(1, 1));

        Scroll.setName("Scroll"); // NOI18N
        Scroll.setOpaque(true);
        Scroll.setPreferredSize(new java.awt.Dimension(452, 200));

        tbObat.setToolTipText("Silahkan klik untuk memilih data yang mau diedit ataupun dihapus");
        tbObat.setComponentPopupMenu(jPopupMenu1);
        tbObat.setName("tbObat"); // NOI18N
        tbObat.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                tbObatMouseClicked(evt);
            }
        });
        tbObat.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                tbObatKeyPressed(evt);
            }
        });
        Scroll.setViewportView(tbObat);

        internalFrame1.add(Scroll, java.awt.BorderLayout.CENTER);

        jPanel3.setName("jPanel3"); // NOI18N
        jPanel3.setOpaque(false);
        jPanel3.setPreferredSize(new java.awt.Dimension(44, 100));
        jPanel3.setLayout(new java.awt.BorderLayout(1, 1));

        panelGlass8.setName("panelGlass8"); // NOI18N
        panelGlass8.setPreferredSize(new java.awt.Dimension(44, 44));
        panelGlass8.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT, 5, 9));

        BtnSimpan.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/save-16x16.png"))); // NOI18N
        BtnSimpan.setMnemonic('S');
        BtnSimpan.setText("Simpan");
        BtnSimpan.setToolTipText("Alt+S");
        BtnSimpan.setName("BtnSimpan"); // NOI18N
        BtnSimpan.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnSimpan.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnSimpanActionPerformed(evt);
            }
        });
        BtnSimpan.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnSimpanKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnSimpan);

        BtnBatal.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/Cancel-2-16x16.png"))); // NOI18N
        BtnBatal.setMnemonic('B');
        BtnBatal.setText("Baru");
        BtnBatal.setToolTipText("Alt+B");
        BtnBatal.setName("BtnBatal"); // NOI18N
        BtnBatal.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnBatal.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnBatalActionPerformed(evt);
            }
        });
        BtnBatal.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnBatalKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnBatal);

        BtnHapus.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/stop_f2.png"))); // NOI18N
        BtnHapus.setMnemonic('H');
        BtnHapus.setText("Hapus");
        BtnHapus.setToolTipText("Alt+H");
        BtnHapus.setName("BtnHapus"); // NOI18N
        BtnHapus.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnHapus.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnHapusActionPerformed(evt);
            }
        });
        BtnHapus.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnHapusKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnHapus);

        BtnEdit.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/inventaris.png"))); // NOI18N
        BtnEdit.setMnemonic('G');
        BtnEdit.setText("Ganti");
        BtnEdit.setToolTipText("Alt+G");
        BtnEdit.setName("BtnEdit"); // NOI18N
        BtnEdit.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnEdit.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnEditActionPerformed(evt);
            }
        });
        BtnEdit.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnEditKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnEdit);

        BtnPrint.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/b_print.png"))); // NOI18N
        BtnPrint.setMnemonic('T');
        BtnPrint.setText("Cetak");
        BtnPrint.setToolTipText("Alt+T");
        BtnPrint.setName("BtnPrint"); // NOI18N
        BtnPrint.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnPrint.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnPrintActionPerformed(evt);
            }
        });
        BtnPrint.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnPrintKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnPrint);

        jLabel7.setText("Record :");
        jLabel7.setName("jLabel7"); // NOI18N
        jLabel7.setPreferredSize(new java.awt.Dimension(80, 23));
        panelGlass8.add(jLabel7);

        LCount.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        LCount.setText("0");
        LCount.setName("LCount"); // NOI18N
        LCount.setPreferredSize(new java.awt.Dimension(70, 23));
        panelGlass8.add(LCount);

        BtnKeluar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/exit.png"))); // NOI18N
        BtnKeluar.setMnemonic('K');
        BtnKeluar.setText("Keluar");
        BtnKeluar.setToolTipText("Alt+K");
        BtnKeluar.setName("BtnKeluar"); // NOI18N
        BtnKeluar.setPreferredSize(new java.awt.Dimension(100, 30));
        BtnKeluar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnKeluarActionPerformed(evt);
            }
        });
        BtnKeluar.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnKeluarKeyPressed(evt);
            }
        });
        panelGlass8.add(BtnKeluar);

        jPanel3.add(panelGlass8, java.awt.BorderLayout.CENTER);

        panelGlass9.setName("panelGlass9"); // NOI18N
        panelGlass9.setPreferredSize(new java.awt.Dimension(44, 44));
        panelGlass9.setLayout(new java.awt.FlowLayout(java.awt.FlowLayout.LEFT, 5, 9));

        jLabel19.setText("Tanggal :");
        jLabel19.setName("jLabel19"); // NOI18N
        jLabel19.setPreferredSize(new java.awt.Dimension(60, 23));
        panelGlass9.add(jLabel19);

        DTPCari1.setForeground(new java.awt.Color(50, 70, 50));
        DTPCari1.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "11-06-2023" }));
        DTPCari1.setDisplayFormat("dd-MM-yyyy");
        DTPCari1.setName("DTPCari1"); // NOI18N
        DTPCari1.setOpaque(false);
        DTPCari1.setPreferredSize(new java.awt.Dimension(95, 23));
        panelGlass9.add(DTPCari1);

        jLabel21.setHorizontalAlignment(javax.swing.SwingConstants.CENTER);
        jLabel21.setText("s.d.");
        jLabel21.setName("jLabel21"); // NOI18N
        jLabel21.setPreferredSize(new java.awt.Dimension(23, 23));
        panelGlass9.add(jLabel21);

        DTPCari2.setForeground(new java.awt.Color(50, 70, 50));
        DTPCari2.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "11-06-2023" }));
        DTPCari2.setDisplayFormat("dd-MM-yyyy");
        DTPCari2.setName("DTPCari2"); // NOI18N
        DTPCari2.setOpaque(false);
        DTPCari2.setPreferredSize(new java.awt.Dimension(95, 23));
        panelGlass9.add(DTPCari2);

        jLabel6.setText("Key Word :");
        jLabel6.setName("jLabel6"); // NOI18N
        jLabel6.setPreferredSize(new java.awt.Dimension(90, 23));
        panelGlass9.add(jLabel6);

        TCari.setName("TCari"); // NOI18N
        TCari.setPreferredSize(new java.awt.Dimension(310, 23));
        TCari.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TCariKeyPressed(evt);
            }
        });
        panelGlass9.add(TCari);

        BtnCari.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/accept.png"))); // NOI18N
        BtnCari.setMnemonic('3');
        BtnCari.setToolTipText("Alt+3");
        BtnCari.setName("BtnCari"); // NOI18N
        BtnCari.setPreferredSize(new java.awt.Dimension(28, 23));
        BtnCari.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnCariActionPerformed(evt);
            }
        });
        BtnCari.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnCariKeyPressed(evt);
            }
        });
        panelGlass9.add(BtnCari);

        BtnAll.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/Search-16x16.png"))); // NOI18N
        BtnAll.setMnemonic('M');
        BtnAll.setToolTipText("Alt+M");
        BtnAll.setName("BtnAll"); // NOI18N
        BtnAll.setPreferredSize(new java.awt.Dimension(28, 23));
        BtnAll.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                BtnAllActionPerformed(evt);
            }
        });
        BtnAll.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                BtnAllKeyPressed(evt);
            }
        });
        panelGlass9.add(BtnAll);

        jPanel3.add(panelGlass9, java.awt.BorderLayout.PAGE_START);

        internalFrame1.add(jPanel3, java.awt.BorderLayout.PAGE_END);

        PanelInput.setName("PanelInput"); // NOI18N
        PanelInput.setOpaque(false);
        PanelInput.setPreferredSize(new java.awt.Dimension(192, 386));
        PanelInput.setLayout(new java.awt.BorderLayout(1, 1));

        ChkInput.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/143.png"))); // NOI18N
        ChkInput.setMnemonic('I');
        ChkInput.setText(".: Input Data");
        ChkInput.setToolTipText("Alt+I");
        ChkInput.setBorderPainted(true);
        ChkInput.setBorderPaintedFlat(true);
        ChkInput.setFocusable(false);
        ChkInput.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        ChkInput.setHorizontalTextPosition(javax.swing.SwingConstants.RIGHT);
        ChkInput.setName("ChkInput"); // NOI18N
        ChkInput.setPreferredSize(new java.awt.Dimension(192, 20));
        ChkInput.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/143.png"))); // NOI18N
        ChkInput.setRolloverSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/145.png"))); // NOI18N
        ChkInput.setSelectedIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/145.png"))); // NOI18N
        ChkInput.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                ChkInputActionPerformed(evt);
            }
        });
        PanelInput.add(ChkInput, java.awt.BorderLayout.PAGE_END);

        scrollInput.setName("scrollInput"); // NOI18N
        scrollInput.setPreferredSize(new java.awt.Dimension(102, 557));

        FormInput.setBackground(new java.awt.Color(250, 255, 245));
        FormInput.setBorder(null);
        FormInput.setName("FormInput"); // NOI18N
        FormInput.setPreferredSize(new java.awt.Dimension(100, 363));
        FormInput.setLayout(null);

        jLabel4.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel4.setText("No.Rawat");
        jLabel4.setName("jLabel4"); // NOI18N
        FormInput.add(jLabel4);
        jLabel4.setBounds(21, 10, 75, 23);

        TNoRw.setHighlighter(null);
        TNoRw.setName("TNoRw"); // NOI18N
        TNoRw.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TNoRwKeyPressed(evt);
            }
        });
        FormInput.add(TNoRw);
        TNoRw.setBounds(79, 10, 141, 23);

        TPasien.setEditable(false);
        TPasien.setHighlighter(null);
        TPasien.setName("TPasien"); // NOI18N
        TPasien.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TPasienKeyPressed(evt);
            }
        });
        FormInput.add(TPasien);
        TPasien.setBounds(336, 10, 285, 23);

        TNoRM.setEditable(false);
        TNoRM.setHighlighter(null);
        TNoRM.setName("TNoRM"); // NOI18N
        TNoRM.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TNoRMKeyPressed(evt);
            }
        });
        FormInput.add(TNoRM);
        TNoRM.setBounds(222, 10, 112, 23);

        jLabel16.setText("Tanggal :");
        jLabel16.setName("jLabel16"); // NOI18N
        jLabel16.setVerifyInputWhenFocusTarget(false);
        FormInput.add(jLabel16);
        jLabel16.setBounds(0, 40, 75, 23);

        jLabel8.setText("Tgl.Lahir :");
        jLabel8.setName("jLabel8"); // NOI18N
        FormInput.add(jLabel8);
        jLabel8.setBounds(625, 10, 60, 23);

        TglLahir.setHighlighter(null);
        TglLahir.setName("TglLahir"); // NOI18N
        FormInput.add(TglLahir);
        TglLahir.setBounds(689, 10, 100, 23);

        Tanggal.setForeground(new java.awt.Color(50, 70, 50));
        Tanggal.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "11-06-2023 16:56:26" }));
        Tanggal.setDisplayFormat("dd-MM-yyyy HH:mm:ss");
        Tanggal.setName("Tanggal"); // NOI18N
        Tanggal.setOpaque(false);
        Tanggal.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                TanggalKeyPressed(evt);
            }
        });
        FormInput.add(Tanggal);
        Tanggal.setBounds(79, 40, 130, 23);

        KeteranganPersiapanDarah.setHighlighter(null);
        KeteranganPersiapanDarah.setName("KeteranganPersiapanDarah"); // NOI18N
        KeteranganPersiapanDarah.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                KeteranganPersiapanDarahKeyPressed(evt);
            }
        });
        FormInput.add(KeteranganPersiapanDarah);
        KeteranganPersiapanDarah.setBounds(283, 180, 150, 23);

        jLabel23.setText("DPJP/Dokter Jaga/IGD :");
        jLabel23.setName("jLabel23"); // NOI18N
        FormInput.add(jLabel23);
        jLabel23.setBounds(221, 40, 160, 23);

        KodePetugas.setEditable(false);
        KodePetugas.setHighlighter(null);
        KodePetugas.setName("KodePetugas"); // NOI18N
        FormInput.add(KodePetugas);
        KodePetugas.setBounds(385, 40, 127, 23);

        NamaPetugas.setEditable(false);
        NamaPetugas.setName("NamaPetugas"); // NOI18N
        FormInput.add(NamaPetugas);
        NamaPetugas.setBounds(514, 40, 245, 23);

        btnDokterBedah.setIcon(new javax.swing.ImageIcon(getClass().getResource("/picture/190.png"))); // NOI18N
        btnDokterBedah.setMnemonic('2');
        btnDokterBedah.setToolTipText("ALt+2");
        btnDokterBedah.setName("btnDokterBedah"); // NOI18N
        btnDokterBedah.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnDokterBedahActionPerformed(evt);
            }
        });
        btnDokterBedah.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                btnDokterBedahKeyPressed(evt);
            }
        });
        FormInput.add(btnDokterBedah);
        btnDokterBedah.setBounds(761, 40, 28, 23);

        jLabel56.setText("Perlengkapan Khusus, Alat/Implan :");
        jLabel56.setName("jLabel56"); // NOI18N
        FormInput.add(jLabel56);
        jLabel56.setBounds(460, 180, 190, 23);

        PersiapanDarah.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Ada", "Tidak Ada", "Tidak Diperlukan" }));
        PersiapanDarah.setName("PersiapanDarah"); // NOI18N
        PersiapanDarah.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                PersiapanDarahKeyPressed(evt);
            }
        });
        FormInput.add(PersiapanDarah);
        PersiapanDarah.setBounds(144, 180, 135, 23);

        PerlengkapanKhusus.setModel(new javax.swing.DefaultComboBoxModel(new String[] { "Ada", "Tidak Ada", "Tidak Diperlukan" }));
        PerlengkapanKhusus.setName("PerlengkapanKhusus"); // NOI18N
        PerlengkapanKhusus.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                PerlengkapanKhususKeyPressed(evt);
            }
        });
        FormInput.add(PerlengkapanKhusus);
        PerlengkapanKhusus.setBounds(654, 180, 135, 23);

        jLabel58.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel58.setText("Persiapan Darah");
        jLabel58.setName("jLabel58"); // NOI18N
        FormInput.add(jLabel58);
        jLabel58.setBounds(53, 180, 90, 23);

        jLabel5.setText(":");
        jLabel5.setName("jLabel5"); // NOI18N
        FormInput.add(jLabel5);
        jLabel5.setBounds(0, 10, 75, 23);

        jLabel65.setText(":");
        jLabel65.setName("jLabel65"); // NOI18N
        FormInput.add(jLabel65);
        jLabel65.setBounds(0, 180, 140, 23);

        jSeparator1.setBackground(new java.awt.Color(239, 244, 234));
        jSeparator1.setForeground(new java.awt.Color(239, 244, 234));
        jSeparator1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(239, 244, 234)));
        jSeparator1.setName("jSeparator1"); // NOI18N
        FormInput.add(jSeparator1);
        jSeparator1.setBounds(0, 70, 810, 1);

        jSeparator2.setBackground(new java.awt.Color(239, 244, 234));
        jSeparator2.setForeground(new java.awt.Color(239, 244, 234));
        jSeparator2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(239, 244, 234)));
        jSeparator2.setName("jSeparator2"); // NOI18N
        FormInput.add(jSeparator2);
        jSeparator2.setBounds(0, 70, 810, 1);

        jLabel53.setHorizontalAlignment(javax.swing.SwingConstants.LEFT);
        jLabel53.setText("I. SISTEM KARDIOLOGI");
        jLabel53.setName("jLabel53"); // NOI18N
        FormInput.add(jLabel53);
        jLabel53.setBounds(10, 70, 180, 23);

        scrollInput.setViewportView(FormInput);

        PanelInput.add(scrollInput, java.awt.BorderLayout.CENTER);

        internalFrame1.add(PanelInput, java.awt.BorderLayout.PAGE_START);

        getContentPane().add(internalFrame1, java.awt.BorderLayout.CENTER);

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void TNoRwKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TNoRwKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_PAGE_DOWN){
            isRawat();
            isPsien();
        }else{            
            //Valid.pindah(evt,TCari,Tanggal);
        }
}//GEN-LAST:event_TNoRwKeyPressed

    private void TPasienKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TPasienKeyPressed
        Valid.pindah(evt,TCari,BtnSimpan);
}//GEN-LAST:event_TPasienKeyPressed

    private void BtnSimpanActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnSimpanActionPerformed
        /*if(TNoRw.getText().trim().equals("")||TPasien.getText().trim().equals("")){
            Valid.textKosong(TNoRw,"pasien");
        }else if(KodePetugas.getText().trim().equals("")||NamaPetugas.getText().trim().equals("")){
            Valid.textKosong(btnDokterBedah,"Dokter Bedah");
        }else{
            if(Sequel.menyimpantf("checklist_pre_operasi","?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?","Data",27,new String[]{
                TNoRw.getText(),Valid.SetTgl(Tanggal.getSelectedItem()+"")+" "+Tanggal.getSelectedItem().toString().substring(11,19),SNCN.getText(),Tindakan.getText(),
                KodePetugas.getText(),KodeDokterAnestesi.getText(),Identitas.getSelectedItem().toString(),IjinBedah.getSelectedItem().toString(), 
                IjinAnestesi.getSelectedItem().toString(),IjinTransfusi.getSelectedItem().toString(),AreaOperasi.getSelectedItem().toString(), 
                KeadaanUmum.getSelectedItem().toString(),Radiologi.getSelectedItem().toString(),KeteranganRadiologi.getText(),EKG.getSelectedItem().toString(), 
                KeteranganEKG.getText(),USG.getSelectedItem().toString(),KeteranganUSG.getText(),CTScan.getSelectedItem().toString(),KeteranganCTScan.getText(), 
                MRI.getSelectedItem().toString(),KeteranganMRI.getText(),PersiapanDarah.getSelectedItem().toString(),KeteranganPersiapanDarah.getText(), 
                PerlengkapanKhusus.getSelectedItem().toString(),KdPetugasRuangan.getText(),KdPetugasOK.getText()
            })==true){
                tampil();
                emptTeks();
            } 
        }*/
}//GEN-LAST:event_BtnSimpanActionPerformed

    private void BtnSimpanKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnSimpanKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnSimpanActionPerformed(null);
        }else{
            //Valid.pindah(evt,btnPetugasOK,BtnBatal);
        }
}//GEN-LAST:event_BtnSimpanKeyPressed

    private void BtnBatalActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnBatalActionPerformed
        ChkInput.setSelected(true);
        isForm(); 
        emptTeks();
}//GEN-LAST:event_BtnBatalActionPerformed

    private void BtnBatalKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnBatalKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            emptTeks();
        }else{Valid.pindah(evt, BtnSimpan, BtnHapus);}
}//GEN-LAST:event_BtnBatalKeyPressed

    private void BtnHapusActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnHapusActionPerformed
        if(tbObat.getSelectedRow()>-1){
            if(akses.getkode().equals("Admin Utama")){
                hapus();
            }else {
                if(akses.getkode().equals(tbObat.getValueAt(tbObat.getSelectedRow(),31).toString())||akses.getkode().equals(tbObat.getValueAt(tbObat.getSelectedRow(),33).toString())){
                    hapus();
                }else{
                    JOptionPane.showMessageDialog(null,"Harus salah satu petugas sesuai user login..!!");
                }
            }
        }else{
            JOptionPane.showMessageDialog(rootPane,"Silahkan anda pilih data terlebih dahulu..!!");
        }   
}//GEN-LAST:event_BtnHapusActionPerformed

    private void BtnHapusKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnHapusKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnHapusActionPerformed(null);
        }else{
            Valid.pindah(evt, BtnBatal, BtnEdit);
        }
}//GEN-LAST:event_BtnHapusKeyPressed

    private void BtnEditActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnEditActionPerformed
        /*if(TNoRw.getText().trim().equals("")||TPasien.getText().trim().equals("")){
            Valid.textKosong(TNoRw,"pasien");
        }else if(KodePetugas.getText().trim().equals("")||NamaPetugas.getText().trim().equals("")){
            Valid.textKosong(btnDokterBedah,"Dokter Bedah");
        }else if(KodeDokterAnestesi.getText().trim().equals("")||NamaDokterAnestesi.getText().trim().equals("")){
            Valid.textKosong(KodeDokterAnestesi,"Dokter Anestesi");
        }else if(Tindakan.getText().trim().equals("")){
            Valid.textKosong(Tindakan,"Tindakan");
        }else if(SNCN.getText().trim().equals("")){
            Valid.textKosong(SNCN,"SN/CN");
        }else{  
            if(tbObat.getSelectedRow()>-1){
                if(akses.getkode().equals("Admin Utama")){
                    ganti();
                }else {
                    if(akses.getkode().equals(tbObat.getValueAt(tbObat.getSelectedRow(),31).toString())||akses.getkode().equals(tbObat.getValueAt(tbObat.getSelectedRow(),33).toString())){
                        ganti();
                    }else{
                        JOptionPane.showMessageDialog(null,"Harus salah satu petugas sesuai user login..!!");
                    }
                }
            }else{
                JOptionPane.showMessageDialog(rootPane,"Silahkan anda pilih data terlebih dahulu..!!");
            }
        }*/
}//GEN-LAST:event_BtnEditActionPerformed

    private void BtnEditKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnEditKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnEditActionPerformed(null);
        }else{
            Valid.pindah(evt, BtnHapus, BtnPrint);
        }
}//GEN-LAST:event_BtnEditKeyPressed

    private void BtnKeluarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnKeluarActionPerformed
        pegawai.dispose();
        dispose();
}//GEN-LAST:event_BtnKeluarActionPerformed

    private void BtnKeluarKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnKeluarKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnKeluarActionPerformed(null);
        }else{Valid.pindah(evt,BtnEdit,TCari);}
}//GEN-LAST:event_BtnKeluarKeyPressed

    private void BtnPrintActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnPrintActionPerformed
        this.setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
        if(tabMode.getRowCount()==0){
            JOptionPane.showMessageDialog(null,"Maaf, data sudah habis. Tidak ada data yang bisa anda print...!!!!");
            BtnBatal.requestFocus();
        }else if(tabMode.getRowCount()!=0){
            try{
                if(TCari.getText().trim().equals("")){
                    ps=koneksi.prepareStatement(
                        "select reg_periksa.no_rawat,pasien.no_rkm_medis,pasien.nm_pasien,pasien.tgl_lahir,pasien.jk,checklist_pre_operasi.tanggal,"+
                        "checklist_pre_operasi.sncn,checklist_pre_operasi.tindakan,checklist_pre_operasi.kd_pegawai_bedah,pegawaibedah.nm_pegawai as pegawaibedah,"+
                        "checklist_pre_operasi.kd_pegawai_anestesi,pegawaianestesi.nm_pegawai as pegawaianestesi,checklist_pre_operasi.identitas,"+
                        "checklist_pre_operasi.surat_ijin_bedah,checklist_pre_operasi.surat_ijin_anestesi,checklist_pre_operasi.surat_ijin_transfusi,"+
                        "checklist_pre_operasi.penandaan_area_operasi,checklist_pre_operasi.keadaan_umum,checklist_pre_operasi.pemeriksaan_penunjang_rontgen,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_rontgen,checklist_pre_operasi.pemeriksaan_penunjang_ekg,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ekg,checklist_pre_operasi.pemeriksaan_penunjang_usg,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_usg,checklist_pre_operasi.pemeriksaan_penunjang_ctscan,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ctscan,checklist_pre_operasi.pemeriksaan_penunjang_mri,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_mri,checklist_pre_operasi.persiapan_darah,checklist_pre_operasi.keterangan_persiapan_darah,"+
                        "checklist_pre_operasi.perlengkapan_khusus,checklist_pre_operasi.nip_petugas_ruangan,petugasruangan.nama as petugasruangan,"+
                        "checklist_pre_operasi.nip_perawat_ok,petugasok.nama as petugasok "+
                        "from checklist_pre_operasi inner join reg_periksa on checklist_pre_operasi.no_rawat=reg_periksa.no_rawat "+
                        "inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis "+
                        "inner join pegawai as pegawaibedah on pegawaibedah.kd_pegawai=checklist_pre_operasi.kd_pegawai_bedah "+
                        "inner join pegawai as pegawaianestesi on pegawaianestesi.kd_pegawai=checklist_pre_operasi.kd_pegawai_anestesi "+
                        "inner join petugas as petugasruangan on petugasruangan.nip=checklist_pre_operasi.nip_petugas_ruangan "+
                        "inner join petugas as petugasok on petugasok.nip=checklist_pre_operasi.nip_perawat_ok "+
                        "where checklist_pre_operasi.tanggal between ? and ? order by checklist_pre_operasi.tanggal ");
                }else{
                    ps=koneksi.prepareStatement(
                        "select reg_periksa.no_rawat,pasien.no_rkm_medis,pasien.nm_pasien,pasien.tgl_lahir,pasien.jk,checklist_pre_operasi.tanggal,"+
                        "checklist_pre_operasi.sncn,checklist_pre_operasi.tindakan,checklist_pre_operasi.kd_pegawai_bedah,pegawaibedah.nm_pegawai as pegawaibedah,"+
                        "checklist_pre_operasi.kd_pegawai_anestesi,pegawaianestesi.nm_pegawai as pegawaianestesi,checklist_pre_operasi.identitas,"+
                        "checklist_pre_operasi.surat_ijin_bedah,checklist_pre_operasi.surat_ijin_anestesi,checklist_pre_operasi.surat_ijin_transfusi,"+
                        "checklist_pre_operasi.penandaan_area_operasi,checklist_pre_operasi.keadaan_umum,checklist_pre_operasi.pemeriksaan_penunjang_rontgen,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_rontgen,checklist_pre_operasi.pemeriksaan_penunjang_ekg,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ekg,checklist_pre_operasi.pemeriksaan_penunjang_usg,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_usg,checklist_pre_operasi.pemeriksaan_penunjang_ctscan,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ctscan,checklist_pre_operasi.pemeriksaan_penunjang_mri,"+
                        "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_mri,checklist_pre_operasi.persiapan_darah,checklist_pre_operasi.keterangan_persiapan_darah,"+
                        "checklist_pre_operasi.perlengkapan_khusus,checklist_pre_operasi.nip_petugas_ruangan,petugasruangan.nama as petugasruangan,"+
                        "checklist_pre_operasi.nip_perawat_ok,petugasok.nama as petugasok "+
                        "from checklist_pre_operasi inner join reg_periksa on checklist_pre_operasi.no_rawat=reg_periksa.no_rawat "+
                        "inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis "+
                        "inner join pegawai as pegawaibedah on pegawaibedah.kd_pegawai=checklist_pre_operasi.kd_pegawai_bedah "+
                        "inner join pegawai as pegawaianestesi on pegawaianestesi.kd_pegawai=checklist_pre_operasi.kd_pegawai_anestesi "+
                        "inner join petugas as petugasruangan on petugasruangan.nip=checklist_pre_operasi.nip_petugas_ruangan "+
                        "inner join petugas as petugasok on petugasok.nip=checklist_pre_operasi.nip_perawat_ok "+
                        "where checklist_pre_operasi.tanggal between ? and ? and (reg_periksa.no_rawat like ? or pasien.no_rkm_medis like ? or "+
                        "pasien.nm_pasien like ? or pegawaibedah.nm_pegawai like ? or pegawaianestesi.nm_pegawai like ? or petugasruangan.nama like ?) "+
                        "order by checklist_pre_operasi.tanggal ");
                }

                try {
                    if(TCari.getText().trim().equals("")){
                        ps.setString(1,Valid.SetTgl(DTPCari1.getSelectedItem()+"")+" 00:00:00");
                        ps.setString(2,Valid.SetTgl(DTPCari2.getSelectedItem()+"")+" 23:59:59");
                    }else{
                        ps.setString(1,Valid.SetTgl(DTPCari1.getSelectedItem()+"")+" 00:00:00");
                        ps.setString(2,Valid.SetTgl(DTPCari2.getSelectedItem()+"")+" 23:59:59");
                        ps.setString(3,"%"+TCari.getText()+"%");
                        ps.setString(4,"%"+TCari.getText()+"%");
                        ps.setString(5,"%"+TCari.getText()+"%");
                        ps.setString(6,"%"+TCari.getText()+"%");
                        ps.setString(7,"%"+TCari.getText()+"%");
                        ps.setString(8,"%"+TCari.getText()+"%");
                    }
                    rs=ps.executeQuery();
                    htmlContent = new StringBuilder();
                    htmlContent.append(                             
                        "<tr class='isi'>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>No.Rawat</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>No.RM</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Nama Pasien</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Tgl.Lahir</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>J.K.</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Tanggal</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>SN/CN</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Tindakan</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Kode Dokter Bedah</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Nama Dokter Bedah</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Kode Dokter Anest</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Nama Dokter Anestesi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Identitas</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keadaan Umum</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Penandaan Area Operasi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Surat Ijin Bedah</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Surat Ijin Anestesi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Surat Ijin Transfusi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Persiapan Darah</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan Persiapan Darah</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Perlengkapan Khusus</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Radiologi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan Radiologi</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>EKG</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan EKG</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>USG</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan USG</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>CT Scan</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan CT Scan</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>MRI</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Keterangan MRI</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>NIP Ruangan</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Petugas Ruangan</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>NIP OK</b></td>"+
                            "<td valign='middle' bgcolor='#FFFAFA' align='center'><b>Petugas Ruang OK</b></td>"+
                        "</tr>"
                    );
                    while(rs.next()){
                        htmlContent.append(
                            "<tr class='isi'>"+
                               "<td valign='top'>"+rs.getString("no_rawat")+"</td>"+
                               "<td valign='top'>"+rs.getString("no_rkm_medis")+"</td>"+
                               "<td valign='top'>"+rs.getString("nm_pasien")+"</td>"+
                               "<td valign='top'>"+rs.getString("tgl_lahir")+"</td>"+
                               "<td valign='top'>"+rs.getString("jk")+"</td>"+
                               "<td valign='top'>"+rs.getString("tanggal")+"</td>"+
                               "<td valign='top'>"+rs.getString("sncn")+"</td>"+
                               "<td valign='top'>"+rs.getString("tindakan")+"</td>"+
                               "<td valign='top'>"+rs.getString("kd_pegawai_bedah")+"</td>"+
                               "<td valign='top'>"+rs.getString("pegawaibedah")+"</td>"+
                               "<td valign='top'>"+rs.getString("kd_pegawai_anestesi")+"</td>"+
                               "<td valign='top'>"+rs.getString("pegawaianestesi")+"</td>"+
                               "<td valign='top'>"+rs.getString("identitas")+"</td>"+
                               "<td valign='top'>"+rs.getString("keadaan_umum")+"</td>"+
                               "<td valign='top'>"+rs.getString("penandaan_area_operasi")+"</td>"+
                               "<td valign='top'>"+rs.getString("surat_ijin_bedah")+"</td>"+
                               "<td valign='top'>"+rs.getString("surat_ijin_anestesi")+"</td>"+
                               "<td valign='top'>"+rs.getString("surat_ijin_transfusi")+"</td>"+
                               "<td valign='top'>"+rs.getString("persiapan_darah")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_persiapan_darah")+"</td>"+
                               "<td valign='top'>"+rs.getString("perlengkapan_khusus")+"</td>"+
                               "<td valign='top'>"+rs.getString("pemeriksaan_penunjang_rontgen")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_pemeriksaan_penunjang_rontgen")+"</td>"+
                               "<td valign='top'>"+rs.getString("pemeriksaan_penunjang_ekg")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_pemeriksaan_penunjang_ekg")+"</td>"+
                               "<td valign='top'>"+rs.getString("pemeriksaan_penunjang_usg")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_pemeriksaan_penunjang_usg")+"</td>"+
                               "<td valign='top'>"+rs.getString("pemeriksaan_penunjang_ctscan")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_pemeriksaan_penunjang_ctscan")+"</td>"+
                               "<td valign='top'>"+rs.getString("pemeriksaan_penunjang_mri")+"</td>"+
                               "<td valign='top'>"+rs.getString("keterangan_pemeriksaan_penunjang_mri")+"</td>"+
                               "<td valign='top'>"+rs.getString("nip_petugas_ruangan")+"</td>"+
                               "<td valign='top'>"+rs.getString("petugasruangan")+"</td>"+
                               "<td valign='top'>"+rs.getString("nip_perawat_ok")+"</td>"+
                               "<td valign='top'>"+rs.getString("petugasok")+"</td>"+
                            "</tr>");
                    }
                    LoadHTML.setText(
                        "<html>"+
                          "<table width='3500px' border='0' align='center' cellpadding='1px' cellspacing='0' class='tbl_form'>"+
                           htmlContent.toString()+
                          "</table>"+
                        "</html>"
                    );

                    File g = new File("file2.css");            
                    BufferedWriter bg = new BufferedWriter(new FileWriter(g));
                    bg.write(
                        ".isi td{border-right: 1px solid #e2e7dd;font: 8.5px tahoma;height:12px;border-bottom: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                        ".isi2 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#323232;}"+
                        ".isi3 td{border-right: 1px solid #e2e7dd;font: 8.5px tahoma;height:12px;border-top: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                        ".isi4 td{font: 11px tahoma;height:12px;border-top: 1px solid #e2e7dd;background: #ffffff;color:#323232;}"+
                        ".isi5 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#AA0000;}"+
                        ".isi6 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#FF0000;}"+
                        ".isi7 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#C8C800;}"+
                        ".isi8 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#00AA00;}"+
                        ".isi9 td{font: 8.5px tahoma;border:none;height:12px;background: #ffffff;color:#969696;}"
                    );
                    bg.close();

                    File f = new File("DataChecklistPreOperasi.html");            
                    BufferedWriter bw = new BufferedWriter(new FileWriter(f));            
                    bw.write(LoadHTML.getText().replaceAll("<head>","<head>"+
                                "<link href=\"file2.css\" rel=\"stylesheet\" type=\"text/css\" />"+
                                "<table width='3500px' border='0' align='center' cellpadding='3px' cellspacing='0' class='tbl_form'>"+
                                    "<tr class='isi2'>"+
                                        "<td valign='top' align='center'>"+
                                            "<font size='4' face='Tahoma'>"+akses.getnamars()+"</font><br>"+
                                            akses.getalamatrs()+", "+akses.getkabupatenrs()+", "+akses.getpropinsirs()+"<br>"+
                                            akses.getkontakrs()+", E-mail : "+akses.getemailrs()+"<br><br>"+
                                            "<font size='2' face='Tahoma'>DATA CHECK LIST PRE OPERASI<br><br></font>"+        
                                        "</td>"+
                                   "</tr>"+
                                "</table>")
                    );
                    bw.close();                         
                    Desktop.getDesktop().browse(f.toURI());
                } catch (Exception e) {
                    System.out.println("Notif : "+e);
                } finally{
                    if(rs!=null){
                        rs.close();
                    }
                    if(ps!=null){
                        ps.close();
                    }
                }

            }catch(Exception e){
                System.out.println("Notifikasi : "+e);
            }
        }
        this.setCursor(Cursor.getDefaultCursor());
}//GEN-LAST:event_BtnPrintActionPerformed

    private void BtnPrintKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnPrintKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnPrintActionPerformed(null);
        }else{
            Valid.pindah(evt, BtnEdit, BtnKeluar);
        }
}//GEN-LAST:event_BtnPrintKeyPressed

    private void TCariKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TCariKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_ENTER){
            BtnCariActionPerformed(null);
        }else if(evt.getKeyCode()==KeyEvent.VK_PAGE_DOWN){
            BtnCari.requestFocus();
        }else if(evt.getKeyCode()==KeyEvent.VK_PAGE_UP){
            BtnKeluar.requestFocus();
        }
}//GEN-LAST:event_TCariKeyPressed

    private void BtnCariActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnCariActionPerformed
        tampil();
}//GEN-LAST:event_BtnCariActionPerformed

    private void BtnCariKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnCariKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            BtnCariActionPerformed(null);
        }else{
            Valid.pindah(evt, TCari, BtnAll);
        }
}//GEN-LAST:event_BtnCariKeyPressed

    private void BtnAllActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_BtnAllActionPerformed
        TCari.setText("");
        tampil();
}//GEN-LAST:event_BtnAllActionPerformed

    private void BtnAllKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_BtnAllKeyPressed
        if(evt.getKeyCode()==KeyEvent.VK_SPACE){
            tampil();
            TCari.setText("");
        }else{
            Valid.pindah(evt, BtnCari, TPasien);
        }
}//GEN-LAST:event_BtnAllKeyPressed

    private void TNoRMKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TNoRMKeyPressed
        // Valid.pindah(evt, TNm, BtnSimpan);
}//GEN-LAST:event_TNoRMKeyPressed

    private void tbObatMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_tbObatMouseClicked
        if(tabMode.getRowCount()!=0){
            try {
                getData();
            } catch (java.lang.NullPointerException e) {
            }
        }
}//GEN-LAST:event_tbObatMouseClicked

    private void tbObatKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_tbObatKeyPressed
        if(tabMode.getRowCount()!=0){
            if((evt.getKeyCode()==KeyEvent.VK_ENTER)||(evt.getKeyCode()==KeyEvent.VK_UP)||(evt.getKeyCode()==KeyEvent.VK_DOWN)){
                try {
                    getData();
                } catch (java.lang.NullPointerException e) {
                }
            }
        }
}//GEN-LAST:event_tbObatKeyPressed

    private void MnSkriningNutrisiActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_MnSkriningNutrisiActionPerformed
        if(tbObat.getSelectedRow()>-1){
            Map<String, Object> param = new HashMap<>();
            param.put("namars",akses.getnamars());
            param.put("alamatrs",akses.getalamatrs());
            param.put("kotars",akses.getkabupatenrs());
            param.put("propinsirs",akses.getpropinsirs());
            param.put("kontakrs",akses.getkontakrs());
            param.put("emailrs",akses.getemailrs());   
            param.put("logo",Sequel.cariGambar("select setting.logo from setting")); 
            finger=Sequel.cariIsi("select sha1(sidikjari.sidikjari) from sidikjari inner join pegawai on pegawai.id=sidikjari.id where pegawai.nik=?",tbObat.getValueAt(tbObat.getSelectedRow(),31).toString());
            param.put("finger","Dikeluarkan di "+akses.getnamars()+", Kabupaten/Kota "+akses.getkabupatenrs()+"\nDitandatangani secara elektronik oleh "+tbObat.getValueAt(tbObat.getSelectedRow(),32).toString()+"\nID "+(finger.equals("")?tbObat.getValueAt(tbObat.getSelectedRow(),31).toString():finger)+"\n"+Tanggal.getSelectedItem()); 
            finger2=Sequel.cariIsi("select sha1(sidikjari.sidikjari) from sidikjari inner join pegawai on pegawai.id=sidikjari.id where pegawai.nik=?",tbObat.getValueAt(tbObat.getSelectedRow(),33).toString());
            param.put("finger2","Dikeluarkan di "+akses.getnamars()+", Kabupaten/Kota "+akses.getkabupatenrs()+"\nDitandatangani secara elektronik oleh "+tbObat.getValueAt(tbObat.getSelectedRow(),34).toString()+"\nID "+(finger2.equals("")?tbObat.getValueAt(tbObat.getSelectedRow(),33).toString():finger2)+"\n"+Tanggal.getSelectedItem()); 
            Valid.MyReportqry("rptFormulirChecklistPreOperasi.jasper","report","::[ Formulir Check List Pre Operasi ]::",
                    "select reg_periksa.no_rawat,pasien.no_rkm_medis,pasien.nm_pasien,pasien.tgl_lahir,pasien.jk,checklist_pre_operasi.tanggal,"+
                    "checklist_pre_operasi.sncn,checklist_pre_operasi.tindakan,checklist_pre_operasi.kd_pegawai_bedah,pegawaibedah.nm_pegawai as pegawaibedah,"+
                    "checklist_pre_operasi.kd_pegawai_anestesi,pegawaianestesi.nm_pegawai as pegawaianestesi,checklist_pre_operasi.identitas,"+
                    "checklist_pre_operasi.surat_ijin_bedah,checklist_pre_operasi.surat_ijin_anestesi,checklist_pre_operasi.surat_ijin_transfusi,"+
                    "checklist_pre_operasi.penandaan_area_operasi,checklist_pre_operasi.keadaan_umum,checklist_pre_operasi.pemeriksaan_penunjang_rontgen,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_rontgen,checklist_pre_operasi.pemeriksaan_penunjang_ekg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ekg,checklist_pre_operasi.pemeriksaan_penunjang_usg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_usg,checklist_pre_operasi.pemeriksaan_penunjang_ctscan,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ctscan,checklist_pre_operasi.pemeriksaan_penunjang_mri,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_mri,checklist_pre_operasi.persiapan_darah,checklist_pre_operasi.keterangan_persiapan_darah,"+
                    "checklist_pre_operasi.perlengkapan_khusus,checklist_pre_operasi.nip_petugas_ruangan,petugasruangan.nama as petugasruangan,"+
                    "checklist_pre_operasi.nip_perawat_ok,petugasok.nama as petugasok "+
                    "from checklist_pre_operasi inner join reg_periksa on checklist_pre_operasi.no_rawat=reg_periksa.no_rawat "+
                    "inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis "+
                    "inner join pegawai as pegawaibedah on pegawaibedah.kd_pegawai=checklist_pre_operasi.kd_pegawai_bedah "+
                    "inner join pegawai as pegawaianestesi on pegawaianestesi.kd_pegawai=checklist_pre_operasi.kd_pegawai_anestesi "+
                    "inner join petugas as petugasruangan on petugasruangan.nip=checklist_pre_operasi.nip_petugas_ruangan "+
                    "inner join petugas as petugasok on petugasok.nip=checklist_pre_operasi.nip_perawat_ok "+
                    "where checklist_pre_operasi.no_rawat='"+tbObat.getValueAt(tbObat.getSelectedRow(),0).toString()+"' and checklist_pre_operasi.tanggal='"+tbObat.getValueAt(tbObat.getSelectedRow(),5).toString()+"' ",param);
        }
    }//GEN-LAST:event_MnSkriningNutrisiActionPerformed

    private void ChkInputActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_ChkInputActionPerformed
        isForm();
    }//GEN-LAST:event_ChkInputActionPerformed

    private void TanggalKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_TanggalKeyPressed
       // Valid.pindah(evt,Rencana,Informasi);
    }//GEN-LAST:event_TanggalKeyPressed

    private void btnDokterBedahActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnDokterBedahActionPerformed
        pilihan=1;
        pegawai.emptTeks();
        pegawai.setSize(internalFrame1.getWidth()-20,internalFrame1.getHeight()-20);
        pegawai.setLocationRelativeTo(internalFrame1);
        pegawai.setVisible(true);
    }//GEN-LAST:event_btnDokterBedahActionPerformed

    private void btnDokterBedahKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_btnDokterBedahKeyPressed
       // Valid.pindah(evt,Tindakan,btnDokterAnestesi);
    }//GEN-LAST:event_btnDokterBedahKeyPressed

    private void PersiapanDarahKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_PersiapanDarahKeyPressed
       //Valid.pindah(evt,IjinTransfusi,KeteranganPersiapanDarah);
    }//GEN-LAST:event_PersiapanDarahKeyPressed

    private void PerlengkapanKhususKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_PerlengkapanKhususKeyPressed
        //Valid.pindah(evt,KeteranganPersiapanDarah,Radiologi);
    }//GEN-LAST:event_PerlengkapanKhususKeyPressed

    private void KeteranganPersiapanDarahKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_KeteranganPersiapanDarahKeyPressed
        //Valid.pindah(evt,PersiapanDarah,PerlengkapanKhusus);
    }//GEN-LAST:event_KeteranganPersiapanDarahKeyPressed

    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(() -> {
            RMChecklistKriteriaMasukHCU dialog = new RMChecklistKriteriaMasukHCU(new javax.swing.JFrame(), true);
            dialog.addWindowListener(new java.awt.event.WindowAdapter() {
                @Override
                public void windowClosing(java.awt.event.WindowEvent e) {
                    System.exit(0);
                }
            });
            dialog.setVisible(true);
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private widget.Button BtnAll;
    private widget.Button BtnBatal;
    private widget.Button BtnCari;
    private widget.Button BtnEdit;
    private widget.Button BtnHapus;
    private widget.Button BtnKeluar;
    private widget.Button BtnPrint;
    private widget.Button BtnSimpan;
    private widget.CekBox ChkInput;
    private widget.Tanggal DTPCari1;
    private widget.Tanggal DTPCari2;
    private widget.PanelBiasa FormInput;
    private widget.TextBox KeteranganPersiapanDarah;
    private widget.TextBox KodePetugas;
    private widget.Label LCount;
    private widget.editorpane LoadHTML;
    private javax.swing.JMenuItem MnSkriningNutrisi;
    private widget.TextBox NamaPetugas;
    private javax.swing.JPanel PanelInput;
    private widget.ComboBox PerlengkapanKhusus;
    private widget.ComboBox PersiapanDarah;
    private widget.ScrollPane Scroll;
    private widget.TextBox TCari;
    private widget.TextBox TNoRM;
    private widget.TextBox TNoRw;
    private widget.TextBox TPasien;
    private widget.Tanggal Tanggal;
    private widget.TextBox TglLahir;
    private widget.Button btnDokterBedah;
    private widget.InternalFrame internalFrame1;
    private widget.Label jLabel16;
    private widget.Label jLabel19;
    private widget.Label jLabel21;
    private widget.Label jLabel23;
    private widget.Label jLabel4;
    private widget.Label jLabel5;
    private widget.Label jLabel53;
    private widget.Label jLabel56;
    private widget.Label jLabel58;
    private widget.Label jLabel6;
    private widget.Label jLabel65;
    private widget.Label jLabel7;
    private widget.Label jLabel8;
    private javax.swing.JPanel jPanel3;
    private javax.swing.JPopupMenu jPopupMenu1;
    private javax.swing.JSeparator jSeparator1;
    private javax.swing.JSeparator jSeparator2;
    private widget.panelisi panelGlass8;
    private widget.panelisi panelGlass9;
    private widget.ScrollPane scrollInput;
    private widget.Table tbObat;
    // End of variables declaration//GEN-END:variables
    
    public void tampil() {
        Valid.tabelKosong(tabMode);
        try{
            if(TCari.getText().trim().equals("")){
                ps=koneksi.prepareStatement(
                    "select reg_periksa.no_rawat,pasien.no_rkm_medis,pasien.nm_pasien,pasien.tgl_lahir,pasien.jk,checklist_pre_operasi.tanggal,"+
                    "checklist_pre_operasi.sncn,checklist_pre_operasi.tindakan,checklist_pre_operasi.kd_pegawai_bedah,pegawaibedah.nm_pegawai as pegawaibedah,"+
                    "checklist_pre_operasi.kd_pegawai_anestesi,pegawaianestesi.nm_pegawai as pegawaianestesi,checklist_pre_operasi.identitas,"+
                    "checklist_pre_operasi.surat_ijin_bedah,checklist_pre_operasi.surat_ijin_anestesi,checklist_pre_operasi.surat_ijin_transfusi,"+
                    "checklist_pre_operasi.penandaan_area_operasi,checklist_pre_operasi.keadaan_umum,checklist_pre_operasi.pemeriksaan_penunjang_rontgen,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_rontgen,checklist_pre_operasi.pemeriksaan_penunjang_ekg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ekg,checklist_pre_operasi.pemeriksaan_penunjang_usg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_usg,checklist_pre_operasi.pemeriksaan_penunjang_ctscan,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ctscan,checklist_pre_operasi.pemeriksaan_penunjang_mri,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_mri,checklist_pre_operasi.persiapan_darah,checklist_pre_operasi.keterangan_persiapan_darah,"+
                    "checklist_pre_operasi.perlengkapan_khusus,checklist_pre_operasi.nip_petugas_ruangan,petugasruangan.nama as petugasruangan,"+
                    "checklist_pre_operasi.nip_perawat_ok,petugasok.nama as petugasok "+
                    "from checklist_pre_operasi inner join reg_periksa on checklist_pre_operasi.no_rawat=reg_periksa.no_rawat "+
                    "inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis "+
                    "inner join pegawai as pegawaibedah on pegawaibedah.kd_pegawai=checklist_pre_operasi.kd_pegawai_bedah "+
                    "inner join pegawai as pegawaianestesi on pegawaianestesi.kd_pegawai=checklist_pre_operasi.kd_pegawai_anestesi "+
                    "inner join petugas as petugasruangan on petugasruangan.nip=checklist_pre_operasi.nip_petugas_ruangan "+
                    "inner join petugas as petugasok on petugasok.nip=checklist_pre_operasi.nip_perawat_ok "+
                    "where checklist_pre_operasi.tanggal between ? and ? order by checklist_pre_operasi.tanggal ");
            }else{
                ps=koneksi.prepareStatement(
                    "select reg_periksa.no_rawat,pasien.no_rkm_medis,pasien.nm_pasien,pasien.tgl_lahir,pasien.jk,checklist_pre_operasi.tanggal,"+
                    "checklist_pre_operasi.sncn,checklist_pre_operasi.tindakan,checklist_pre_operasi.kd_pegawai_bedah,pegawaibedah.nm_pegawai as pegawaibedah,"+
                    "checklist_pre_operasi.kd_pegawai_anestesi,pegawaianestesi.nm_pegawai as pegawaianestesi,checklist_pre_operasi.identitas,"+
                    "checklist_pre_operasi.surat_ijin_bedah,checklist_pre_operasi.surat_ijin_anestesi,checklist_pre_operasi.surat_ijin_transfusi,"+
                    "checklist_pre_operasi.penandaan_area_operasi,checklist_pre_operasi.keadaan_umum,checklist_pre_operasi.pemeriksaan_penunjang_rontgen,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_rontgen,checklist_pre_operasi.pemeriksaan_penunjang_ekg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ekg,checklist_pre_operasi.pemeriksaan_penunjang_usg,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_usg,checklist_pre_operasi.pemeriksaan_penunjang_ctscan,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_ctscan,checklist_pre_operasi.pemeriksaan_penunjang_mri,"+
                    "checklist_pre_operasi.keterangan_pemeriksaan_penunjang_mri,checklist_pre_operasi.persiapan_darah,checklist_pre_operasi.keterangan_persiapan_darah,"+
                    "checklist_pre_operasi.perlengkapan_khusus,checklist_pre_operasi.nip_petugas_ruangan,petugasruangan.nama as petugasruangan,"+
                    "checklist_pre_operasi.nip_perawat_ok,petugasok.nama as petugasok "+
                    "from checklist_pre_operasi inner join reg_periksa on checklist_pre_operasi.no_rawat=reg_periksa.no_rawat "+
                    "inner join pasien on reg_periksa.no_rkm_medis=pasien.no_rkm_medis "+
                    "inner join pegawai as pegawaibedah on pegawaibedah.kd_pegawai=checklist_pre_operasi.kd_pegawai_bedah "+
                    "inner join pegawai as pegawaianestesi on pegawaianestesi.kd_pegawai=checklist_pre_operasi.kd_pegawai_anestesi "+
                    "inner join petugas as petugasruangan on petugasruangan.nip=checklist_pre_operasi.nip_petugas_ruangan "+
                    "inner join petugas as petugasok on petugasok.nip=checklist_pre_operasi.nip_perawat_ok "+
                    "where checklist_pre_operasi.tanggal between ? and ? and (reg_periksa.no_rawat like ? or pasien.no_rkm_medis like ? or "+
                    "pasien.nm_pasien like ? or pegawaibedah.nm_pegawai like ? or pegawaianestesi.nm_pegawai like ? or petugasruangan.nama like ?) "+
                    "order by checklist_pre_operasi.tanggal ");
            }
                
            try {
                if(TCari.getText().trim().equals("")){
                    ps.setString(1,Valid.SetTgl(DTPCari1.getSelectedItem()+"")+" 00:00:00");
                    ps.setString(2,Valid.SetTgl(DTPCari2.getSelectedItem()+"")+" 23:59:59");
                }else{
                    ps.setString(1,Valid.SetTgl(DTPCari1.getSelectedItem()+"")+" 00:00:00");
                    ps.setString(2,Valid.SetTgl(DTPCari2.getSelectedItem()+"")+" 23:59:59");
                    ps.setString(3,"%"+TCari.getText()+"%");
                    ps.setString(4,"%"+TCari.getText()+"%");
                    ps.setString(5,"%"+TCari.getText()+"%");
                    ps.setString(6,"%"+TCari.getText()+"%");
                    ps.setString(7,"%"+TCari.getText()+"%");
                    ps.setString(8,"%"+TCari.getText()+"%");
                }
                    
                rs=ps.executeQuery();
                while(rs.next()){
                    tabMode.addRow(new String[]{
                        rs.getString("no_rawat"),rs.getString("no_rkm_medis"),rs.getString("nm_pasien"),rs.getString("tgl_lahir"),rs.getString("jk"),
                        rs.getString("tanggal"),rs.getString("sncn"),rs.getString("tindakan"),rs.getString("kd_pegawai_bedah"),rs.getString("pegawaibedah"),
                        rs.getString("kd_pegawai_anestesi"),rs.getString("pegawaianestesi"),rs.getString("identitas"),rs.getString("keadaan_umum"),
                        rs.getString("penandaan_area_operasi"),rs.getString("surat_ijin_bedah"),rs.getString("surat_ijin_anestesi"),rs.getString("surat_ijin_transfusi"),
                        rs.getString("persiapan_darah"),rs.getString("keterangan_persiapan_darah"),rs.getString("perlengkapan_khusus"),rs.getString("pemeriksaan_penunjang_rontgen"),
                        rs.getString("keterangan_pemeriksaan_penunjang_rontgen"),rs.getString("pemeriksaan_penunjang_ekg"),rs.getString("keterangan_pemeriksaan_penunjang_ekg"),
                        rs.getString("pemeriksaan_penunjang_usg"),rs.getString("keterangan_pemeriksaan_penunjang_usg"),rs.getString("pemeriksaan_penunjang_ctscan"),
                        rs.getString("keterangan_pemeriksaan_penunjang_ctscan"),rs.getString("pemeriksaan_penunjang_mri"),rs.getString("keterangan_pemeriksaan_penunjang_mri"),
                        rs.getString("nip_petugas_ruangan"),rs.getString("petugasruangan"),rs.getString("nip_perawat_ok"),rs.getString("petugasok")
                    });
                }
            } catch (Exception e) {
                System.out.println("Notif : "+e);
            } finally{
                if(rs!=null){
                    rs.close();
                }
                if(ps!=null){
                    ps.close();
                }
            }
        }catch(Exception e){
            System.out.println("Notifikasi : "+e);
        }
        LCount.setText(""+tabMode.getRowCount());
    }
    
    public void emptTeks() {
        KodePetugas.setText("");
        NamaPetugas.setText("");
        PersiapanDarah.setSelectedIndex(0);
        KeteranganPersiapanDarah.setText("");
        PerlengkapanKhusus.setSelectedIndex(0);
    } 

    private void getData() {
        if(tbObat.getSelectedRow()!= -1){
            TNoRw.setText(tbObat.getValueAt(tbObat.getSelectedRow(),0).toString());
            TNoRM.setText(tbObat.getValueAt(tbObat.getSelectedRow(),1).toString());
            TPasien.setText(tbObat.getValueAt(tbObat.getSelectedRow(),2).toString());
            TglLahir.setText(tbObat.getValueAt(tbObat.getSelectedRow(),3).toString());
            Valid.SetTgl2(Tanggal,tbObat.getValueAt(tbObat.getSelectedRow(),5).toString());
        }
    }
    private void isRawat() {
         Sequel.cariIsi("select reg_periksa.no_rkm_medis from reg_periksa where reg_periksa.no_rawat='"+TNoRw.getText()+"' ",TNoRM);
    }

    private void isPsien() {
        Sequel.cariIsi("select pasien.nm_pasien from pasien where pasien.no_rkm_medis='"+TNoRM.getText()+"' ",TPasien);
        Sequel.cariIsi("select DATE_FORMAT(pasien.tgl_lahir,'%d-%m-%Y') from pasien where pasien.no_rkm_medis=? ",TglLahir,TNoRM.getText());
    }
    
    public void setNoRm(String norwt, Date tgl2) {
        TNoRw.setText(norwt);
        TCari.setText(norwt);
        Sequel.cariIsi("select reg_periksa.tgl_registrasi from reg_periksa where reg_periksa.no_rawat='"+norwt+"'", DTPCari1);
        DTPCari2.setDate(tgl2);
        isRawat();
        isPsien();
        ChkInput.setSelected(true);
        isForm();
    }
    
    public void setNoRm(String norwt, Date tgl2,String KodeDokter,String NamaDokter,String Operasi) {
        TNoRw.setText(norwt);
        TCari.setText(norwt);
        Sequel.cariIsi("select reg_periksa.tgl_registrasi from reg_periksa where reg_periksa.no_rawat='"+norwt+"'", DTPCari1);
        DTPCari2.setDate(tgl2);
        isRawat();
        isPsien();
        ChkInput.setSelected(true);
        isForm();
        KodePetugas.setText(KodeDokter);
        NamaPetugas.setText(NamaDokter);
    }
    
    private void isForm(){
        if(ChkInput.isSelected()==true){
            if(internalFrame1.getHeight()>558){
                ChkInput.setVisible(false);
                PanelInput.setPreferredSize(new Dimension(WIDTH,386));
                FormInput.setVisible(true);      
                ChkInput.setVisible(true);
            }else{
                ChkInput.setVisible(false);
                PanelInput.setPreferredSize(new Dimension(WIDTH,internalFrame1.getHeight()-172));
                FormInput.setVisible(true);      
                ChkInput.setVisible(true);
            }
        }else if(ChkInput.isSelected()==false){           
            ChkInput.setVisible(false);            
            PanelInput.setPreferredSize(new Dimension(WIDTH,20));
            FormInput.setVisible(false);      
            ChkInput.setVisible(true);
        }
    }
    
    public void isCek(){
        BtnSimpan.setEnabled(akses.getchecklist_pre_operasi());
        BtnHapus.setEnabled(akses.getchecklist_pre_operasi());
        BtnEdit.setEnabled(akses.getchecklist_pre_operasi());
        BtnPrint.setEnabled(akses.getchecklist_pre_operasi()); 
    }

    private void ganti() {
        
    }

    private void hapus() {
        if(Sequel.queryu2tf("delete from checklist_pre_operasi where no_rawat=? and tanggal=?",2,new String[]{
            tbObat.getValueAt(tbObat.getSelectedRow(),0).toString(),tbObat.getValueAt(tbObat.getSelectedRow(),5).toString()
        })==true){
            tabMode.removeRow(tbObat.getSelectedRow());
            LCount.setText(""+tabMode.getRowCount());
            emptTeks();
        }else{
            JOptionPane.showMessageDialog(null,"Gagal menghapus..!!");
        }
    }
}
