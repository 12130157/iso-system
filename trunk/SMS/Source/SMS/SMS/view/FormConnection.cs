using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.util;

namespace SMS.view
{
    public partial class FormConnection : Form
    {
        public FormConnection()
        {
            InitializeComponent();
            util.GSMUtil.connectGSM(1,9600,1500);
        }
    }
}
