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
    fPrimeQry: PrimeNumberEdit;
    method DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method UpdateWhenChanged(sender: System.Object; aEventArgs: EventArgs);
  public
    constructor ;
  end;

implementation

constructor MainPage;
begin
  InitializeComponent();

  fClearDisplay := False;
  fPrimeQry := new PrimeNumberEdit;
  fPrimeQry.NumberChanged += @UpdateWhenChanged;
end;

method MainPage.DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if fClearDisplay then begin
    fClearDisplay := false;
    fPrimeQry.Clear;
  end;

  fPrimeQry.AddDigit(String((sender as Button).Content));
end;

method MainPage.btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  fPrimeQry.Clear;
end;

method MainPage.btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  fPrimeQry.Backspace;
end;

method MainPage.btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if fPrimeQry.IsPrime then
    lblPrime.Text := fPrimeQry.AsString + ' is a Prime Number!'
  else
    lblPrime.Text := fPrimeQry.AsString + ' is not prime';

  fClearDisplay := true;
end;

method MainPage.btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2015');
end;

method MainPage.UpdateWhenChanged(sender: System.Object; aEventArgs: EventArgs);
begin
  txtNumber.Text := fPrimeQry.AsString;
end;

end.