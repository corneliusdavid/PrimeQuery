namespace PrimeQueryWP8;

interface

uses
  System,
  System.Collections.Generic,
  System.Linq,
  System.Net,
  System.Windows,
  System.Windows.Controls,
  System.Windows.Navigation,
  Microsoft.Phone.Controls,
  Microsoft.Phone.Shell;

type
  PrimeNumListPage = public partial class(PhoneApplicationPage)
  private
    method btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
    SaveCountText: String;
    SaveElapsedText: String;
  protected
    //method ListPrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    constructor ;
  end;

implementation

uses
  PrimeQuery;

constructor PrimeNumListPage;
begin
  InitializeComponent();

  SaveCountText := txtTotalPrimes.Text;
  SaveElapsedText := txtElapsedTime.Text;
end;

method PrimeNumListPage.btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
var
  PrimeNumLst: PrimeNumberList;
  MinPrime, MaxPrime: UInt64;
begin
  PrimeNumLst := new PrimeNumberList;

  UInt64.TryParse(txtStartNum.Text, out MinPrime);
  UInt64.TryParse(txtEndNum.Text, out MaxPrime);

  try
    txtTotalPrimes.Visibility := Visibility.Visible;
    txtElapsedTime.Visibility := Visibility.Visible;
    lstPrimes.Visibility := Visibility.Visible;

{
    lstPrimes. Items.Clear;

    PrimeNumLst.MinNumber := MinPrime;
    PrimeNumLst.MaxNumber := MaxPrime;
    PrimeNumLst.OnFoundPrime += @ListPrimeFound;
    PrimeNumLst.Generate;
}
    txtTotalPrimes.Visibility := Visibility.Visible;
    txtTotalPrimes.Text := SaveCountText + PrimeNumLst.Count.ToString;
    txtElapsedTime.Visibility := Visibility.Visible;
    txtElapsedTime.Text := SaveElapsedText + PrimeNumLst.ElapsedTime.ToString;
  except
    on Exception do
      MessageBox.Show('Error: ' + e.ToString);
  end;
end;

end.
