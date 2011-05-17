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
        String lblCuPhap = "";
        int edit = 0;

        public FormManageKeyword()
        {
            InitializeComponent();
           loadGrid();
           LoadCbo();
        }

        #region functions

        public void loadGrid()
        {
            try
            {
                dlv_ManageKeyword.DataSource = CuPhapDAO.getAllDRVCuPhap();
            }
            catch (Exception)
            {
                
                throw;
            }
        }
        public void LoadCbo()
        {
            ArrayList arry = cuphapdao.getAllKeywordCuPhap();
            cbo_Name.Items.Clear();
            cbo_Name.Items.Add("All");
            foreach (CuPhapMODEL cuphap in arry)
            {
                cbo_Name.Items.Add(cuphap.Cum_Tu_1).ToString();
                //cbo_Keyword.Items.Add(cuphap.Cum_Tu_1).ToString();
            }
            cbo_Keyword.SelectedIndex = -1;
        }

        #endregion

        #region events

        private void but_Close_Click_1(object sender, EventArgs e)
        {
            if (MessageBox.Show("Ban có chắc là muốn thoát không! ","Warning",MessageBoxButtons.YesNo,MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                this.Close();
            }
        }

        // pour data into DataGridView
        private void FormManageKeyword_Load(object sender, EventArgs e)
        {
            loadGrid();
            lblYouChoose.Text = "Bạn chưa chọn dòng: ";
        }

        private void cbo_Name_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!cbo_Name.Text.Equals("All"))
            {
                edit = 1;
                cbo_Keyword.Items.Clear();
                cbo_Keyword.Text = "All";
                cbo_Keyword.Enabled = true;
                ArrayList arry = cuphapdao.getAllKeyword1CuPhap(cbo_Name.Text.ToString());
                cbo_Keyword.Items.Add("All");
                foreach (CuPhapMODEL cuphap in arry)
                {
                    cbo_Keyword.Items.Add(cuphap.Cum_Tu_2).ToString();
                }
                dlv_ManageKeyword.DataSource = CuPhapDAO.getTenDRVCuPhapByID(cbo_Name.Text.ToString(), cbo_Keyword.Text.ToString());

            }
            else
            {
                cbo_Keyword.Items.Clear();
                cbo_Keyword.Enabled = false;
                cbo_Keyword.Text = "All";
                dlv_ManageKeyword.DataSource = CuPhapDAO.getTenDRVCuPhapByID(cbo_Name.Text.ToString(), cbo_Keyword.Text.ToString());
            }
          
        }

        //click event in DataGridView
        
        //event add

        private void but_Add_Click(object sender, EventArgs e)
        {
            common.Constants.choose = 1;
            view.FormAddKey fr = new view.FormAddKey();
            fr.MdiParent=this.MdiParent;
            fr.Show();
        }

        private void but_Edit_Click(object sender, EventArgs e)
        {
            if (lblYouChoose.Text.Equals("") || common.Constants.id.Equals(""))
            {
                MessageBox.Show("Bạn chưa chọn dòng để chỉnh sửa. Vui lòng chọn lại: ");
            }
            else
            {
                edit = 1;
                common.Constants.choose = 2;
                lblYouChoose.Text = "Bạn chọn dòng: ";
                view.FormAddKey fr = new view.FormAddKey();
                fr.MdiParent = this.MdiParent;
                but_Edit.Enabled = false;
                but_Delete.Enabled = false;
                fr.Show();
            }
        }

        private void but_Delete_Click(object sender, EventArgs e)
        {
            try
            {
                if (lblYouChoose.Text.Equals("")|| common.Constants.id.Equals(""))
                {
                    MessageBox.Show("Bạn chưa chọn dòng để Xóa. Vui lòng chọn lại: ");
                }
                else
                {
                    if (MessageBox.Show(this, "Bạn có chắc là muốn xóa không?  ", " Thông báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                    {
                        Boolean result = cuphapdao.deleteCuPhap(Convert.ToInt32(common.Constants.id));
                        if (result.Equals(true))
                        {
                            if (edit == 1)
                            {
                                cbo_Keyword_SelectedIndexChanged(sender, e);
                                edit = 0;
                            }
                            else
                            {
                                loadGrid();
                                LoadCbo();
                                common.Constants.id = "";
                                lblYouChoose.Text = "Chọn Dòng: ";
                                but_Edit.Enabled = false;
                                but_Delete.Enabled = false;
                            }
                        }
                        else
                        {
                            MessageBox.Show("Không thể Xóa ");
                            loadGrid();
                            LoadCbo();
                        }
                    }
                    else
                    {
                        //LoadCbo();
                    }
                }
                lblYouChoose.Text = "Bạn chọn dòng: ";
            }
            catch (Exception ex)
            {
                MessageBox.Show(Convert.ToString(ex));
            }
            but_Edit.Enabled = false;
            but_Delete.Enabled = false;

        }
 
        #endregion

        private void cbo_Keyword_SelectedIndexChanged(object sender, EventArgs e)
        {
            edit = 1;
            dlv_ManageKeyword.DataSource = CuPhapDAO.getTenDRVCuPhapByID(cbo_Name.Text.ToString(), cbo_Keyword.Text.ToString());
        }

        private void dlv_ManageKeyword_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            common.Constants.id = dlv_ManageKeyword.CurrentRow.Cells["Ma cu phap"].Value.ToString();
            lblCuPhap = dlv_ManageKeyword.CurrentRow.Cells["Cu phap"].Value.ToString();
            lblYouChoose.Text = "Bạn chọn dòng có Ma Cú pháp là: " + common.Constants.id  + " Cú pháp là: " + lblCuPhap;
            
            but_Delete.Enabled = true;
            but_Edit.Enabled = true;

        }

        private void FormManageKeyword_Activated(object sender, EventArgs e)
        {
            if (edit == 1)
            {
                cbo_Keyword_SelectedIndexChanged(sender, e);
                edit = 0;
                lblYouChoose.Text = "Bạn chọn dòng: ";
            }
            else
            {
                FormManageKeyword_Load(sender, e);
                //LoadCbo();
            }
        }
      
    }
}
