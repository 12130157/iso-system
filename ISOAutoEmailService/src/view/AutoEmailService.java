package view;

import java.awt.AWTException;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.MenuItem;
import java.awt.PopupMenu;
import java.awt.Rectangle;
import java.awt.SystemTray;
import java.awt.Toolkit;
import java.awt.TrayIcon;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemListener;
import java.util.Timer;

import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.ListModel;
import javax.swing.ListSelectionModel;
import javax.swing.event.ListDataListener;

import common.Constant;

import controller.EmailServiceController;
import controller.ThongBao;

public class AutoEmailService extends JFrame {

	private static final long serialVersionUID = 1L;
	private JPanel jContentPane = null;
	private JCheckBox chkGiaoAnDelay = null;
	private JLabel lbTitle = null;
	private JCheckBox chkCongTacDelay = null;
	private JButton btRun = null;
	private JButton btHide = null;
	private JButton btExit = null;
	private JTextField txtStatus = null;
	private JComboBox cbGio = null;
	private JComboBox cbPhut = null;
	private final String [] listGio = new String[24];
	private final String [] listPhut = new String[60];
	private Timer timer = null;
	private ThongBao thongBao = new ThongBao();
	private JList listThongBao = null;
	
	public SystemTray tray = null ;  //  @jve:decl-index=0:
	public TrayIcon trayIcon = null;  //  @jve:decl-index=0:

	/**
	 * This is the default constructor
	 */
	public AutoEmailService() {
		super();
		initialize();
	}

	/**
	 * This method initializes this
	 * 
	 * @return void
	 */
	private void initialize() {
		//this.setSize(358, 247);
		this.setSize(600, 500);
		this.setContentPane(getJContentPane());
		this.setTitle("ISO Automail Service");
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		
		Dimension ScreenSize = Toolkit.getDefaultToolkit().getScreenSize();
		//setLocation((ScreenSize.width- 358)/2, (ScreenSize.height- 247)/2);
		setLocation((ScreenSize.width- 600)/2, (ScreenSize.height- 500)/2);
		setResizable(false);
		setVisible(true);
	}

	/**
	 * This method initializes jContentPane
	 * 
	 * @return javax.swing.JPanel
	 */
	/**
	 * @return
	 */
	private JPanel getJContentPane() {
		if (jContentPane == null) {
			lbTitle = new JLabel();
			lbTitle.setBounds(new Rectangle(34, 9, 600, 38));
			lbTitle.setFont(new Font("Dialog", Font.BOLD, 24));
			lbTitle.setForeground(new Color(51, 51, 171));
			lbTitle.setAlignmentX(CENTER_ALIGNMENT);
			lbTitle.setText("Hệ Thống Mail Nhắc Nhở");
			
			jContentPane = new JPanel();
			jContentPane.setLayout(null);
			jContentPane.add(getChkGiaoAnDelay(), null);
			jContentPane.add(lbTitle, null);
			jContentPane.add(getChkCongTacDelay(), null);
			jContentPane.add(getBtRun(), null);
			jContentPane.add(getBtHide(), null);
			jContentPane.add(getBtExit(), null);
			jContentPane.add(getTxtStatus(), null);
			jContentPane.add(getCbGio(),null);
			jContentPane.add(getCbPhut(),null);
			jContentPane.add(getListThongBao(),null);
		}
		return jContentPane;
	}

	/**
	 * This method initializes chkGiaoAnDelay	
	 * 	
	 * @return javax.swing.JCheckBox	
	 */
	private JCheckBox getChkGiaoAnDelay() {
		if (chkGiaoAnDelay == null) {
			chkGiaoAnDelay = new JCheckBox();
			chkGiaoAnDelay.setBounds(new Rectangle(198, 74, 117, 21));
			chkGiaoAnDelay.setText("Giáo án Delay");
		}
		return chkGiaoAnDelay;
	}

	/**
	 * This method initializes chkCongTacDelay	
	 * 	
	 * @return javax.swing.JCheckBox	
	 */
	private JCheckBox getChkCongTacDelay() {
		if (chkCongTacDelay == null) {
			chkCongTacDelay = new JCheckBox();
			chkCongTacDelay.setBounds(new Rectangle(19, 71, 153, 24));
			chkCongTacDelay.setText("Kế Hoạch Giảng Dạy");
			chkCongTacDelay.setEnabled(false);
		}
		return chkCongTacDelay;
	}

	/**
	 * This method initializes txtGio	
	 * 	asdasd
	 * @return javax.swing.JComboBox	
	 */
	private JComboBox getCbGio() {
		if (cbGio == null) {
			for (int i = 0; i < 24; i++) {
				listGio[i] = i+"";
			}
			cbGio = new JComboBox(listGio);
			cbGio.setBounds(new Rectangle(120, 210, 45, 25));
			cbGio.setSelectedIndex(6);
		}
		return cbGio;
	}
	
	/**
	 * This method initializes txtPhut	
	 * 	asdasd
	 * @return javax.swing.JComboBox	
	 */
	private JComboBox getCbPhut() {
		if (cbPhut == null) {
			for (int i = 0; i < 60; i++) {
				listPhut[i] = i+"";
			}
			cbPhut = new JComboBox(listPhut);
			cbPhut.setBounds(new Rectangle(180, 210, 45, 25));
			cbPhut.setSelectedIndex(0);
		}
		return cbPhut;
	}
	/**
	 * This method initializes btRun	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtRun() {
		if (btRun == null) {
			btRun = new JButton();
			btRun.setBounds(new Rectangle(11, 160, 77, 29));
			btRun.setText("Run");
			btRun.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					//txtStatus.setText("Service running ....");
					if (chkGiaoAnDelay.isSelected())
					{
						if(btRun.getText().equalsIgnoreCase("Run")){
							cbGio.setEnabled(false);
							cbPhut.setEnabled(false);
							EmailServiceController autoEmailService = new EmailServiceController(
									cbGio.getSelectedIndex()+"",cbPhut.getSelectedIndex()+"");
							timer = new Timer();
							timer.schedule(autoEmailService, 1000, 60000);
							txtStatus.setText("Running");
							btRun.setText("Stop");
						}else{
							timer.cancel();
							cbGio.setEnabled(true);
							cbPhut.setEnabled(true);
							txtStatus.setText("Stop");
							btRun.setText("Run");
						}
					}else
					{
						JOptionPane.showMessageDialog(null,"Bạn phải chọn công việc để thực thi.");
					}
				}
			});
		}
		return btRun;
	}

	/**
	 * This method initializes btHide	
	 * 	
	 * @return javax.swing.JButton	
	 */
	int test = 0;
	private JButton getBtHide() {
		if (btHide == null) {
			btHide = new JButton();
			btHide.setBounds(new Rectangle(130, 161, 77, 26));
			btHide.setText("Hide");
			btHide.addActionListener(new java.awt.event.ActionListener() {
			public void actionPerformed(java.awt.event.ActionEvent e) 
			{
				if ( test == 1)
				{
					tray.remove(trayIcon);
				}
				setVisible(false);
				// neu he dieu hanh ho tro tray icon thi chay if , nguoi lai thi chya else
				if(SystemTray.isSupported()) 
				{
					//bien test dung de kiem tra xem da co icon tren task bar hay chua 
					//neu co thi xoa icon cua , tao icon moi ten task bar
					test = 1;
					getTray();
				//neu he dieu hanh khong ho tro thu vien thi chay xuong dong else
				}else
				{
					System.err.println("Tray unavailable");
				}
			}});
		}
		return btHide;
	}

	/**
	 * This method initializes btExit	
	 * 	
	 * @return javax.swing.JButton	
	 */
	private JButton getBtExit() {
		if (btExit == null) {
			btExit = new JButton();
			btExit.setBounds(new Rectangle(255, 161, 59, 26));
			btExit.setText("Exit");
			btExit.addActionListener(new java.awt.event.ActionListener() {
				public void actionPerformed(java.awt.event.ActionEvent e) {
					exitTray();
				}
			});
		}
		return btExit;
	}

	/**
	 * This method initializes txtStatus	
	 * 	
	 * @return javax.swing.JTextField	
	 */
	private JTextField getTxtStatus() {
		if (txtStatus == null) {
			txtStatus = new JTextField();
			txtStatus.setBounds(new Rectangle(13, 113, 301, 25));
			txtStatus.setText("Ready");
			txtStatus.setEnabled(false);
		}
		return txtStatus;
	}
	
	private JList getListThongBao() {
		if (listThongBao == null) {
			listThongBao = new JList(Constant.model);
			listThongBao.setBounds(new Rectangle(0, 250, 0, 20));
			listThongBao.setSize(new Dimension(600, 200));
			listThongBao.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);
			listThongBao.setEnabled(true);
		}
		return listThongBao;
	}
	
/*	public class ShowMessageListener implements ActionListener
	  {
		    TrayIcon trayIcon;
		    String title;
		    String message;
		    TrayIcon.MessageType messageType;
		    ShowMessageListener(TrayIcon trayIcon,String title,String message,TrayIcon.MessageType messageType) 
		    {
		    	this.trayIcon = trayIcon;
			    this.title = title;
			    this.message = message;
			    this.messageType = messageType;
		    }
		    public void actionPerformed(ActionEvent e) 
		    {
		    	trayIcon.displayMessage(title, message, messageType);
		    }
	  }*/
	public void getTray()
	{
		//lay ra khay he thong ( teskbar)
		tray = SystemTray.getSystemTray();
		//tao 1 hinh anh.
		Image image = Toolkit.getDefaultToolkit().getImage("image/pic.png");
		//tao 1 popup khi bam chuot phai vào icon
		PopupMenu popup = new PopupMenu();
		//tao 1 trayicon , khi an xuong thanh taskbar
		//add iamge ,ten ,popup vao icon
		trayIcon = new TrayIcon(image, "ISO AutoEmail Service", popup);
		//tao su kien khi bam double click vao icon
		trayIcon.addActionListener(new java.awt.event.ActionListener() {
		public void actionPerformed(java.awt.event.ActionEvent e)
		{
			test = 1;
			setVisible(true);
		}});
		//tao menuitem	 OPEN	
		MenuItem itemOpen = new MenuItem("Open");
		//tao su kien cho menuitem OPEN
		itemOpen.addActionListener(new java.awt.event.ActionListener() {
		public void actionPerformed(java.awt.event.ActionEvent e)
		{
			test = 1;
			new AutoEmailService();
		}});
		//add item vao popup
		popup.add(itemOpen);
		//tao menuitem		EXIT
		MenuItem itemExit = new MenuItem("Exit");
		//tao su kiem cho menuitem EXIT
		itemExit.addActionListener(new ActionListener() {
		public void actionPerformed(ActionEvent e) 
		{
			exitTray();
		}});
		//add item vao popup
		popup.add(itemExit);
		
		//add trayIcon vao tray
		try{
			tray.add(trayIcon);
		}catch (AWTException ea) 	
		{
			System.err.println("Can't add to tray");
		}
	}
	
	public void exitTray()
	{
		int exit = JOptionPane.showConfirmDialog(null,"Bạn có chắc là muốn thoát khỏi chương trình không ?");
		if (exit == 0)
		{
			dispose();
			if (tray != null)
			{
				tray.remove(trayIcon);
			}
		}
	}

}  //  @jve:decl-index=0:visual-constraint="0,-69"
