package loginSystem;

import java.awt.EventQueue;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.border.EmptyBorder;

/**
 * User Registration using Swing
 * 
 * @author javaguides.net
 *
 */
public class Register extends JFrame {
	private static final long serialVersionUID = 1L;
	private JPanel contentPane;
	private JTextField firstname;
	private JTextField lastname;
	private JTextField dateOfBirth;
	private JTextField email;
	private JTextField mob;
	private JPasswordField passwordField;
	private JButton btnNewButton;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					Register frame = new Register();
					frame.setTitle("Registration");
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */

	public Register() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(450, 190, 1014, 597);
		setResizable(false);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);

		JLabel lblNewUserRegister = new JLabel("New User Register");
		lblNewUserRegister.setFont(new Font("Times New Roman", Font.PLAIN, 42));
		lblNewUserRegister.setBounds(362, 52, 325, 50);
		contentPane.add(lblNewUserRegister);

		JLabel lblName = new JLabel("First name");
		lblName.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblName.setBounds(58, 152, 99, 43);
		contentPane.add(lblName);

		JLabel lblNewLabel = new JLabel("Last name");
		lblNewLabel.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblNewLabel.setBounds(58, 243, 110, 29);
		contentPane.add(lblNewLabel);

		JLabel lblDateOfBirth = new JLabel("Date\r\n of Birth");
		lblDateOfBirth.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblDateOfBirth.setBounds(58, 324, 124, 36);
		contentPane.add(lblDateOfBirth);

		firstname = new JTextField();
		firstname.setFont(new Font("Tahoma", Font.PLAIN, 32));
		firstname.setBounds(214, 151, 228, 50);
		contentPane.add(firstname);
		firstname.setColumns(10);

		lastname = new JTextField();
		lastname.setFont(new Font("Tahoma", Font.PLAIN, 32));
		lastname.setBounds(214, 235, 228, 50);
		contentPane.add(lastname);
		lastname.setColumns(10);

		dateOfBirth = new JTextField();

		dateOfBirth.setFont(new Font("Tahoma", Font.PLAIN, 32));
		dateOfBirth.setBounds(214, 320, 228, 50);
		contentPane.add(dateOfBirth);
		dateOfBirth.setColumns(10);

		JLabel lblEmailAddress = new JLabel("Email");
		lblEmailAddress.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblEmailAddress.setBounds(542, 159, 99, 29);
		contentPane.add(lblEmailAddress);

		JLabel lblPassword = new JLabel("Password");
		lblPassword.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblPassword.setBounds(542, 245, 99, 24);
		contentPane.add(lblPassword);

		JLabel lblMobileNumber = new JLabel("Mobile number");
		lblMobileNumber.setFont(new Font("Tahoma", Font.PLAIN, 20));
		lblMobileNumber.setBounds(542, 329, 139, 26);
		contentPane.add(lblMobileNumber);

		email = new JTextField();
		email.setFont(new Font("Tahoma", Font.PLAIN, 32));
		email.setBounds(707, 151, 228, 50);
		contentPane.add(email);
		email.setColumns(10);

		mob = new JTextField();
		mob.setFont(new Font("Tahoma", Font.PLAIN, 32));
		mob.setBounds(707, 320, 228, 50);
		contentPane.add(mob);
		mob.setColumns(10);

		passwordField = new JPasswordField();
		passwordField.setFont(new Font("Tahoma", Font.PLAIN, 32));
		passwordField.setBounds(707, 235, 228, 50);
		contentPane.add(passwordField);

		btnNewButton = new JButton("Register");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				String first_name = firstname.getText();
				String last_name = lastname.getText();
				String emailId = email.getText();

				String date1 = dateOfBirth.getText();
				SimpleDateFormat formatter1 = new SimpleDateFormat("yyyy-mm-dd");
				java.sql.Date dateofbirth = null;
				try {
					java.util.Date dateofbirth1 = formatter1.parse(date1);
					dateofbirth = new java.sql.Date(dateofbirth1.getTime());
				} catch (ParseException e1) {
// TODO Auto-generated catch block
					e1.printStackTrace();
				}

				String mobileNumber = mob.getText();
				int len = mobileNumber.length();
				String password = passwordField.getText();

				String msg = "" + first_name;
				msg += " \n";
				if (len != 10) {
					JOptionPane.showMessageDialog(btnNewButton, "Enter a valid mobile number");
				}

				try {
					String url = "jdbc:sqlserver://SD2316\\SQLEXPRESS;databaseName=nursingHome;integratedSecurity=true";
					Connection con = DriverManager.getConnection(url);

					String query = "INSERT INTO Users([first_name]\r\n"
							+ "      ,[last_name]\r\n"
							+ "      ,[email]\r\n"
							+ "      ,[phone]\r\n"
							+ "      ,[dateOfBirth]\r\n"
							+ "      ,[password]) values('" + first_name + "','"
							+ last_name + "','" + emailId + "','" + mobileNumber + "','" + dateofbirth + "','" + password
							+ "')";

					Statement sta = con.createStatement();
					int x = sta.executeUpdate(query);
					if (x == 0) {
						JOptionPane.showMessageDialog(btnNewButton, "This is alredy exist");
					} else {
						JOptionPane.showMessageDialog(btnNewButton,
								"Welcome, " + msg + "Your account is sucessfully created");
					}
					con.close();
				} catch (Exception exception) {
					exception.printStackTrace();
				}
			}
		});
		btnNewButton.setFont(new Font("Tahoma", Font.PLAIN, 22));
		btnNewButton.setBounds(399, 447, 259, 74);
		contentPane.add(btnNewButton);
	}
}