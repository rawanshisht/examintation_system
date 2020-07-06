namespace Report1
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.crystalReportViewer = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.btn_FindExam = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.txt_ExamNo = new System.Windows.Forms.TextBox();
            this.panel2 = new System.Windows.Forms.Panel();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // crystalReportViewer
            // 
            this.crystalReportViewer.ActiveViewIndex = -1;
            this.crystalReportViewer.AutoScroll = true;
            this.crystalReportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crystalReportViewer.Cursor = System.Windows.Forms.Cursors.Default;
            this.crystalReportViewer.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.crystalReportViewer.Location = new System.Drawing.Point(0, -108);
            this.crystalReportViewer.Name = "crystalReportViewer";
            this.crystalReportViewer.Size = new System.Drawing.Size(1342, 850);
            this.crystalReportViewer.TabIndex = 3;
            this.crystalReportViewer.Load += new System.EventHandler(this.crystalReportViewer_Load);
            // 
            // btn_FindExam
            // 
            this.btn_FindExam.Location = new System.Drawing.Point(315, 19);
            this.btn_FindExam.Name = "btn_FindExam";
            this.btn_FindExam.Size = new System.Drawing.Size(94, 33);
            this.btn_FindExam.TabIndex = 3;
            this.btn_FindExam.Text = "Print Exam";
            this.btn_FindExam.UseVisualStyleBackColor = true;
            this.btn_FindExam.Click += new System.EventHandler(this.btn_FindExam_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(96, 17);
            this.label2.TabIndex = 4;
            this.label2.Text = "Exam Number";
            // 
            // txt_ExamNo
            // 
            this.txt_ExamNo.Location = new System.Drawing.Point(153, 27);
            this.txt_ExamNo.Name = "txt_ExamNo";
            this.txt_ExamNo.Size = new System.Drawing.Size(100, 22);
            this.txt_ExamNo.TabIndex = 5;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.txt_ExamNo);
            this.panel2.Controls.Add(this.label2);
            this.panel2.Controls.Add(this.btn_FindExam);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel2.Location = new System.Drawing.Point(0, 0);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(1342, 70);
            this.panel2.TabIndex = 4;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1342, 742);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.crystalReportViewer);
            this.Name = "Form1";
            this.Text = "Form1";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Form1_Load);
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer;
        private System.Windows.Forms.Button btn_FindExam;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txt_ExamNo;
        private System.Windows.Forms.Panel panel2;
    }
}

