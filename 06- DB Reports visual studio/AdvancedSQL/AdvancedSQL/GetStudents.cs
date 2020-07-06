using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace AdvancedSQL
{
    public partial class GetStudents : Form
    {
        public GetStudents()
        {
            InitializeComponent();
        }

        private void FindStudents_Click(object sender, EventArgs e)
        {
            if (int.TryParse(DepartmentNumber.Text, out _))
            {
                GetStudentInfoByDepartmentNumber r = new GetStudentInfoByDepartmentNumber();
                r.SetParameterValue("@dept_no", DepartmentNumber.Text);
                crystalReportViewer.ReportSource = r;
            }
        }
    }
}
