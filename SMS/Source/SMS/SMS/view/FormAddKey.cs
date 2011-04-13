
﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using SMS.common;

namespace SMS.view
{
    public partial class FormAddKey : Form
    {
        public FormAddKey()
        {
            InitializeComponent();
        }

        #region

        CuPhapMODEL cuPhapModel = new CuPhapMODEL();
        CuPhapDAO cuphapDao = new CuPhapDAO();
        FormManageKeyword fomKeyword = new FormManageKeyword();
        Validattion validates = new Validattion();
        Boolean kq = false;

        #endregion
       
        #region Function Xu ly

            private void checkform()
        {
            if (txt_Name.Text.Equals(""))
            {
                MessageBox.Show("Name not empty, plase enter Name: ");
            }
            else if (!validates.IsAlphaNumeric(txt_Name.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Name: ");
            }
            else if (txtKeyword1.Text.Equals(""))
            {
                MessageBox.Show("Keyword 1 not empty, plase enter Keyword: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword1.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 1: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword2.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 2: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword3.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 3: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword4.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 4: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword5.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 5: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword6.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 6: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword7.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 7: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword8.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 8: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword9.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 9: ");
            }
            else if (!validates.IsAlphaNumeric(txtKeyword10.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 10: ");
            }
            else if (txt_Note.Text.Equals(""))
            {
                MessageBox.Show("Note not empty, plase enter Note: ");
            }
            else if (!validates.IsAlphaNumeric(txt_Note.Text))
            {
                MessageBox.Show("Only wrap up the letterpress and number,plase enter Note: ");
            }
            else
            {
                kq = true;
            }
        }

            private void FormAddKey_Load(object sender, EventArgs e)
        {
            if (common.Constants.choose.Equals(1))
            {
                lbl_TitleKeyword.Text = "New Keyword";
                but_Add.Text = "Add";
                common.Constants.choose = 0;
                txtID.Enabled = false;
                txt_Name.Focus();
            }
            else if (common.Constants.choose.Equals(2))
            {
                lbl_TitleKeyword.Text = "Edit Keyword";
                but_Add.Text = "Apply";
                txtID.Enabled = false;
                loaddata();
                txt_Name.Focus();
                common.Constants.choose = 0;
            }
        }

            private void clear()
            {
                txtID.Text = "";
                txt_Name.Text = "";
                txtKeyword1.Text = "";
                txtKeyword2.Text = "";
                txtKeyword3.Text = "";
                txtKeyword4.Text = "";
                txtKeyword5.Text = "";
                txtKeyword6.Text = "";
                txtKeyword7.Text = "";
                txtKeyword8.Text = "";
                txtKeyword9.Text = "";
                txtKeyword10.Text = "";
                txt_Note.Text = "";
                txt_Name.Focus();

            }

            private void loaddata()
            {
                cuPhapModel = cuphapDao.getCuPhapByID(Convert.ToInt32(common.Constants.id));
                txtID.Text = cuPhapModel.Id;
                txt_Name.Text = cuPhapModel.Ten;
                txtKeyword1.Text = cuPhapModel.Cum_Tu_1;
                txtKeyword2.Text = cuPhapModel.Cum_Tu_2;
                txtKeyword3.Text = cuPhapModel.Cum_Tu_3;
                txtKeyword4.Text = cuPhapModel.Cum_Tu_4;
                txtKeyword5.Text = cuPhapModel.Cum_Tu_5;
                txtKeyword6.Text = cuPhapModel.Cum_Tu_6;
                txtKeyword7.Text = cuPhapModel.Cum_Tu_7;
                txtKeyword8.Text = cuPhapModel.Cum_Tu_8;
                txtKeyword9.Text = cuPhapModel.Cum_Tu_9;
                txtKeyword10.Text = cuPhapModel.Cum_Tu_10;
                txt_Note.Text = cuPhapModel.Ghi_Chu;
                common.Constants.id = "";
            }

        #endregion

        #region xu kien Double Click

            private void but_Close_Click(object sender, EventArgs e)
            {
                this.Close();
                fomKeyword.MdiParent = this.MdiParent;
                fomKeyword.Show();
                this.Close();
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                if (but_Add.Text.Equals("Add"))
                {
                    cuPhapModel.Ten = txt_Name.Text.ToString();
                    cuPhapModel.Cum_Tu_1 = txtKeyword1.Text.ToString();
                    cuPhapModel.Cum_Tu_2 = txtKeyword2.Text.ToString();
                    cuPhapModel.Cum_Tu_3 = txtKeyword3.Text.ToString();
                    cuPhapModel.Cum_Tu_4 = txtKeyword4.Text.ToString();
                    cuPhapModel.Cum_Tu_5 = txtKeyword5.Text.ToString();
                    cuPhapModel.Cum_Tu_6 = txtKeyword6.Text.ToString();
                    cuPhapModel.Cum_Tu_7 = txtKeyword7.Text.ToString();
                    cuPhapModel.Cum_Tu_8 = txtKeyword8.Text.ToString();
                    cuPhapModel.Cum_Tu_9 = txtKeyword9.Text.ToString();
                    cuPhapModel.Cum_Tu_10 = txtKeyword10.Text.ToString();
                    cuPhapModel.Ghi_Chu = txt_Note.Text.ToString();
                    CuPhapDAO cuphapDAO = new CuPhapDAO();
                    Boolean result = cuphapDAO.insertCuPhap(cuPhapModel);
                    if (result == true)
                    {
                        if (MessageBox.Show(this, "Do you want to continue to add new?  ", " Notice ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        { clear(); }
                        else
                        {
                            fomKeyword.MdiParent = this.MdiParent;
                            fomKeyword.Show();
                            this.Close();
                        }
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Insert failed");
                    }
                }

                else if (but_Add.Text.Equals("Apply"))
                {
                    cuPhapModel.Id = txtID.Text.Trim();
                    cuPhapModel.Ten = txt_Name.Text.ToString();
                    cuPhapModel.Cum_Tu_1 = txtKeyword1.Text.ToString();
                    cuPhapModel.Cum_Tu_2 = txtKeyword2.Text.ToString();
                    cuPhapModel.Cum_Tu_3 = txtKeyword3.Text.ToString();
                    cuPhapModel.Cum_Tu_4 = txtKeyword4.Text.ToString();
                    cuPhapModel.Cum_Tu_5 = txtKeyword5.Text.ToString();
                    cuPhapModel.Cum_Tu_6 = txtKeyword6.Text.ToString();
                    cuPhapModel.Cum_Tu_7 = txtKeyword7.Text.ToString();
                    cuPhapModel.Cum_Tu_8 = txtKeyword8.Text.ToString();
                    cuPhapModel.Cum_Tu_9 = txtKeyword9.Text.ToString();
                    cuPhapModel.Cum_Tu_10 = txtKeyword10.Text.ToString();
                    cuPhapModel.Ghi_Chu = txt_Note.Text.ToString();
                    Boolean result = cuphapDao.updateCuPhap(cuPhapModel);
                    if (result == true)
                    {
                        fomKeyword.MdiParent = this.MdiParent;
                        fomKeyword.Show();
                        this.Close();
                    }
                    else
                    {
                        DialogResult mess = MessageBox.Show("Update failed");
                    }
                }
            }

        #endregion


       
    }
}
