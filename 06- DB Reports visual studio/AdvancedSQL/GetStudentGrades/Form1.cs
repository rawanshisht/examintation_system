using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GetStudentGrades
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void FindStudGrades_Click(object sender, EventArgs e)
        {
            if (int.TryParse(StdID.Text, out _))
            {
                GetStudentGrades r = new GetStudentGrades();
                r.SetParameterValue("@studentID", StdID.Text);
                crystalReportViewer1.ReportSource = r;
            }
        }
    }
}
