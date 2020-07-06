namespace GetStudentGrades
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
			this.crystalReportViewer1 = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
			this.panel1 = new System.Windows.Forms.Panel();
			this.FindStudGrades = new System.Windows.Forms.Button();
			this.StdID = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// crystalReportViewer1
			// 
			this.crystalReportViewer1.ActiveViewIndex = -1;
			this.crystalReportViewer1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.crystalReportViewer1.Cursor = System.Windows.Forms.Cursors.Default;
			this.crystalReportViewer1.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.crystalReportViewer1.Location = new System.Drawing.Point(0, -219);
			this.crystalReportViewer1.Name = "crystalReportViewer1";
			this.crystalReportViewer1.Size = new System.Drawing.Size(1178, 850);
			this.crystalReportViewer1.TabIndex = 12;
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.FindStudGrades);
			this.panel1.Controls.Add(this.StdID);
			this.panel1.Controls.Add(this.label2);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(1178, 100);
			this.panel1.TabIndex = 13;
			// 
			// FindStudGrades
			// 
			this.FindStudGrades.Location = new System.Drawing.Point(292, 24);
			this.FindStudGrades.Name = "FindStudGrades";
			this.FindStudGrades.Size = new System.Drawing.Size(162, 40);
			this.FindStudGrades.TabIndex = 9;
			this.FindStudGrades.Text = "Show Grades";
			this.FindStudGrades.UseVisualStyleBackColor = true;
			this.FindStudGrades.Click += new System.EventHandler(this.FindStudGrades_Click);
			// 
			// StdID
			// 
			this.StdID.Location = new System.Drawing.Point(145, 33);
			this.StdID.Name = "StdID";
			this.StdID.Size = new System.Drawing.Size(107, 22);
			this.StdID.TabIndex = 10;
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(17, 36);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(74, 17);
			this.label2.TabIndex = 11;
			this.label2.Text = "Student ID";
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1178, 631);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.crystalReportViewer1);
			this.Name = "Form1";
			this.Text = "Form1";
			this.panel1.ResumeLayout(false);
			this.panel1.PerformLayout();
			this.ResumeLayout(false);

        }

        #endregion
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TextBox StdID;
        private System.Windows.Forms.Label label2;
		private System.Windows.Forms.Button FindStudGrades;
	}
}

