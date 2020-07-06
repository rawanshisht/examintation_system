namespace AdvancedSQL
{
    partial class GetStudents
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
			this.FindStudents = new System.Windows.Forms.Button();
			this.DepartmentNumber = new System.Windows.Forms.TextBox();
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
			this.crystalReportViewer.Location = new System.Drawing.Point(0, -185);
			this.crystalReportViewer.Name = "crystalReportViewer";
			this.crystalReportViewer.Size = new System.Drawing.Size(1207, 850);
			this.crystalReportViewer.TabIndex = 3;
			// 
			// panel1
			// 
			this.panel1.Controls.Add(this.FindStudents);
			this.panel1.Controls.Add(this.DepartmentNumber);
			this.panel1.Controls.Add(this.label2);
			this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
			this.panel1.Location = new System.Drawing.Point(0, 0);
			this.panel1.Name = "panel1";
			this.panel1.Size = new System.Drawing.Size(1207, 100);
			this.panel1.TabIndex = 4;
			// 
			// FindStudents
			// 
			this.FindStudents.Location = new System.Drawing.Point(332, 30);
			this.FindStudents.Name = "FindStudents";
			this.FindStudents.Size = new System.Drawing.Size(162, 40);
			this.FindStudents.TabIndex = 0;
			this.FindStudents.Text = "Show Students";
			this.FindStudents.UseVisualStyleBackColor = true;
			this.FindStudents.Click += new System.EventHandler(this.FindStudents_Click);
			// 
			// DepartmentNumber
			// 
			this.DepartmentNumber.Location = new System.Drawing.Point(203, 39);
			this.DepartmentNumber.Name = "DepartmentNumber";
			this.DepartmentNumber.Size = new System.Drawing.Size(107, 22);
			this.DepartmentNumber.TabIndex = 1;
			// 
			// label2
			// 
			this.label2.AutoSize = true;
			this.label2.Location = new System.Drawing.Point(40, 42);
			this.label2.Name = "label2";
			this.label2.Size = new System.Drawing.Size(136, 17);
			this.label2.TabIndex = 2;
			this.label2.Text = "Department Number";
			// 
			// GetStudents
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(1207, 665);
			this.Controls.Add(this.panel1);
			this.Controls.Add(this.crystalReportViewer);
			this.Name = "GetStudents";
			this.Text = "GetStudents";
			this.panel1.ResumeLayout(false);
			this.panel1.PerformLayout();
			this.ResumeLayout(false);

        }

        #endregion
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crystalReportViewer;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button FindStudents;
        private System.Windows.Forms.TextBox DepartmentNumber;
        private System.Windows.Forms.Label label2;
    }
}