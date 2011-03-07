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
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void butReply_Click(object sender, EventArgs e)
        {
            new view.FormCompose().ShowDialog();
        }

        
    }
}
