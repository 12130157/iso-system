using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace SMS
{
    public partial class FormInbox : Form
    {
        public FormInbox()
        {
            InitializeComponent();
            //dloadGrid();
        }
        public void showSyntaxMess()
        { 
            bool kq = HopThuDenDAO.getAllSyntaxMess();
            //ArrayList list = SELECT_MESSDAO.getAll();
            
            //foreach (SELECT_MESSMODEL model in list)
            //{
            //    //DataSet ds = new DataSet();
                
            //    //tblSyntaxMess.(ds);
            //}


            //DataTable tableContent = SELECT_MESSDAO.getAllData();
            //tblSyntaxMess.DataSource = tableContent;
        }
    }
}
