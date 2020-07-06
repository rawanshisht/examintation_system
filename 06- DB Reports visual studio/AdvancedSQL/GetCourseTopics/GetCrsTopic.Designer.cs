namespace GetCourseTopics
{
    partial class GetCrsTopic
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
			this.FindTopics = new System.Windows.Forms.Button();
			this.CourseCode = new System.Windows.Forms.TextBox();
			this.label2 = new System.Windows.Forms.Label();
			this.panel1.SuspendLayout();
			this.SuspendLayout();
			// 
			// crystalReportViewer
			// 
			this.crystalReportViewer.ActiveViewIndex = -1;
			this.crystalReportViewer.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
			this.crystalReportViewer.Cursor = System.Windows.Forms.Cursors.Default;
			this.crystalReportViewer.Dock = System.Windows.Forms.DockStyle.Bottom;
			this.crystalReportViewer.Location = new System.Drawing.Point(0, -209);
			this.crystalReportViewer.Name = "crystalReportViewer";
			this.crystalReportViewer.Size = new System.Drawing.Size(1174, 850);
			this.crystalReportViewer.TabIndex = 6;
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.FindTopics);
			this.panel1.Controls.Add(this.CourseCode);
			this.panel1.Controls.Add(this.label2);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(1174, 97);
			this.panel1.TabIndex = 7;
			// 
			// FindTopics
			// 
			this.FindTopics.Location = new System.Drawing.Point(390, 30);
			this.FindTopics.Name = "FindTopics";
			this.FindTopics.Size = new System.Drawing.Size(162, 40);
			this.FindTopics.TabIndex = 3;
			this.FindTopics.Text = "Show Topics";
			this.FindTopics.UseVisualStyleBackColor = true;
			this.FindTopics.Click += new System.EventHandler(this.FindTopics_Click);
			// 
			// CourseCode
			// 
			this.CourseCode.Location = new System.Drawing.Point(261, 39);
			this.CourseCode.Name = "CourseCode";
			this.CourseCode.Size = new System.Drawing.Size(107, 22);
			this.CourseCode.TabIndex = 4;
			this.CourseCode.TextChanged += new System.EventHandler(this.CourseCode_TextChanged);
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(98, 42);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(90, 17);
			this.label2.TabIndex = 5;
			this.label2.Text = "Course Code";
			this.label2.Click += new System.EventHandler(this.label1_Click);
			// 
			// GetCrsTopic
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1174, 641);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.crystalReportViewer);
			this.Name = "GetCrsTopic";
			this.Text = "Course Topics";
			this.Load += new System.EventHandler(this.GetCrsTopic_Load);
			this.panel1.ResumeLayout(false);
			this.panel1.PerformLayout();
			this.ResumeLayout(false);

        }

        #endregion
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer;
        private System.Windows.Forms.Panel panel1;
		private System.Windows.Forms.Button FindTopics;
		private System.Windows.Forms.TextBox CourseCode;
		private System.Windows.Forms.Label label2;
	}
}

