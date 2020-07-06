using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ExamWithStudAnswersReport6
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void btn_Print_Click(object sender, EventArgs e)
        {
            PrintExamWithStudAns r = new PrintExamWithStudAns();
            //PrintExamWithStudAnsV2 r = new PrintExamWithStudAnsV2();
            if(int.TryParse(txt_ExamNo.Text,out _) && int.TryParse(txt_StdID.Text, out _))
            {
                r.SetParameterValue("@examNo", txt_ExamNo.Text);
                r.SetParameterValue("@stdID", txt_StdID.Text);
                crystalReportViewer.ReportSource = r;
            }
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
