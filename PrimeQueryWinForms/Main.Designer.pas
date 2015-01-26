namespace PrimeQueryWinForms;

interface

{$HIDE H7}

uses
  System.Windows.Forms,
  System.Drawing;

type
  MainForm = partial class
  {$REGION Windows Form Designer generated fields}
  private
  {$region designer-generated code}
    button1: System.Windows.Forms.Button;
  {$endregion}
    components: System.ComponentModel.Container := nil;
    button2: System.Windows.Forms.Button;
    button3: System.Windows.Forms.Button;
    tableLayoutPanel1: System.Windows.Forms.TableLayoutPanel;
    panel1: System.Windows.Forms.Panel;
    button6: System.Windows.Forms.Button;
    button5: System.Windows.Forms.Button;
    button4: System.Windows.Forms.Button;
    button12: System.Windows.Forms.Button;
    button11: System.Windows.Forms.Button;
    button10: System.Windows.Forms.Button;
    button9: System.Windows.Forms.Button;
    button8: System.Windows.Forms.Button;
    button7: System.Windows.Forms.Button;
    button14: System.Windows.Forms.Button;
    button13: System.Windows.Forms.Button;
    method InitializeComponent;
  {$ENDREGION}
  end;

implementation

{$REGION Windows Form Designer generated code}
method MainForm.InitializeComponent;
begin
  var resources: System.ComponentModel.ComponentResourceManager := new System.ComponentModel.ComponentResourceManager(typeOf(MainForm));
  self.tableLayoutPanel1 := new System.Windows.Forms.TableLayoutPanel();
  self.panel1 := new System.Windows.Forms.Panel();
  self.button1 := new System.Windows.Forms.Button();
  self.button2 := new System.Windows.Forms.Button();
  self.button3 := new System.Windows.Forms.Button();
  self.button4 := new System.Windows.Forms.Button();
  self.button5 := new System.Windows.Forms.Button();
  self.button6 := new System.Windows.Forms.Button();
  self.button7 := new System.Windows.Forms.Button();
  self.button8 := new System.Windows.Forms.Button();
  self.button9 := new System.Windows.Forms.Button();
  self.button10 := new System.Windows.Forms.Button();
  self.button11 := new System.Windows.Forms.Button();
  self.button12 := new System.Windows.Forms.Button();
  self.button13 := new System.Windows.Forms.Button();
  self.button14 := new System.Windows.Forms.Button();
  self.tableLayoutPanel1.SuspendLayout();
  //self.SuspendLayout();
  //  tableLayoutPanel1
  self.tableLayoutPanel1.Anchor := ((System.Windows.Forms.AnchorStyles.Top or System.Windows.Forms.AnchorStyles.Left) or System.Windows.Forms.AnchorStyles.Right) as System.Windows.Forms.AnchorStyles;
  self.tableLayoutPanel1.AutoSize := true;
  self.tableLayoutPanel1.ColumnCount := 3;
  self.tableLayoutPanel1.ColumnStyles.&Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33));
  self.tableLayoutPanel1.ColumnStyles.&Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 34));
  self.tableLayoutPanel1.ColumnStyles.&Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 33));
  self.tableLayoutPanel1.Controls.&Add(self.button14, 0, 4);
  self.tableLayoutPanel1.Controls.&Add(self.button13, 0, 4);
  self.tableLayoutPanel1.Controls.&Add(self.button12, 0, 3);
  self.tableLayoutPanel1.Controls.&Add(self.button11, 0, 3);
  self.tableLayoutPanel1.Controls.&Add(self.button10, 0, 3);
  self.tableLayoutPanel1.Controls.&Add(self.button9, 0, 2);
  self.tableLayoutPanel1.Controls.&Add(self.button8, 0, 2);
  self.tableLayoutPanel1.Controls.&Add(self.button7, 0, 2);
  self.tableLayoutPanel1.Controls.&Add(self.button3, 0, 1);
  self.tableLayoutPanel1.Controls.&Add(self.button2, 0, 1);
  self.tableLayoutPanel1.Controls.&Add(self.button1, 0, 0);
  self.tableLayoutPanel1.Controls.&Add(self.button5, 2, 0);
  self.tableLayoutPanel1.Controls.&Add(self.button4, 1, 0);
  self.tableLayoutPanel1.Controls.&Add(self.button6, 2, 1);
  self.tableLayoutPanel1.Location := new System.Drawing.Point(0, 79);
  self.tableLayoutPanel1.Name := 'tableLayoutPanel1';
  self.tableLayoutPanel1.RowCount := 5;
  self.tableLayoutPanel1.RowStyles.&Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 100));
  self.tableLayoutPanel1.RowStyles.&Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 100));
  self.tableLayoutPanel1.RowStyles.&Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 100));
  self.tableLayoutPanel1.RowStyles.&Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 100));
  self.tableLayoutPanel1.RowStyles.&Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 100));
  self.tableLayoutPanel1.Size := new System.Drawing.Size(304, 500);
  self.tableLayoutPanel1.TabIndex := 3;
  //  panel1
  self.panel1.Dock := System.Windows.Forms.DockStyle.Top;
  self.panel1.Location := new System.Drawing.Point(0, 0);
  self.panel1.Name := 'panel1';
  self.panel1.Size := new System.Drawing.Size(304, 73);
  self.panel1.TabIndex := 4;
  //  button1
  self.button1.BackColor := System.Drawing.Color.DarkBlue;
  self.button1.Font := new System.Drawing.Font('Century Gothic', 16, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button1.ForeColor := System.Drawing.Color.BlanchedAlmond;
  self.button1.Location := new System.Drawing.Point(15, 15);
  self.button1.Margin := new System.Windows.Forms.Padding(15);
  self.button1.Name := 'button1';
  self.button1.Size := new System.Drawing.Size(70, 60);
  self.button1.TabIndex := 1;
  self.button1.Text := 'Clr';
  self.button1.UseVisualStyleBackColor := false;
  //  button2
  self.button2.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button2.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button2.ForeColor := System.Drawing.Color.DarkBlue;
  self.button2.Location := new System.Drawing.Point(15, 115);
  self.button2.Margin := new System.Windows.Forms.Padding(15);
  self.button2.Name := 'button2';
  self.button2.Size := new System.Drawing.Size(60, 60);
  self.button2.TabIndex := 2;
  self.button2.Text := '1';
  self.button2.UseVisualStyleBackColor := false;
  self.button2.Click += new System.EventHandler(@self.button2_Click);
  //  button3
  self.button3.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button3.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button3.ForeColor := System.Drawing.Color.DarkBlue;
  self.button3.Location := new System.Drawing.Point(115, 115);
  self.button3.Margin := new System.Windows.Forms.Padding(15);
  self.button3.Name := 'button3';
  self.button3.Size := new System.Drawing.Size(60, 60);
  self.button3.TabIndex := 2;
  self.button3.Text := '2';
  self.button3.UseVisualStyleBackColor := false;
  //  button4
  self.button4.BackColor := System.Drawing.Color.DarkBlue;
  self.button4.Font := new System.Drawing.Font('Century Gothic', 14, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button4.ForeColor := System.Drawing.Color.BlanchedAlmond;
  self.button4.Location := new System.Drawing.Point(115, 15);
  self.button4.Margin := new System.Windows.Forms.Padding(15);
  self.button4.Name := 'button4';
  self.button4.Size := new System.Drawing.Size(73, 60);
  self.button4.TabIndex := 4;
  self.button4.Text := 'Bksp';
  self.button4.UseVisualStyleBackColor := false;
  //  button5
  self.button5.BackColor := System.Drawing.Color.DarkBlue;
  self.button5.Font := new System.Drawing.Font('Century Gothic', 14, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button5.ForeColor := System.Drawing.Color.BlanchedAlmond;
  self.button5.Location := new System.Drawing.Point(218, 15);
  self.button5.Margin := new System.Windows.Forms.Padding(15);
  self.button5.Name := 'button5';
  self.button5.Size := new System.Drawing.Size(71, 60);
  self.button5.TabIndex := 5;
  self.button5.Text := 'Info';
  self.button5.UseVisualStyleBackColor := false;
  //  button6
  self.button6.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button6.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button6.ForeColor := System.Drawing.Color.DarkBlue;
  self.button6.Location := new System.Drawing.Point(218, 115);
  self.button6.Margin := new System.Windows.Forms.Padding(15);
  self.button6.Name := 'button6';
  self.button6.Size := new System.Drawing.Size(60, 60);
  self.button6.TabIndex := 6;
  self.button6.Text := '3';
  self.button6.UseVisualStyleBackColor := false;
  //  button7
  self.button7.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button7.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button7.ForeColor := System.Drawing.Color.DarkBlue;
  self.button7.Location := new System.Drawing.Point(15, 215);
  self.button7.Margin := new System.Windows.Forms.Padding(15);
  self.button7.Name := 'button7';
  self.button7.Size := new System.Drawing.Size(60, 60);
  self.button7.TabIndex := 7;
  self.button7.Text := '6';
  self.button7.UseVisualStyleBackColor := false;
  //  button8
  self.button8.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button8.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button8.ForeColor := System.Drawing.Color.DarkBlue;
  self.button8.Location := new System.Drawing.Point(218, 215);
  self.button8.Margin := new System.Windows.Forms.Padding(15);
  self.button8.Name := 'button8';
  self.button8.Size := new System.Drawing.Size(60, 60);
  self.button8.TabIndex := 8;
  self.button8.Text := '5';
  self.button8.UseVisualStyleBackColor := false;
  //  button9
  self.button9.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button9.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button9.ForeColor := System.Drawing.Color.DarkBlue;
  self.button9.Location := new System.Drawing.Point(115, 215);
  self.button9.Margin := new System.Windows.Forms.Padding(15);
  self.button9.Name := 'button9';
  self.button9.Size := new System.Drawing.Size(60, 60);
  self.button9.TabIndex := 9;
  self.button9.Text := '4';
  self.button9.UseVisualStyleBackColor := false;
  //  button10
  self.button10.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button10.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button10.ForeColor := System.Drawing.Color.DarkBlue;
  self.button10.Location := new System.Drawing.Point(218, 315);
  self.button10.Margin := new System.Windows.Forms.Padding(15);
  self.button10.Name := 'button10';
  self.button10.Size := new System.Drawing.Size(60, 60);
  self.button10.TabIndex := 10;
  self.button10.Text := '9';
  self.button10.UseVisualStyleBackColor := false;
  //  button11
  self.button11.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button11.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button11.ForeColor := System.Drawing.Color.DarkBlue;
  self.button11.Location := new System.Drawing.Point(115, 315);
  self.button11.Margin := new System.Windows.Forms.Padding(15);
  self.button11.Name := 'button11';
  self.button11.Size := new System.Drawing.Size(60, 60);
  self.button11.TabIndex := 11;
  self.button11.Text := '8';
  self.button11.UseVisualStyleBackColor := false;
  //  button12
  self.button12.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button12.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button12.ForeColor := System.Drawing.Color.DarkBlue;
  self.button12.Location := new System.Drawing.Point(15, 315);
  self.button12.Margin := new System.Windows.Forms.Padding(15);
  self.button12.Name := 'button12';
  self.button12.Size := new System.Drawing.Size(60, 60);
  self.button12.TabIndex := 12;
  self.button12.Text := '7';
  self.button12.UseVisualStyleBackColor := false;
  //  button13
  self.button13.BackColor := System.Drawing.Color.DarkBlue;
  self.tableLayoutPanel1.SetColumnSpan(self.button13, 2);
  self.button13.Font := new System.Drawing.Font('Century Gothic', 14, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button13.ForeColor := System.Drawing.Color.BlanchedAlmond;
  self.button13.Location := new System.Drawing.Point(115, 415);
  self.button13.Margin := new System.Windows.Forms.Padding(15);
  self.button13.Name := 'button13';
  self.button13.Size := new System.Drawing.Size(147, 60);
  self.button13.TabIndex := 13;
  self.button13.Text := 'Check!';
  self.button13.UseVisualStyleBackColor := false;
  //  button14
  self.button14.BackColor := System.Drawing.Color.BlanchedAlmond;
  self.button14.Font := new System.Drawing.Font('Century Gothic', 18, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, 0 as System.Byte);
  self.button14.ForeColor := System.Drawing.Color.DarkBlue;
  self.button14.Location := new System.Drawing.Point(15, 415);
  self.button14.Margin := new System.Windows.Forms.Padding(15);
  self.button14.Name := 'button14';
  self.button14.Size := new System.Drawing.Size(60, 60);
  self.button14.TabIndex := 14;
  self.button14.Text := '0';
  self.button14.UseVisualStyleBackColor := false;
  //  MainForm
  self.BackColor := System.Drawing.Color.Black;
  self.ClientSize := new System.Drawing.Size(304, 586);
  self.Controls.&Add(self.panel1);
  self.Controls.&Add(self.tableLayoutPanel1);
  self.Icon := resources.GetObject('$this.Icon') as System.Drawing.Icon;
  self.MaximizeBox := false;
  self.MinimizeBox := false;
  self.Name := 'MainForm';
  self.Text := 'Prime Query';
  self.tableLayoutPanel1.ResumeLayout(false);
  self.ResumeLayout(false);
  self.PerformLayout();
end;
{$ENDREGION}

end.
