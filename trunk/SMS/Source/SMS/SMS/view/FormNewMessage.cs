using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS.view
{
    public partial class FormNewMessage : Form
    {
        public FormNewMessage(int newMess)
        {
            InitializeComponent();
            dataBridVwNewMess.DataSource = HopThuDenDAO.getNewMessInbox(newMess);
        }

        private void dataBridVwNewMess_CellMouseDoubleClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            new FormInbox().Show();
        }
    }
}
