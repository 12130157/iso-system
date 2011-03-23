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
           //loadComBo();
        }

        #region functions

        public void loadGrid()
        {
            dlv_ManageKeyword.DataSource = CuPhapDAO.getAllDRVCuPhap();
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

        //click event in DataGridView
        private void dlv_ManageKeyword_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            common.Constants.i = dlv_ManageKeyword.CurrentRow.Cells["ID"].Value.ToString();
            lblYouChoose.Text="You Choose, ID: " + common.Constants.i;
        }
          
        //event add
        private void but_Add_Click(object sender, EventArgs e)
        {
            common.Constants.chooce = 1;
            this.Visible = false;
            view.FormAddKey fr = new view.FormAddKey();
            fr.MdiParent=this.MdiParent;
            fr.Focus();
            fr.Show();
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            common.Constants.chooce = 2;
            view.FormAddKey fr = new view.FormAddKey();
            fr.MdiParent = this.MdiParent;
            this.Visible = false;
            fr.Show();
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            if (common.Constants.i.Equals(""))
            {
                MessageBox.Show("You may choose to delete the line. Plesae choose again ");
            }
            else
            {
                String result1 = Convert.ToString(MessageBox.Show("Do you want to Deleting? ", "Important Question", MessageBoxButtons.YesNo));
                if (result1.Equals("Yes"))
                {
                    Boolean result = cuphapdao.deleteCuPhap(Convert.ToInt32(common.Constants.i));
                    if (result.Equals(true))
                    {
                        MessageBox.Show("Deleting susseccfull!!! ");
                        loadGrid();
                        common.Constants.i = "";
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

        private void but_Refresh_Click(object sender, EventArgs e)
        {

        } 

        #endregion

       

                      
    }
}
