namespace GetInstCourses
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
			this.panel1 = new System.Windows.Forms.Panel();
			this.label1 = new System.Windows.Forms.Label();
			this.InstID = new System.Windows.Forms.TextBox();
			this.FindCourses = new System.Windows.Forms.Button();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// crystalReportViewer
			// 
			this.crystalReportViewer.ActiveViewIndex = -1;
			this.crystalReportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.crystalReportViewer.Cursor = System.Windows.Forms.Cursors.Default;
			this.crystalReportViewer.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.crystalReportViewer.Location = new System.Drawing.Point(0, -230);
			this.crystalReportViewer.Name = "crystalReportViewer";
			this.crystalReportViewer.Size = new System.Drawing.Size(1180, 850);
			this.crystalReportViewer.TabIndex = 9;
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.FindCourses);
			this.panel1.Controls.Add(this.InstID);
			this.panel1.Controls.Add(this.label1);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(1180, 87);
			this.panel1.TabIndex = 10;
			// 
			// label1
			// 
			this.label1.AutoSize = true;
			this.label1.Location = new System.Drawing.Point(41, 23);
			this.label1.Name = "label1";
			this.label1.Size = new System.Drawing.Size(84, 17);
			this.label1.TabIndex = 8;
			this.label1.Text = "Instructor ID";
			// 
			// InstID
			// 
			this.InstID.Location = new System.Drawing.Point(186, 20);
			this.InstID.Name = "InstID";
			this.InstID.Size = new System.Drawing.Size(107, 22);
			this.InstID.TabIndex = 7;
			// 
			// FindCourses
			// 
			this.FindCourses.Location = new System.Drawing.Point(333, 11);
			this.FindCourses.Name = "FindCourses";
			this.FindCourses.Size = new System.Drawing.Size(162, 40);
			this.FindCourses.TabIndex = 6;
			this.FindCourses.Text = "Show Courses";
			this.FindCourses.UseVisualStyleBackColor = true;
			this.FindCourses.Click += new System.EventHandler(this.FindCourses_Click);
			// 
			// Form1
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1180, 620);
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
		private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Button FindCourses;
		private System.Windows.Forms.TextBox InstID;
		private System.Windows.Forms.Label label1;
	}
}

