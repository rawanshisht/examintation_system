namespace ExamWithStudAnswersReport6
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
			this.label1 = new System.Windows.Forms.Label();
			this.label2 = new System.Windows.Forms.Label();
			this.txt_ExamNo = new System.Windows.Forms.TextBox();
			this.txt_StdID = new System.Windows.Forms.TextBox();
			this.btn_Print = new System.Windows.Forms.Button();
			this.panel1 = new System.Windows.Forms.Panel();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// crystalReportViewer
			// 
			this.crystalReportViewer.ActiveViewIndex = -1;
			this.crystalReportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.crystalReportViewer.Cursor = System.Windows.Forms.Cursors.Default;
			this.crystalReportViewer.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.crystalReportViewer.Location = new System.Drawing.Point(0, -89);
			this.crystalReportViewer.Name = "crystalReportViewer";
			this.crystalReportViewer.Size = new System.Drawing.Size(1022, 850);
			this.crystalReportViewer.TabIndex = 4;
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(14, 26);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(100, 17);
			this.label1.TabIndex = 0;
			this.label1.Text = "Exam Number:";
			this.label1.Click += new System.EventHandler(this.label1_Click);
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(259, 31);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(78, 17);
			this.label2.TabIndex = 1;
			this.label2.Text = "Student ID:";
			this.label2.Click += new System.EventHandler(this.label2_Click);
			// 
			// txt_ExamNo
			// 
			this.txt_ExamNo.Location = new System.Drawing.Point(129, 26);
			this.txt_ExamNo.Name = "txt_ExamNo";
			this.txt_ExamNo.Size = new System.Drawing.Size(100, 22);
			this.txt_ExamNo.TabIndex = 2;
			this.txt_ExamNo.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
			// 
			// txt_StdID
			// 
			this.txt_StdID.Location = new System.Drawing.Point(343, 31);
			this.txt_StdID.Name = "txt_StdID";
			this.txt_StdID.Size = new System.Drawing.Size(122, 22);
			this.txt_StdID.TabIndex = 0;
			// 
			// btn_Print
			// 
			this.btn_Print.Location = new System.Drawing.Point(509, 31);
			this.btn_Print.Name = "btn_Print";
			this.btn_Print.Size = new System.Drawing.Size(112, 28);
			this.btn_Print.TabIndex = 3;
			this.btn_Print.Text = "Print";
			this.btn_Print.UseVisualStyleBackColor = true;
			this.btn_Print.Click += new System.EventHandler(this.btn_Print_Click);
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.label1);
			this.panel1.Controls.Add(this.txt_ExamNo);
			this.panel1.Controls.Add(this.btn_Print);
			this.panel1.Controls.Add(this.label2);
			this.panel1.Controls.Add(this.txt_StdID);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(1022, 84);
			this.panel1.TabIndex = 5;
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1022, 761);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.crystalReportViewer);
			this.Name = "Form1";
			this.Text = "Form1";
			this.panel1.ResumeLayout(false);
			this.panel1.PerformLayout();
			this.ResumeLayout(false);

        }

        #endregion
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txt_ExamNo;
        private System.Windows.Forms.TextBox txt_StdID;
        private System.Windows.Forms.Button btn_Print;
        private System.Windows.Forms.Panel panel1;
    }
}

