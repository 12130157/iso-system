using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.OleDb;
using System.IO;

namespace nhungfileexcel
{
    public partial class frmrptbailam : Form
    {
        public frmrptbailam()
        {
            InitializeComponent();
        }

        private void frmrptbailam_Load(object sender, EventArgs e)
        {
            /*OleDbConnection Conn_Access = new OleDbConnection("provider=Microsoft.Jet.OLEDB.4.0;data source=" + Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb"));
            OleDbDataAdapter apt = new OleDbDataAdapter("select * from tblrptbailam", Conn_Access);
            DataTable dt = new DataTable();
            DataSet dts = new DataSet();
            //apt.Fill(dt);
            apt.Fill(dts);*/
            bailam rpt = new bailam();
            //rpt.SetDataSource(dts.Tables[0]);
            //CrystalDecisions.Shared.TableLogOnInfo dd=rpt.Database.Tables[0].LogOnInfo;
            //dd.ConnectionInfo.DatabaseName = Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb");
            //dd.TableName = "tblrptbailam";
            //rpt.Database.Tables[0].ApplyLogOnInfo(dd);
            //rpt.VerifyDatabase();
            //Data tbl=rpt.Database.Tables["tblrptbailam"].LogOnInfo();
            rpt.Refresh();
            cv.ReportSource = rpt;
            //Conn_Access.Close();
            //Conn_Access.Dispose();
            
        }
    }
}
