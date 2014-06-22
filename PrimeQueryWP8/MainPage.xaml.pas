namespace PrimeQueryWP8;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Media,
  System.Windows.Navigation,
  Microsoft.Phone.Controls,
  Microsoft.Phone.Shell,
  PrimeQueryWP8.Resources,
  PrimeQuery;

type
  MainPage = public partial class(PhoneApplicationPage)
  private
    fClearDisplay: Boolean;
    fPrimeQry: PrimeNumberQuery;
    method DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method ProcessDigitClick(const DigitClicked: String);
    method ProcessPrimeCheck;
  public
    // Constructor
    constructor ;

  end;

implementation

constructor MainPage;
begin
  InitializeComponent();

  fClearDisplay := False;
  fPrimeQry := new PrimeNumberQuery;
end;

method MainPage.DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  ProcessDigitClick(String((sender as Button).Content));
end;

method MainPage.btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  fPrimeQry.Clear;
  txtNumber.Text := fPrimeQry.AsString;
end;

method MainPage.btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if txtNumber.Text.Trim.Length > 1 then
    txtNumber.Text := txtNumber.Text.Substring(0, txtNumber.Text.Length - 1) + ' '
  else
    txtNumber.Text := '0'; 

  fPrimeQry.AsString := txtNumber.Text;
end;

method MainPage.btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2014');
end;

method MainPage.btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  ProcessPrimeCheck;
end;

method MainPage.ProcessDigitClick(DigitClicked: String);
begin
  if (txtNumber.Text.Trim = "0") or fClearDisplay then begin
    txtNumber.Text := DigitClicked;
    fClearDisplay := False;
  end else
    txtNumber.Text := txtNumber.Text.Trim + DigitClicked;

  fPrimeQry.AsString := txtNumber.Text;
end;

method MainPage.ProcessPrimeCheck;
begin
  if fPrimeQry.Check then 
    lblPrime.Text := txtNumber.Text.Trim + ' is a Prime Number!'
  else
    lblPrime.Text := txtNumber.Text.Trim + ' is not prime';

  fClearDisplay := True;
end;

end.