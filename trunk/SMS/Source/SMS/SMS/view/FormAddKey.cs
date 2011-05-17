
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

        #region Khai bao bien
        
        CuPhapMODEL cuPhapModel = new CuPhapMODEL();
        CuPhapDAO cuphapDao = new CuPhapDAO();
        FormManageKeyword fomKeyword = new FormManageKeyword();
        Validattion validates = new Validattion();
        ////Boolean kq = false;

        #endregion
       
        #region Function Xu ly

        //    private void checkform()
        //{
        //    if (txt_Name.Text.Equals(""))
        //    {
        //        MessageBox.Show("Name not empty, plase enter Name: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txt_Name.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Name: ");
        //    }
        //    else if (txtKeyword1.Text.Equals(""))
        //    {
        //        MessageBox.Show("Keyword 1 not empty, plase enter Keyword: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword1.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 1: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword2.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 2: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword3.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 3: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword4.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 4: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword5.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 5: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword6.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 6: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword7.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 7: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword8.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 8: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword9.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 9: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txtKeyword10.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Keyword 10: ");
        //    }
        //    else if (txt_Note.Text.Equals(""))
        //    {
        //        MessageBox.Show("Note not empty, plase enter Note: ");
        //    }
        //    else if (!validates.IsAlphaNumeric(txt_Note.Text))
        //    {
        //        MessageBox.Show("Only wrap up the letterpress and number,plase enter Note: ");
        //    }
        //    else
        //    {
        //        kq = true;
        //    }
        //}

            private void FormAddKey_Load(object sender, EventArgs e)
            {
                if (common.Constants.choose.Equals(1))
                {
                    lbl_TitleKeyword.Text = "Thêm Mới Cú Pháp";
                    but_Add.Text = "Thêm";
                    common.Constants.choose = 0;
                    txtID.Enabled = false;
                    txt_Name.Enabled = true;
                    txt_Name.Focus();
                }
                else if (common.Constants.choose.Equals(2))
                {
                    lbl_TitleKeyword.Text = "Cập Nhật Cú Pháp";
                    but_Add.Text = "Cập Nhật";
                    txtID.Enabled = false;
                    loaddata();
                    txt_Name.Enabled = true;
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

            private void enabled()
            {
                txtID.Enabled = false;
                //txt_Name.Enabled = false;
                txtKeyword1.Enabled = false;
                txtKeyword2.Enabled = false;
                txtKeyword3.Enabled = false;
                txtKeyword4.Enabled = false;
                txtKeyword5.Enabled = false;
                txtKeyword6.Enabled = false;
                txtKeyword7.Enabled = false;
                txtKeyword8.Enabled = false;
                txtKeyword9.Enabled = false;
                txtKeyword10.Enabled = false;
                txt_Note.Enabled = false;
            }

            private void loaddata()
            {
                try
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
                    if (!txtKeyword1.Text.Equals(""))
                    {
                        txtKeyword1.Enabled = true;
                        if (!txtKeyword2.Text.Equals(""))
                        {
                            txtKeyword2.Enabled = true;
                            if (!txtKeyword3.Text.Equals(""))
                            {
                                txtKeyword3.Enabled = true;
                                if (!txtKeyword4.Text.Equals(""))
                                {
                                    txtKeyword4.Enabled = true;
                                    if (!txtKeyword5.Text.Equals(""))
                                    {
                                        txtKeyword5.Enabled = true;
                                        if (!txtKeyword6.Text.Equals(""))
                                        {
                                            txtKeyword6.Enabled = true;
                                            if (!txtKeyword7.Text.Equals(""))
                                            {
                                                txtKeyword7.Enabled = true;
                                                if (!txtKeyword8.Text.Equals(""))
                                                {
                                                    txtKeyword9.Enabled = true;
                                                    if (!txtKeyword10.Text.Equals(""))
                                                    {
                                                        txtKeyword10.Enabled = true;
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    if (!txt_Name.Text.Equals(""))
                    {
                        txt_Note.Enabled = true;
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(Convert.ToString(ex));
                    Hide();
                }
            }

        #endregion

        #region xu kien Double Click

            private void but_Close_Click(object sender, EventArgs e)
            {
                if (MessageBox.Show("Bạn có chắc là muốn thoát không? ","Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning)== DialogResult.Yes)
                {
                    this.Close();
                }
            }

            private void but_Add_Click(object sender, EventArgs e)
            {
                try
                {
                    if (but_Add.Text.Equals("Thêm"))
                    {
                        try
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

                            Boolean result = cuphapDao.insertCuPhap(cuPhapModel);
                            if (result == true)
                            {
                                if (MessageBox.Show(this, "Bạn có muốn tiếp tục thêm mới không?  ", " Thông Báo ", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                                { clear(); }
                                else
                                {
                                    //fomKeyword.MdiParent = this.MdiParent;
                                    //fomKeyword.Show();
                                    this.Visible = false;
                                }
                            }
                            else
                            {
                                DialogResult mess = MessageBox.Show("Thêm mới thất bại");
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(Convert.ToString(ex));
                        }
                    }

                    else if (but_Add.Text.Equals("Cập Nhật"))
                    {
                        try
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
                            if (MessageBox.Show("bạn có muốn cập nhật? ", "Thông Báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                            {
                                Boolean result = cuphapDao.updateCuPhap(cuPhapModel);
                                if (result == true)
                                {
                                    //fomKeyword.MdiParent = this.MdiParent;
                                    //fomKeyword.Show();
                                    this.Visible = false;
                                }
                                else
                                {
                                    DialogResult mess = MessageBox.Show("Cập nhật thất bại");
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(Convert.ToString(ex));
                        }
                    }
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }

        #endregion

           #region xu kien
            private void txtKeyword1_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword1.Text.Equals(""))
                {
                    txtKeyword2.Text = "";
                    txtKeyword2.Enabled = false;
                    txtKeyword2_TextChanged(sender, e);
                }
                else { txtKeyword2.Enabled = true; }
            }

            private void txtKeyword2_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword2.Text.Equals(""))
                {
                    txtKeyword3.Text = "";
                    txtKeyword3.Enabled = false;
                    txtKeyword3_TextChanged(sender, e);
                }
                else { txtKeyword3.Enabled = true; }
            }

            private void txtKeyword3_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword3.Text.Equals(""))
                {
                    txtKeyword4.Text = "";
                    txtKeyword4.Enabled = false;
                    txtKeyword4_TextChanged(sender, e);
                }
                else { txtKeyword4.Enabled = true; }
            }

            private void txtKeyword4_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword4.Text.Equals(""))
                {
                    txtKeyword5.Text = "";
                    txtKeyword5.Enabled = false;
                    txtKeyword5_TextChanged(sender, e);
                }
                else { txtKeyword5.Enabled = true; }
            }

            private void txtKeyword5_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword5.Text.Equals(""))
                {
                    txtKeyword6.Text = "";
                    txtKeyword6.Enabled = false;
                    txtKeyword6_TextChanged(sender, e);
                }
                else { txtKeyword6.Enabled = true; }
            }

            private void txtKeyword6_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword6.Text.Equals(""))
                {
                    txtKeyword7.Text = "";
                    txtKeyword7.Enabled = false;
                    txtKeyword7_TextChanged(sender, e);
                }
                else { txtKeyword7.Enabled = true; }
            }

            private void txtKeyword7_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword7.Text.Equals(""))
                {
                    txtKeyword8.Text = "";
                    txtKeyword8.Enabled = false;
                    txtKeyword8_TextChanged(sender, e);
                }
                else { txtKeyword8.Enabled = true; }
            }

            private void txtKeyword8_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword8.Text.Equals(""))
                {
                    txtKeyword9.Text = "";
                    txtKeyword9.Enabled = false;
                    txtKeyword9_TextChanged(sender, e);
                }
                else
                {
                    txtKeyword9.Enabled = true;
                }
            }

            private void txtKeyword9_TextChanged(object sender, EventArgs e)
            {
                if (txtKeyword9.Text.Equals(""))
                {
                    txtKeyword10.Text = "";
                    txtKeyword10.Enabled = false;
                }
                else
                {
                    txtKeyword10.Enabled = true;
                }
            }

            private void txt_Name_TextChanged(object sender, EventArgs e)
            {
                if (txt_Name.Text.Equals(""))
                {
                    clear();
                    enabled();
                }
                else
                {
                    txtKeyword1.Enabled = true;
                    txt_Note.Enabled = true;
                }
            }
           #endregion

            //public bool ValidEmailAddress(string emailAddress, out string errorMessage)
            //{
            //    // Confirm that the e-mail address string is not empty.
            //    if (emailAddress.Length == 0)
            //    {
            //        errorMessage = "e-mail address is required.";
            //        return false;
            //    }

            //    // Confirm that there is an "@" and a "." in the e-mail address, and in the correct order.
            //    if (emailAddress.IndexOf("@") > -1)
            //    {
            //        if (emailAddress.IndexOf(".", emailAddress.IndexOf("@")) > emailAddress.IndexOf("@"))
            //        {
            //            errorMessage = "";
            //            return true;
            //        }
            //    }

            //    errorMessage = "e-mail address must be valid e-mail address format.\n" +
            //       "For example 'someone@example.com' ";
            //    return false;
            //}

    }
}
