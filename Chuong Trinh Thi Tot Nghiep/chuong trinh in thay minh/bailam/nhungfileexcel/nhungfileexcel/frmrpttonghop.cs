using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace nhungfileexcel
{
    public partial class frmrpttonghop : Form
    {
        public frmrpttonghop()
        {
            InitializeComponent();
        }

        private void frmrpttonghop_Load(object sender, EventArgs e)
        {
            rpttonghop rpt = new rpttonghop();
            //rpt.SetDataSource(dts.Tables[0]);
            //CrystalDecisions.Shared.TableLogOnInfo dd=rpt.Database.Tables[0].LogOnInfo;
            //dd.ConnectionInfo.DatabaseName = Path.Combine(Directory.GetCurrentDirectory(), "bangdiem.mdb");
            //dd.TableName = "tblrptbailam";
            //rpt.Database.Tables[0].ApplyLogOnInfo(dd);
            //rpt.VerifyDatabase();
            //Data tbl=rpt.Database.Tables["tblrptbailam"].LogOnInfo();
            rpt.Refresh();
            cv.ReportSource = rpt;
        }
    }
}
