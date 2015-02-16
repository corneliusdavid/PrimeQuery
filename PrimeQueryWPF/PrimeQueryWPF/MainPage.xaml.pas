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
    ClearDisplay: Boolean;
    method UpdateDisplay;
    method DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method Clear;
    method ProcessDigitClick(const DigitClicked: String);
  public
    constructor;
  end;
  
implementation


constructor MainPage;
begin
  InitializeComponent();
  ClearDisplay := False;

  APrimeQry := new PrimeNumberEdit;
  UpdateDisplay;
end;

method MainPage.ProcessDigitClick(const DigitClicked: String);
begin 
  if (txtNumber.Text.Trim = "0") or ClearDisplay then begin
    APrimeQry.AsString := DigitClicked;
    ClearDisplay := False;
  end else
    APrimeQry.AddDigit(DigitClicked);

  UpdateDisplay;
end;

method MainPage.DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  ProcessDigitClick(String((sender as Button).Content));
end;

method MainPage.btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if APrimeQry.Check then begin
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
  UpdateDisplay;
end;

method MainPage.btnBackspaceClick(sender: Object; e: RoutedEventArgs);
begin
  APrimeQry.Backspace;
  UpdateDisplay;
end;

method MainPage.btnInfoClick(sender: Object; e: RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2014');
end;

method MainPage.Clear;
begin
  APrimeQry.Clear;
  UpdateDisplay;
end;

method MainPage.UpdateDisplay;
begin
  txtNumber.Text := APrimeQry.AsString + ' ';
end;

end.
