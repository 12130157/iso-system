﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS
{
    public partial class FormInboxDeleted : Form
    {
        public FormInboxDeleted()
        {
            InitializeComponent();
        }

        private void but_Close_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
