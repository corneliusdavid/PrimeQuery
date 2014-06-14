namespace PrimeQueryWP8;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net,
  System.Windows,
  System.Windows.Shapes,
  System.Windows.Controls,
  System.Windows.Media,
  System.Windows.Navigation,
  Microsoft.Phone.Controls,
  Microsoft.Phone.Shell,
  PrimeQueryWP8.Resources;

type
  MainPage = public partial class(PhoneApplicationPage)
  private
    ClearDisplay: Boolean;
    method btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method DigitClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnPrimeCheck(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method Clear;
    method ProcessDigitClick(const DigitClicked: String);
  public
    // Constructor
    constructor ;

  end;

implementation

uses
  PrimeQuery;

constructor MainPage;
begin
  InitializeComponent()

  // Sample code to localize the ApplicationBar
  //BuildLocalizedApplicationBar();
end;

method MainPage.btnBackspaceClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  if txtNumber.Text.Trim.Length > 1 then
    txtNumber.Text := txtNumber.Text.Substring(0, txtNumber.Text.Length - 1) + ' '
  else
    Clear;
end;

method MainPage.btnClearClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  Clear;  
end;

method MainPage.btnInfoClick(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  MessageBox.Show('Checks a number for primality.  By Cornelius Concepts, 2014');
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
      //lblPrime.Foreground :=  .Yellow;
      lblPrime.Text := txtNumber.Text.Trim + ' is a Prime Number!';
    end else begin
      //lblPrime.Foreground := Brushes.Turquoise;
      lblPrime.Text := txtNumber.Text.Trim + ' is not prime';
    end;

    ClearDisplay := True;
  end else
    MessageBox.Show('Not a valid number.');
end;

method MainPage.Clear;
begin
  txtNumber.Text := '0 ';
end;

method MainPage.ProcessDigitClick(DigitClicked: String);
begin
  if (txtNumber.Text.Trim = "0") or ClearDisplay then begin
    txtNumber.Text := DigitClicked;
    ClearDisplay := False;
  end else
    txtNumber.Text := txtNumber.Text.Trim + DigitClicked;
end;

//method MainPage.BuildLocalizedApplicationBar;
//begin
  // Set the page's ApplicationBar to a new instance of ApplicationBar.
  //ApplicationBar := new ApplicationBar();

  // Create a new button and set the text value to the localized string from AppResources.
  //var appBarButton: ApplicationBarIconButton := new ApplicationBarIconButton(new Uri('/Assets/AppBar/appbar.add.rest.png', UriKind.Relative));
  //appBarButton.Text := AppResources.AppBarButtonText;
  //ApplicationBar.Buttons.Add(appBarButton);

  // Create a new menu item with the localized string from AppResources.
  //var appBarMenuItem: ApplicationBarMenuItem := new ApplicationBarMenuItem(AppResources.AppBarMenuItemText);
  //ApplicationBar.MenuItems.Add(appBarMenuItem)
//end;

end.