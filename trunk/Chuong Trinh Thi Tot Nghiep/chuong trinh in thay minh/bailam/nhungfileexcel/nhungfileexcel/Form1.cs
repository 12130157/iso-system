using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO;

namespace nhungfileexcel
{
    public partial class frmindiem : Form
    {
        OleDbConnection Conn_Excel = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;data source=D:\\Data.XLS;Extended Properties=Excel 8.0;");
        //OleDbConnection Conn_Access = new OleDbConnection();
        OleDbConnection Conn_Access = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;data source=D:\\bangdiem.mdb");
        //OleDbConnection Conn_Access = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;data source=" + Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb"));
        bool thoigian = false;
        string ngay;
        string thang;
        string nam;
        string cathi;
        string nghe;
        string monthi;
        string giothi;
        string ngaythi;
        string tam;
        string socau;
        string strbatdau;
        string strketthuc;
        string thoigianlambai;
        string strtenhv="";
        bailam bl = new bailam();
        string masinhvien;
        bool trangthai;
        string duongdan;
        string strconn;
        string tenfile;
        public frmindiem()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            ///////////////////////////////////////////////////////////////////////////////////////////
            /*FileInfo fi = new FileInfo("d:\\bangdiem.mdb");
            if (!fi.Exists)
            {
                File.Copy(Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb"), "d:\\bangdiem.mdb",true);
            }
            Conn_Access.ConnectionString="provider=Microsoft.Jet.OLEDB.4.0;data source=d:\\bangdiem.mdb";*/
            //fi.CopyTo("c:\\luu");
            if (Conn_Access.State == 0) Conn_Access.Open();
            
            //////////////////////////////////////////////////////////////////////////////////////////
            //duongdan = Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb");
            //MessageBox.Show(duongdan);
            //strconn = "provider=Microsoft.Jet.OLEDB.4.0;data source"+duongdan;
            //Conn_Access.ConnectionString = strconn;
            
            trangthai = false;
            //getdulieu();
            dakyten();
            chuakyten();
            getmonthi();
            getnghe();
            getcathi();
            trangthai = true;
            //////////////////////////////////////////////////////////////
            if (cbonghe.SelectedIndex < 0) return;
            string manghe = cbonghe.SelectedValue.ToString();
            string str = "select * from " + manghe;
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            txttongsothisinhduthi.Text = dt.Rows.Count.ToString();
            /////////////////////////////////////////////////////////////
            tenfile = getfile();
            opf.FileName = tenfile;
            string str11 = "provider=Microsoft.Jet.OLEDB.4.0;data source=" + opf.FileName + ";Extended Properties=Excel 8.0;";
            //if (Conn_Excel.State != 0) Conn_Excel.Open();

            //MessageBox.Show(str);
            Conn_Excel.ConnectionString = str11;
        }
        string getfile()
        {
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblfile", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            DataColumn col = dt.Columns["tenfile"];
            foreach (DataRow row in dt.Rows)
            {
                return row[col].ToString();
            }
            return "Data.xls";
        }
        void connection_Excel()
        {
            OleDbDataAdapter apt=new OleDbDataAdapter("select * from [minh$]",Conn_Excel);
            DataTable dt=new DataTable();
            apt.Fill(dt);
            dtgrid_dakyten.DataSource = dt;
            dtgrid_chuakyten.DataSource = dt;
        }
        void connection_Access()
        {
            //OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam", cn);
            //DataTable dt = new DataTable();
            //apt.Fill(dt);
            //dtgrid_dakyten.DataSource = dt;
            //dtgrid_chuakyten.DataSource = dt;
        }
        void getdulieu()
        {
            //OleDbDataAdapter apt = new OleDbDataAdapter("select * from [minh$]", Conn_Excel);
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from [Tá»ng quan $]", Conn_Excel);
            DataTable dt = new DataTable();
            apt.Fill(dt);
                        
            string[] a=new string[125];
            for (int i = 0; i < 125; i++)
            {
                a[i]= "";
            }
            string[] ten = new string[125];
            ten[0] = "hovaten";
            ten[1] = "batdauvaoluc";
            ten[2] = "dahoanthanh";
            ten[3] = "thoigianlambai";
            ten[4] = "diemso";
            int index=1;
            for(int i=5;i<125;i++)
            {
                ten[i] = "cau" + index.ToString();
                index++;
            }
            int k = 0;
            string str;
            if (Conn_Access.State==0)
            Conn_Access.Open();
            bool kt;
            foreach (DataRow row in dt.Rows)
            {
                kt = false;
                str = "insert into tblbailam(";

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i < dt.Columns.Count - 1)
                        str += ten[i] + ",";
                    else
                        str += ten[i];
                }

                str += ") values(";
                k = 1;
                int j = 0;
                foreach (DataColumn col in dt.Columns)
                {
                    //////////////////////////////////////////////////
                    if (j == 0)
                    {
                        if (kiemtraten(row[col].ToString()) == true)
                        {
                            kt = true;
                            break;
                        }
                    }
                    j++;
                    if (k < dt.Columns.Count)
                        str += "'" + row[col].ToString()+"'" + ",";
                    else
                        str += "'" + row[col].ToString() + "'";
                    k++;
                    ////////////////////////////////////////////////////
                }
                if (kt == false)
                {
                    str += ")";
                    OleDbCommand cmd = new OleDbCommand(str, Conn_Access);
                    cmd.ExecuteNonQuery();
                }
            }
            ////////////////////////////////////////////////////////////////////////////////////////////////////

            ///////////////////////////////////////////////////////////////////////////////////////////////////
            

        }
        void getdulieu_report(string tenhv)
        {
            

            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where hovaten='"+tenhv+"'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);

            string[] a = new string[127];
            for (int i = 0; i < 127; i++)
            {
                a[i] = "";
            }
            string[] ten = new string[127];
            ten[0] = "hovaten";
            ten[1] = "batdauvaoluc";
            ten[2] = "dahoanthanh";
            ten[3] = "thoigianlambai";
            ten[4] = "diemso";
            ten[5] = "trangthai";
            ten[6] = "id";
            int index = 1;
            for (int i = 7; i < 127; i++)
            {
                ten[i] = "cau" + index.ToString();
                index++;
            }
            ///////////////////////////////////////////////////////////////////////

            
            
            //giothi = txtgiothi.Text;
            //ngaythi = dateTimePicker_tungay.Value.ToString();
            //MessageBox.Show(giothi);
            //////////////////////////////////////////////////////////////////////
            int k = 0;
            string str;
            if (Conn_Access.State == 0)
                Conn_Access.Open();
            bool kt;
            foreach (DataRow row in dt.Rows)
            {
                //////////////////////////////////////////////////////////////////
                //str = "delete from tblrptbailam";
                //OleDbCommand cmd2 = new OleDbCommand(str, Conn_Access);
                //cmd2.ExecuteNonQuery();
                //cmd2.Dispose();

                //Conn_Access.Close();
                //Conn_Access.Open();
                //////////////////////////////////////////////////////////////////
                kt = false;
                str = "insert into tblrptbailam(";

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i < dt.Columns.Count - 1)
                        str += ten[i] + ",";
                    else
                        str += ten[i];
                }
                str = str + ",cathi,nghe,monthi,ngaythi,giothi,ngay,thang,nam,socau,strlambai,masv,kythi";
                str += ") values(";
                k = 1;
                int j = 0;
                foreach (DataColumn col in dt.Columns)
                {
                    //////////////////////////////////////////////////
                    /*if (j == 0)
                    {
                        if (kiemtraten(row[col].ToString()) == true)
                        {
                            kt = true;
                            break;
                        }
                    }
                    j++;*/
                    if (j == 1) tam = row[col].ToString();
                    j++;
                    if (k < dt.Columns.Count)
                        str += "'" + row[col].ToString() + "'" + ",";
                    else
                        str += "'" + row[col].ToString() + "'";
                    k++;
                    ////////////////////////////////////////////////////
                }
                //if (kt == false)
                //{
                //DateTime date_ngay;

                str = str + ",'" + cathi + "','" + nghe + "','" + monthi + "','" + ngaythi + "','" + giothi + "','" + ngay + "','" + thang + "','" + nam + "','" + socau + "','" + thoigianlambai + "','"+masinhvien+"'";
                    str +=",'" + txtkythi.Text + "'"+ ")";
                    OleDbCommand cmd = new OleDbCommand(str, Conn_Access);
                    cmd.ExecuteNonQuery();
                    cmd.Dispose();
                //}//////////////////////////////////////////////////////////////////////////
                    //str = "update tblrptbailam set cathi='"+cathi+"',nghe='"+nghe+"',monthi='"+monthi+"',ngaythi='"+ngaythi+"',giothi='"+giothi+"',ngay='"+ngay+"',thang='"+thang+"',nam='"+nam+"'";
                    //OleDbCommand cmd1 = new OleDbCommand(str, Conn_Access);
                    //cmd1.ExecuteNonQuery();
                ///////////////////////////////////////////////////////////////////////////
                   
                    //bl.Refresh();
                    //bl.PrintToPrinter(1, true, 1, 1);

                    
                ////////////////////////////////////////////////////////////////////////////
                    
                                  
            }
            /*frmrptbailam f = new frmrptbailam();
            f.ShowDialog();*/
            /*if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1' where hovaten='"+tenhv+"'", Conn_Access);
            cmdcapnhat.ExecuteNonQuery();
            dakyten();
            chuakyten();*/
           
        }
        //////////////////////////////////in tat ca//////////////////////////////////////////////////////////////////
        void getdulieu_report()
        {

            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where trangthai='0'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);

            string[] a = new string[127];
            for (int i = 0; i < 127; i++)
            {
                a[i] = "";
            }
            string[] ten = new string[127];
            ten[0] = "hovaten";
            ten[1] = "batdauvaoluc";
            ten[2] = "dahoanthanh";
            ten[3] = "thoigianlambai";
            ten[4] = "diemso";
            ten[5] = "trangthai";
            ten[6] = "id";
            int index = 1;
            for (int i = 7; i < 127; i++)
            {
                ten[i] = "cau" + index.ToString();
                index++;
            }
            ///////////////////////////////////////////////////////////////////////



            //giothi = txtgiothi.Text;
            //ngaythi = dateTimePicker_tungay.Value.ToString();
            //MessageBox.Show(giothi);
            //////////////////////////////////////////////////////////////////////
            int k = 0;
            string str;
            if (Conn_Access.State == 0)
                Conn_Access.Open();
            bool kt;
            foreach (DataRow row in dt.Rows)
            {
                //////////////////////////////////////////////////////////////////
                //str = "delete from tblrptbailam";
                //OleDbCommand cmd2 = new OleDbCommand(str, Conn_Access);
                //cmd2.ExecuteNonQuery();
                //cmd2.Dispose();

                //Conn_Access.Close();
                //Conn_Access.Open();
                //////////////////////////////////////////////////////////////////
                kt = false;
                str = "insert into tblrptbailam(";

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    if (i < dt.Columns.Count - 1)
                        str += ten[i] + ",";
                    else
                        str += ten[i];
                }
                str = str + ",cathi,nghe,monthi,ngaythi,giothi,ngay,thang,nam,socau,strlambai";
                str += ") values(";
                k = 1;
                int j = 0;
                foreach (DataColumn col in dt.Columns)
                {
                    //////////////////////////////////////////////////
                    /*if (j == 0)
                    {
                        if (kiemtraten(row[col].ToString()) == true)
                        {
                            kt = true;
                            break;
                        }
                    }
                    j++;*/
                    if (j == 1) tam = row[col].ToString();
                    j++;
                    if (k < dt.Columns.Count)
                        str += "'" + row[col].ToString() + "'" + ",";
                    else
                        str += "'" + row[col].ToString() + "'";
                    k++;
                    ////////////////////////////////////////////////////
                }
                //if (kt == false)
                //{
                //DateTime date_ngay;

                str = str + ",'" + cathi + "','" + nghe + "','" + monthi + "','" + ngaythi + "','" + giothi + "','" + ngay + "','" + thang + "','" + nam + "','" + socau + "','" + thoigianlambai + "'";
                str += ")";
                OleDbCommand cmd = new OleDbCommand(str, Conn_Access);
                cmd.ExecuteNonQuery();
                cmd.Dispose();
                //}//////////////////////////////////////////////////////////////////////////
                //str = "update tblrptbailam set cathi='"+cathi+"',nghe='"+nghe+"',monthi='"+monthi+"',ngaythi='"+ngaythi+"',giothi='"+giothi+"',ngay='"+ngay+"',thang='"+thang+"',nam='"+nam+"'";
                //OleDbCommand cmd1 = new OleDbCommand(str, Conn_Access);
                //cmd1.ExecuteNonQuery();
                ///////////////////////////////////////////////////////////////////////////

                //bl.Refresh();
                //bl.PrintToPrinter(1, true, 1, 1);


                ////////////////////////////////////////////////////////////////////////////


            }
            frmrptbailam f = new frmrptbailam();
            f.ShowDialog();
            if (MessageBox.Show("Có muốn lưu học viên?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                dakyten();
                chuakyten();
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        private void cmdin_dakyten_Click(object sender, EventArgs e)
        {
            if (strtenhv == "")
            {
                MessageBox.Show("Chưa chọn học viên đã ký tên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblrptbailam", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            /////////////////////////////////////////////////////////////////////////
            //OleDbDataAdapter aptmo = new OleDbDataAdapter("select * from tblrptbailam", Conn_Access);
            //DataTable dtmo = new DataTable();
            //aptmo.Fill(dtmo);
            /////////////////////////////////////////////////////////////////////////
            //OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [minh$]", Conn_Excel);
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            Conn_Excel.Open();
            OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [Tá»ng quan $]", Conn_Excel);
            DataTable dt1 = new DataTable();
            apt1.Fill(dt1);
            socau = (dt1.Columns.Count - 5).ToString();
            Conn_Excel.Close();
            //MessageBox.Show(socau);
            cathi = cbocathi.Text;
            monthi = cbomonthi.Text;
            nghe = cbonghe.Text;
            masinhvien = getmasinhvien(strtenhv);
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where trangthai='1' and hovaten='" + strtenhv + "'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            string tenhv;
            DateTime dn;
            DateTime dn1;
            DateTime result;
            long so1 = 0;
            long so2 = 0;
            long so3 = 0;
            long gio = 0;
            long phut = 0;
            long giay = 0;
            DataColumn col = dt.Columns["hovaten"];
            DataColumn col1 = dt.Columns["batdauvaoluc"];
            DataColumn col2 = dt.Columns["dahoanthanh"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                dn = DateTime.Parse(dt.Rows[i][col1].ToString());
                giothi = getchuoi(dn.Hour) + ":" + getchuoi(dn.Minute) + ":" + getchuoi(dn.Second);
                //MessageBox.Show(giothi);
                ngaythi = getchuoi(dn.Day) + "/" + getchuoi(dn.Month) + "/" + dn.Year.ToString();
                ngay = getchuoi(dn.Day);
                thang = getchuoi(dn.Month);
                nam = dn.Year.ToString();
                if (DateTime.TryParse(dt.Rows[i][col2].ToString(), out result) == false)
                {
                    dn1 = dn.AddHours(2);
                }
                else
                {
                    dn1 = DateTime.Parse(dt.Rows[i][col2].ToString());
                }
                so1 = dn.Hour * 3600 + dn.Minute * 60 + dn.Second;
                so2 = dn1.Hour * 3600 + dn1.Minute * 60 + dn1.Second;
                so3 = so2 - so1;
                gio = (so3 / 3600);
                //MessageBox.Show(gio.ToString());
                so3 = so3 - gio * 3600;
                phut = (so3 / 60);
                //MessageBox.Show(phut.ToString());
                so3 = so3 - phut * 60;
                giay = so3;
                //MessageBox.Show(giay.ToString());
                thoigianlambai = getchuoi((int)gio) + ":" + getchuoi((int)phut) + ":" + getchuoi((int)giay);
                //MessageBox.Show(thoigianlambai);
                tenhv = dt.Rows[i][col].ToString();
                getdulieu_report(tenhv);
            }
            frmrptbailam f = new frmrptbailam();
            f.ShowDialog();
            /*if (MessageBox.Show("Có muốn lưu học viên?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1' where hovaten='" + strtenhv + "'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                dakyten();
                chuakyten();
            }*/
        }
        bool kiemtraten(string ten)
        {
            string str="select * from tblbailam where hovaten='" + ten + "'";
            OleDbDataAdapter apt = new OleDbDataAdapter(str,Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            if (dt.Rows.Count > 0) return true;
            return false;
        }

        void dakyten()
        {
            string str = "select * from tblbailam where trangthai='1'";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            txttongsothisinhdakyten.Text = dt.Rows.Count.ToString();
            dtgrid_dakyten.DataSource = dt;
            dtgrid_dakyten.Columns[0].Width = 150;
            dtgrid_dakyten.Columns[0].HeaderText = "Họ và tên sinh viên";
            dtgrid_dakyten.Columns[1].Width = 150;
            dtgrid_dakyten.Columns[1].HeaderText = "TG Bắt đầu";
            dtgrid_dakyten.Columns[2].Width = 150;
            dtgrid_dakyten.Columns[2].HeaderText = "TG Kết thúc";
            dtgrid_dakyten.Columns[3].Width = 150;
            dtgrid_dakyten.Columns[3].HeaderText = "TG Làm bài";
            dtgrid_dakyten.Columns[4].Width = 100;
            dtgrid_dakyten.Columns[4].HeaderText = "Điểm số";
            dtgrid_dakyten.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
        }
        void chuakyten()
        {
            string str = "select * from tblbailam where trangthai='0'";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            dtgrid_chuakyten.DataSource = dt;
            
            dtgrid_chuakyten.Columns[0].Width = 150;
            dtgrid_chuakyten.Columns[0].HeaderText = "Họ và tên sinh viên";
            dtgrid_chuakyten.Columns[1].Width = 150;
            dtgrid_chuakyten.Columns[1].HeaderText = "TG Bắt đầu";
            dtgrid_chuakyten.Columns[2].Width = 150;
            dtgrid_chuakyten.Columns[2].HeaderText = "TG Kết thúc";
            dtgrid_chuakyten.Columns[3].Width = 150;
            dtgrid_chuakyten.Columns[3].HeaderText = "TG Làm bài";
            dtgrid_chuakyten.Columns[4].Width = 100;
            dtgrid_chuakyten.Columns[4].HeaderText = "Điểm số";
            dtgrid_chuakyten.ColumnHeadersDefaultCellStyle.Alignment = DataGridViewContentAlignment.MiddleCenter;
            
        }

        private void button3_Click(object sender, EventArgs e)
        {
            string str = "provider=Microsoft.Jet.OLEDB.4.0;data source=" + opf.FileName + ";Extended Properties=Excel 8.0;";
            
            
            //MessageBox.Show(str);
            Conn_Excel.ConnectionString = str;
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            Conn_Excel.Open();
            getdulieu();
            Conn_Excel.Close();
            ////////////////////////////////////////////////////////////////////////////////////////////////
            //if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblbailam  where thoigianlambai='Mở'", Conn_Access);
            cmdxoa.ExecuteNonQuery();

            ///////////////////////////////////////////////////////////////////////////////////////////////
            dakyten();
            chuakyten();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblrptbailam", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            //OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [minh$]", Conn_Excel);
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            Conn_Excel.Open();
            OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [Tá»ng quan $]", Conn_Excel);
            DataTable dt1 = new DataTable();
            apt1.Fill(dt1);
            socau = (dt1.Columns.Count-5).ToString();
            Conn_Excel.Close();
            //MessageBox.Show(socau);
            cathi = cbocathi.Text;
            monthi = cbomonthi.Text;
            nghe = cbonghe.Text;
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where trangthai='0'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            string tenhv;
            DateTime dn;
            DateTime dn1;
            DateTime result;
            long so1 = 0;
            long so2 = 0;
            long so3 = 0;
            long gio = 0;
            long phut = 0;
            long giay = 0;
            DataColumn col = dt.Columns["hovaten"];
            DataColumn col1 = dt.Columns["batdauvaoluc"];
            DataColumn col2 = dt.Columns["dahoanthanh"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                
                dn = DateTime.Parse(dt.Rows[i][col1].ToString());
                giothi = getchuoi(dn.Hour) + ":" + getchuoi(dn.Minute) + ":" + getchuoi(dn.Second);
                //MessageBox.Show(giothi);
                ngaythi = getchuoi(dn.Day) + "/" + getchuoi(dn.Month) + "/" + dn.Year.ToString();
                ngay = getchuoi(dn.Day);
                thang = getchuoi(dn.Month);
                nam = dn.Year.ToString();
                if (DateTime.TryParse(dt.Rows[i][col2].ToString(),out result) == false)
                {
                    dn1 = dn.AddHours(2);
                }
                else
                {
                    dn1 = DateTime.Parse(dt.Rows[i][col2].ToString());
                }
                so1 = dn.Hour * 3600 + dn.Minute * 60 + dn.Second;
                so2 = dn1.Hour * 3600 + dn1.Minute * 60 + dn1.Second;
                so3 = so2 - so1;
                gio = (so3 / 3600);
                so3 = so3 - gio * 3600;
                phut = (so3 / 60);
                so3 = so3 - phut * 60;
                giay = so3;
                thoigianlambai = getchuoi((int)gio) + ":" + getchuoi((int)phut) + ":" + getchuoi((int)giay);
                //MessageBox.Show(thoigianlambai);
                tenhv = dt.Rows[i][col].ToString();
                masinhvien = getmasinhvien(tenhv);
                getdulieu_report(tenhv);
            }
            frmrptbailam f = new frmrptbailam();
            f.ShowDialog();
            if (MessageBox.Show("Có muốn lưu học viên?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                dakyten();
                chuakyten();
            }
        }
        string getchuoi(int so)
        {
            if (so < 10) return "0" + so.ToString();
            else return so.ToString();
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (strtenhv == "")
            {
                MessageBox.Show("Chưa chọn học viên chưa ký tên", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                return;
            }
            if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblrptbailam", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            cmdxoa.Dispose();
            Conn_Excel.Open();
            //OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [minh$]", Conn_Excel);
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [Tá»ng quan $]", Conn_Excel);
            DataTable dt1 = new DataTable();
            apt1.Fill(dt1);
            socau = (dt1.Columns.Count - 5).ToString();
            Conn_Excel.Close();
            //MessageBox.Show(socau);
            cathi = cbocathi.Text;
            monthi = cbomonthi.Text;
            nghe = cbonghe.Text;
            masinhvien = getmasinhvien(strtenhv);
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where trangthai='0' and hovaten='"+strtenhv+"'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            string tenhv;
            DateTime dn;
            DateTime dn1;
            DateTime result;
            long so1 = 0;
            long so2 = 0;
            long so3 = 0;
            long gio = 0;
            long phut = 0;
            long giay = 0;
            DataColumn col = dt.Columns["hovaten"];
            DataColumn col1 = dt.Columns["batdauvaoluc"];
            DataColumn col2 = dt.Columns["dahoanthanh"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                dn = DateTime.Parse(dt.Rows[i][col1].ToString());
                giothi = getchuoi(dn.Hour) + ":" + getchuoi(dn.Minute) + ":" + getchuoi(dn.Second);
                //MessageBox.Show(giothi);
                ngaythi = getchuoi(dn.Day) + "/" + getchuoi(dn.Month) + "/" + dn.Year.ToString();
                ngay = getchuoi(dn.Day);
                thang = getchuoi(dn.Month);
                nam = dn.Year.ToString();
                if (DateTime.TryParse(dt.Rows[i][col2].ToString(), out result) == false)
                {
                    dn1 = dn.AddHours(2);
                }
                else
                {
                    dn1 = DateTime.Parse(dt.Rows[i][col2].ToString());
                }
                so1 = dn.Hour * 3600 + dn.Minute * 60 + dn.Second;
                so2 = dn1.Hour * 3600 + dn1.Minute * 60 + dn1.Second;
                so3 = so2 - so1;
                gio = (so3 / 3600);
                //MessageBox.Show(gio.ToString());
                so3 = so3 - gio * 3600;
                phut = (so3 / 60);
                //MessageBox.Show(phut.ToString());
                so3 = so3 - phut * 60;
                giay = so3;
                //MessageBox.Show(giay.ToString());
                thoigianlambai = getchuoi((int)gio) + ":" + getchuoi((int)phut) + ":" + getchuoi((int)giay);
                //MessageBox.Show(thoigianlambai);
                tenhv = dt.Rows[i][col].ToString();
                getdulieu_report(tenhv);
            }
            frmrptbailam f = new frmrptbailam();
            f.ShowDialog();
            if (MessageBox.Show("Có muốn lưu học viên?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1' where hovaten='" + strtenhv + "'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                dakyten();
                chuakyten();
            }
            
        }
        void getmonthi()
        {
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblmonthi", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            cbomonthi.DataSource = dt;
            cbomonthi.DisplayMember = "tenmonthi";
            cbomonthi.ValueMember = "tenmonthi";
        }
        void getnghe()
        {
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblnghe", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            cbonghe.DataSource = dt;
            cbonghe.DisplayMember = "tennghe";
            cbonghe.ValueMember = "manghe";
        }
        void getcathi()
        {
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblcathi", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            cbocathi.DataSource = dt;
            cbocathi.DisplayMember = "tencathi";
            cbocathi.ValueMember = "tencathi";
        }

        private void tt_Tick(object sender, EventArgs e)
        {
            thoigian = true;
        }

        private void dtgrid_chuakyten_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtgrid_chuakyten_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            //string tenhv;
            strtenhv = "";
            if (e.RowIndex >= 0 && e.RowIndex < dtgrid_chuakyten.RowCount - 1)
            {
                strtenhv = dtgrid_chuakyten[0, e.RowIndex].Value.ToString();
                //MessageBox.Show(strtenhv);

               
            }

        }

        private void cmdintatca_dakyten_Click(object sender, EventArgs e)
        {
            if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblrptbailam", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            //OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [minh$]", Conn_Excel);
            //if (Conn_Excel.State == 0) Conn_Excel.Open();
            Conn_Excel.Open();
            OleDbDataAdapter apt1 = new OleDbDataAdapter("select * from [Tá»ng quan $]", Conn_Excel);
            DataTable dt1 = new DataTable();
            apt1.Fill(dt1);
            socau = (dt1.Columns.Count - 5).ToString();
            Conn_Excel.Close();
            //MessageBox.Show(socau);
            cathi = cbocathi.Text;
            monthi = cbomonthi.Text;
            nghe = cbonghe.Text;
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblbailam where trangthai='1'", Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            string tenhv;
            DateTime dn;
            DateTime dn1;
            DateTime result;
            long so1 = 0;
            long so2 = 0;
            long so3 = 0;
            long gio = 0;
            long phut = 0;
            long giay = 0;
            DataColumn col = dt.Columns["hovaten"];
            DataColumn col1 = dt.Columns["batdauvaoluc"];
            DataColumn col2 = dt.Columns["dahoanthanh"];
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                dn = DateTime.Parse(dt.Rows[i][col1].ToString());
                giothi = getchuoi(dn.Hour) + ":" + getchuoi(dn.Minute) + ":" + getchuoi(dn.Second);
                //MessageBox.Show(giothi);
                ngaythi = getchuoi(dn.Day) + "/" + getchuoi(dn.Month) + "/" + dn.Year.ToString();
                ngay = getchuoi(dn.Day);
                thang = getchuoi(dn.Month);
                nam = dn.Year.ToString();
                if (DateTime.TryParse(dt.Rows[i][col2].ToString(), out result) == false)
                {
                    dn1 = dn.AddHours(2);
                }
                else
                {
                    dn1 = DateTime.Parse(dt.Rows[i][col2].ToString());
                }
                so1 = dn.Hour * 3600 + dn.Minute * 60 + dn.Second;
                so2 = dn1.Hour * 3600 + dn1.Minute * 60 + dn1.Second;
                so3 = so2 - so1;
                gio = (so3 / 3600);
                so3 = so3 - gio * 3600;
                phut = (so3 / 60);
                so3 = so3 - phut * 60;
                giay = so3;
                thoigianlambai = getchuoi((int)gio) + ":" + getchuoi((int)phut) + ":" + getchuoi((int)giay);
                //MessageBox.Show(thoigianlambai);
                tenhv = dt.Rows[i][col].ToString();
                masinhvien = getmasinhvien(tenhv);
                getdulieu_report(tenhv);
            }
            frmrptbailam f = new frmrptbailam();
            f.ShowDialog();
            /*if (MessageBox.Show("Có muốn lưu học viên?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblbailam set trangthai='1'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                dakyten();
                chuakyten();
            }*/
        }

        private void dtgrid_dakyten_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dtgrid_dakyten_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            strtenhv = "";
            if (e.RowIndex >= 0 && e.RowIndex < dtgrid_dakyten.RowCount - 1)
            {
                strtenhv = dtgrid_dakyten[0, e.RowIndex].Value.ToString();
                //MessageBox.Show(strtenhv);


            }
        }
        string getmasinhvien(string hovatensinhvien)
        {
            if (cbonghe.SelectedIndex < 0) return "";
            string manghe=cbonghe.SelectedValue.ToString();
            string str = "select * from " + manghe + " where HOVATENSINHVIEN='" + hovatensinhvien + "'";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            string masv="";
            DataColumn col = dt.Columns["MASV"];
            foreach (DataRow row in dt.Rows)
            {
                masv = row[col].ToString();
            }
            return masv;

        }

        private void cbonghe_SelectedValueChanged(object sender, EventArgs e)
        {
            //MessageBox.Show(cbonghe.SelectedIndex.ToString());
        }

        private void cbonghe_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (trangthai == true)
            {
                if (cbonghe.SelectedIndex < 0) return;
                string manghe = cbonghe.SelectedValue.ToString();
                string str = "select * from " + manghe;
                OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
                DataTable dt = new DataTable();
                apt.Fill(dt);
                txttongsothisinhduthi.Text = dt.Rows.Count.ToString();
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            if (opf.ShowDialog() == DialogResult.OK)
            {
                if (opf.FileName != "")
                {
                    txtfileexcel.Text = opf.FileName;
                }
                else
                {
                    opf.FileName = "data.xls";
                }
                if (Conn_Access.State == 0) Conn_Access.Open();
                OleDbCommand cmdcapnhat = new OleDbCommand("update tblfile set tenfile='"+opf.FileName+"'", Conn_Access);
                cmdcapnhat.ExecuteNonQuery();
                cmdcapnhat.Dispose();
            }
            

        }

        private void txtmatkhau_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                if (txtmatkhau.Text == "1972") cmdreset.Enabled = true;
                else cmdreset.Enabled = false;
            }
        }

        private void cmdreset_Click(object sender, EventArgs e)
        {
            if (Conn_Access.State == 0) Conn_Access.Open();
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblbailam", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            cmdxoa.Dispose();
            dakyten();
            chuakyten();
            txtmatkhau.Text = "";
            cmdreset.Enabled = false;
        }

        private void button5_Click(object sender, EventArgs e)
        {
            OleDbCommand cmdxoa = new OleDbCommand("delete from tblrpttonghop", Conn_Access);
            cmdxoa.ExecuteNonQuery();
            cmdxoa.Dispose();
            tonghop();
            frmrpttonghop f = new frmrpttonghop();
            f.ShowDialog();

        }
        void tonghop()
        {
            string str = "select * from tblbailam";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            ///////////////////////////////////////////////////////////////
            DataColumn colhovaten = dt.Columns["hovaten"];
            DataColumn colbatdauvaoluc = dt.Columns["batdauvaoluc"];
            DataColumn coldahoanthanh = dt.Columns["dahoanthanh"];
            DataColumn coldiemso = dt.Columns["diemso"];
            ////////////////////////////////////////////////////////////////
            string rptnghe = cbonghe.Text;
            string rptngaythi;
            string rptgiothi;
            string rptmasv;
            string rpthovaten;
            string rptthoigianhoanthanh;
            string rptdiem;
            string rptngay;
            string rptthang;
            string rptnam;
            string strsql;
            string tongso;
            string tongsodau;
            string tongsorot;
            ////////////////////////////////////////////////////////////////
            foreach (DataRow row in dt.Rows)
            {

                rptdiem = row[coldiemso].ToString();
                rpthovaten = row[colhovaten].ToString();
                rptmasv = getmasinhvien(rpthovaten);
                rptngaythi = getngaythi(DateTime.Parse(row[colbatdauvaoluc].ToString()));
                rptgiothi = getgiothi(DateTime.Parse(row[colbatdauvaoluc].ToString()));
                rptthoigianhoanthanh = getthoigianhoanthanh(DateTime.Parse(row[coldahoanthanh].ToString()));
                rptngay = getchuoi(DateTime.Parse(row[colbatdauvaoluc].ToString()).Day);
                rptthang = getchuoi(DateTime.Parse(row[colbatdauvaoluc].ToString()).Month);
                rptnam = getchuoi(DateTime.Parse(row[colbatdauvaoluc].ToString()).Year);
                tongso = getchuoi(tongsothisinh());
                tongsodau = getchuoi(tongsothisinhdau());
                tongsorot = getchuoi(tongsothisinhrot());
                strsql = "insert into tblrpttonghop(nghe,ngaythi,giothi,masv,hovaten,thoigianhoanthanh,diem,ngay,thang,nam,tongsosv,tongsodau,tongsorot) values(";
                strsql = strsql + "'" + rptnghe + "','" + rptngaythi + "','" + rptgiothi + "','" + rptmasv + "','" + rpthovaten + "','" + rptthoigianhoanthanh + "',";
                strsql = strsql + "'" + rptdiem + "','" + rptngay + "','" + rptthang + "','" + rptnam + "','" + tongso + "','" + tongsodau + "','" + tongsorot + "')";
                OleDbCommand cmdinsert = new OleDbCommand(strsql, Conn_Access);
                cmdinsert.ExecuteNonQuery();
                cmdinsert.Dispose();
            }
            ///////////////////////////////////////////////////////////////
        }
        string getngaythi(DateTime dt)
        {
            string str;
            str = getchuoi(dt.Day) + "/" + getchuoi(dt.Month) + "/" + getchuoi(dt.Year);
            return str;
        }
        string getgiothi(DateTime dt)
        {
            string str;
            str = getchuoi(dt.Hour) + ":" + getchuoi(dt.Minute) + ":" + getchuoi(dt.Second);
            return str;
        }

        string getthoigianhoanthanh(DateTime dt)
        {
            string str;
            str = getchuoi(dt.Day) + "/" + getchuoi(dt.Month) + "/" + getchuoi(dt.Year)+" , "+getchuoi(dt.Hour)+":"+getchuoi(dt.Minute)+":"+getchuoi(dt.Second);
            return str;
        }

        int tongsothisinh()
        {
            string str = "select * from tblbailam";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            return dt.Rows.Count;
        }

        int tongsothisinhdau()
        {
            string str = "select diemso from tblbailam";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            DataColumn coldiemso = dt.Columns["diemso"];
            int tongso = 0;
            foreach (DataRow row in dt.Rows)
            {
                if (decimal.Parse(row[coldiemso].ToString()) >= 5) tongso++;
            }
            return tongso;
        }

        int tongsothisinhrot()
        {
            string str = "select diemso from tblbailam";
            OleDbDataAdapter apt = new OleDbDataAdapter(str, Conn_Access);
            DataTable dt = new DataTable();
            apt.Fill(dt);
            DataColumn coldiemso = dt.Columns["diemso"];
            int tongso = 0;
            foreach (DataRow row in dt.Rows)
            {
                if (decimal.Parse(row[coldiemso].ToString()) < 5) tongso++;
            }
            return tongso;
        }

    }
}
