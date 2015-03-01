namespace PrimeQueryWPF;

interface

uses
  System.Collections.Generic,
  System.Linq,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Data,
  System.Windows.Documents,
  System.Windows.Media,
  System.Windows.Navigation,
  System.Windows.Shapes,
  PrimeQuery;

type
  MainPage = public partial class(System.Windows.Window)
  private
    APrimeQry: PrimeNumberEdit;
    PrimesPage: PrimeListPage;
    ClearDisplay: Boolean;
    method DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnMoreClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnInfo(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method UpdateWhenChanged(sender: System.Object; aEventArgs: EventArgs);
  public
    constructor;
  end;
  
implementation


constructor MainPage;
begin
  InitializeComponent();

  PrimesPage := nil;
  ClearDisplay := False;

  APrimeQry := new PrimeNumberEdit;
  APrimeQry.NumberChanged += @UpdateWhenChanged;
end;

method MainPage.DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if ClearDisplay then begin
    APrimeQry.Clear;
    ClearDisplay := false;
  end;

  APrimeQry.AddDigit(String((sender as Button).Content));
end;

method MainPage.btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if APrimeQry.IsPrime then begin
    lblPrime.Foreground := Brushes.Yellow;
    lblPrime.Content := txtNumber.Text.Trim + ' is a Prime Number!';
  end else begin
    lblPrime.Foreground := Brushes.Turquoise;
    lblPrime.Content := txtNumber.Text.Trim + ' is not prime';
  end;

  ClearDisplay := True;
end;

method MainPage.btnClearClick(sender: Object; e: RoutedEventArgs);
begin
  APrimeQry.Clear;
end;

method MainPage.btnBackspaceClick(sender: Object; e: RoutedEventArgs);
begin
  APrimeQry.Backspace;
end;

method MainPage.btnMoreClick(sender: Object; e: RoutedEventArgs);
begin
  if not assigned(PrimesPage) then begin 
    PrimesPage := new PrimeListPage;
    PrimesPage.Owner := self;
    PrimesPage.Left := self.Left + self.Width;
  end;
    
  PrimesPage.ShowDialog;

  PrimesPage := nil;
end;

method MainPage.UpdateWhenChanged(sender: System.Object; aEventArgs: EventArgs);
begin
  txtNumber.Text := APrimeQry.AsString + ' ';
end;

method MainPage.btnInfo(sender: Object; e: RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2015');
end;

end.
