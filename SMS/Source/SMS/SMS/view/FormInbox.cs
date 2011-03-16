using System;
using System.Collections.Generic;
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
            dloadGrid();
        }
        public void showSyntaxMess()
        { 
            
        }

        //private void FormInbox_Load(object sender, EventArgs e)
        //{
        //    // TODO: This line of code loads data into the 'gSMDataSet.HopThuDen' table. You can move, or remove it, as needed.
        //    this.hopThuDenTableAdapter.Fill(this.gSMDataSet.HopThuDen);

        //}
        private void dloadGrid()
        {
            tblSyntaxMess.DataSource = HopThuDenDAO.getAllSyntaxMess();
        }
    }
}
