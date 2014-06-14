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
  System.Windows.Shapes;

type
  MainPage = public partial class(System.Windows.Window)
  private
    ClearDisplay: Boolean;
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

uses
  PrimeQuery;

constructor MainPage;
begin
  InitializeComponent();
  ClearDisplay := False;
end;

method MainPage.ProcessDigitClick(const DigitClicked: String);
begin
  if (txtNumber.Text.Trim = "0") or ClearDisplay then begin
    txtNumber.Text := DigitClicked;
    ClearDisplay := False;
  end else
    txtNumber.Text := txtNumber.Text.Trim + DigitClicked;
end;

method MainPage.DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  ProcessDigitClick(String((sender as Button).Content));
end;

method MainPage.btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
var
  n: Integer;
begin
  if Integer.TryParse(txtNumber.Text, out n) then begin
    if PrimeNumberQuery.IsPrime(n) then begin
      lblPrime.Foreground := Brushes.Yellow;
      lblPrime.Content := txtNumber.Text.Trim + ' is a Prime Number!';
    end else begin
      lblPrime.Foreground := Brushes.Turquoise;
      lblPrime.Content := txtNumber.Text.Trim + ' is not prime';
    end;

    ClearDisplay := True;
  end else
    MessageBox.Show('Not a valid number.');
end;

method MainPage.btnClearClick(sender: Object; e: RoutedEventArgs);
begin
  Clear;  
end;

method MainPage.btnBackspaceClick(sender: Object; e: RoutedEventArgs);
begin
  if txtNumber.Text.Trim.Length > 1 then
    txtNumber.Text := txtNumber.Text.Substring(0, txtNumber.Text.Length - 1) + ' '
  else
    Clear;
end;

method MainPage.btnInfoClick(sender: Object; e: RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2014');
end;

method MainPage.Clear;
begin
  txtNumber.Text := '0 ';
end;

end.
