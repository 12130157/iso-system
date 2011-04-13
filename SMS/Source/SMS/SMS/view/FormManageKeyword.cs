using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.model;
using SMS.dao;
using System.Collections;

namespace SMS
{
    public partial class FormManageKeyword : Form
    {
        CuPhapMODEL cuphapmodel = new CuPhapMODEL();
        CuPhapDAO cuphapdao = new CuPhapDAO();

        public FormManageKeyword()
        {
            InitializeComponent();
           loadGrid();
           LoadCbo();
        }

        #region functions

        public void loadGrid()
        {
            dlv_ManageKeyword.DataSource = CuPhapDAO.getAllDRVCuPhap();
        }
        public void LoadCbo()
        {
            ArrayList arry = cuphapdao.getAllTenKeywordCuPhap();
            cbo_Name.Items.Add("");
            //cbo_Keyword.Items.Add("");
            foreach (CuPhapMODEL cuphap in arry)
            {
                cbo_Name.Items.Add(cuphap.Ten).ToString();
                //cbo_Keyword.Items.Add(cuphap.Cum_Tu_1).ToString();
            }
            
        }

        #endregion

        #region events

        private void but_Close_Click_1(object sender, EventArgs e)
        {
            this.Close();
        }

        // pour data into DataGridView
        private void FormManageKeyword_Load(object sender, EventArgs e)
        {
            loadGrid();
        }

        private void cbo_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbo_Keyword.Items.Clear();
            cbo_Keyword.Text = "";
            ArrayList arry = cuphapdao.getAllKeyword1CuPhap(cbo_Name.Text.ToString());
            cbo_Keyword.Items.Add("");
            foreach (CuPhapMODEL cuphap in arry)
            {
                cbo_Keyword.Items.Add(cuphap.Cum_Tu_1).ToString();
            }
            dlv_ManageKeyword.DataSource = CuPhapDAO.getTenDRVCuPhapByID(cbo_Name.Text.ToString(),cbo_Keyword.Text.ToString());

        }

        //click event in DataGridView
        
          
        //event add
        private void but_Add_Click(object sender, EventArgs e)
        {
            common.Constants.choose = 1;
            this.Visible = false;
            view.FormAddKey fr = new view.FormAddKey();
            fr.MdiParent=this.MdiParent;
            fr.Focus();
            fr.Show();
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            if (lblYouChoose.Text.Equals(""))
            {
                MessageBox.Show("You may choose to edit the line. Plesae choose again ");
            }
            else
            {
                common.Constants.choose = 2;
                view.FormAddKey fr = new view.FormAddKey();
                fr.MdiParent = this.MdiParent;
                this.Visible = false;
                fr.Show();
            }
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            if (lblYouChoose.Text.Equals(""))
            {
                MessageBox.Show("You may choose to delete the line. Plesae choose again ");
            }
            else
            {
                if (MessageBox.Show(this, "Do you want deleted?  ", " Notice ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    Boolean result = cuphapdao.deleteCuPhap(Convert.ToInt32(common.Constants.id));
                    if (result.Equals(true))
                    {
                        loadGrid();
                        common.Constants.id = "";
                        lblYouChoose.Text = "Choose Row: ";
                    }
                    else
                    {
                        MessageBox.Show("Deleting failed!!! ");
                    }
                }
                else
                {
                    loadGrid();
                }
            }

        }
 
        #endregion

        private void cbo_Keyword_SelectedIndexChanged(object sender, EventArgs e)
        {
            dlv_ManageKeyword.DataSource = CuPhapDAO.getTenDRVCuPhapByID(cbo_Name.Text.ToString(), cbo_Keyword.Text.ToString());
        }

        private void dlv_ManageKeyword_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            common.Constants.id = dlv_ManageKeyword.CurrentRow.Cells["ID"].Value.ToString();
            lblYouChoose.Text = "You Choose, ID: " + common.Constants.id;
        }

     
             
    }
}
