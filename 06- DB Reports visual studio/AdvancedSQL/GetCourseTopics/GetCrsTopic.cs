using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GetCourseTopics
{
    public partial class GetCrsTopic : Form
    {
        public GetCrsTopic()
        {
            InitializeComponent();
        }

        private void FindTopics_Click(object sender, EventArgs e)
        {
            if (int.TryParse(CourseCode.Text, out _))
            {

                CourseTopicsReport r = new CourseTopicsReport();
                r.SetParameterValue("@CourseID", CourseCode.Text);
                crystalReportViewer.ReportSource = r;
            }
            
        }

        private void GetCrsTopic_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void CourseCode_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
