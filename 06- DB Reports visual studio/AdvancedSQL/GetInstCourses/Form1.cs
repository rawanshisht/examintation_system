using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GetInstCourses
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void FindCourses_Click(object sender, EventArgs e)
        {
            if (int.TryParse(InstID.Text, out _))
            {

                GetInstCourses r = new GetInstCourses();
                r.SetParameterValue("@inst_id", InstID.Text);
                crystalReportViewer.ReportSource = r;
            }
        }
    }
}
