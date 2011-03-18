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
            showSyntaxMessInbox();
            showNormalMessInbox();
        }
        public void showSyntaxMessInbox()
        {
            DataTable tableSyntaxMessInbox = HopThuDenDAO.getAllSyntaxMessInbox();
            tblSyntaxMess.DataSource = tableSyntaxMessInbox;
        }
        public void showNormalMessInbox()
        {
            DataTable tableNormalMessInbox = HopThuDenDAO.getAllNormalMessInbox();
            tblNormalMess.DataSource = tableNormalMessInbox;
        }
    }
}
