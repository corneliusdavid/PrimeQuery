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
    method AddPrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    property PrimeList: List<UInt64>; notify;
    property MinPrimeNum: UInt64 := 1; notify;
    property MaxPrimeNum: UInt64 := 1000; notify;
    constructor ;
  end;

implementation

uses
  System.ServiceModel.Channels,
  PrimeQuery;

constructor PrimeNumListPage;
begin
  InitializeComponent();

  SaveCountText := txtTotalPrimes.Text;
  SaveElapsedText := txtElapsedTime.Text;

  PrimeList := new List<UInt64>;
  lstPrimes.DataContext := self;  
  grdPrimeList.DataContext := self;
end;

method PrimeNumListPage.btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
var
  PrimeNumLst: PrimeNumberList;
begin  
  try
    txtTotalPrimes.Visibility := Visibility.Visible;
    txtElapsedTime.Visibility := Visibility.Visible;
    lstPrimes.Visibility := Visibility.Visible;

    PrimeList.Clear;

    PrimeNumLst := new PrimeNumberList;
    PrimeNumLst.MinNumber := MinPrimeNum;
    PrimeNumLst.MaxNumber := MaxPrimeNum;
    PrimeNumLst.OnFoundPrime += @AddPrimeFound;
    PrimeNumLst.Generate;

    txtTotalPrimes.Visibility := Visibility.Visible;
    txtTotalPrimes.Text := SaveCountText + PrimeNumLst.Count.ToString;
    txtElapsedTime.Visibility := Visibility.Visible;
    txtElapsedTime.Text := SaveElapsedText + PrimeNumLst.ElapsedTime.ToString;
  except
    on Exception do
      MessageBox.Show('Error: ' + e.ToString);
  end;
end;

method PrimeNumListPage.AddPrimeFound(sender: Object; aEventArgs: EventArgs);
begin
  PrimeList.Add((sender as PrimeNumberList).Number);
end;

end.
