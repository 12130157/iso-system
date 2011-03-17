using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS
{
    public partial class FormInbox : Form
    {
        public FormInbox()
        {
            InitializeComponent();
            showSyntaxMess();
        }
        public void showSyntaxMess()
        {
            DataTable tableSyntaxMess = HopThuDenDAO.getAllSyntaxMess();
            tblSyntaxMess.DataSource = tableSyntaxMess;
        }
    }
}
