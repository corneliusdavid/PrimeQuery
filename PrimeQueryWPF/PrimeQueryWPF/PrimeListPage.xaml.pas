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
  PrimeListPage = public partial class(System.Windows.Window)
  private
    method txtEndNum_GotFocus(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method txtStartNum_GotFocus(sender: System.Object; e: System.Windows.RoutedEventArgs);
    method btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
  protected
    method ListPrimeFound(sender: System.Object; aEventArgs: EventArgs);
  public
    constructor;
  end;
  
implementation

uses
  PrimeQuery;

constructor PrimeListPage;
begin
  InitializeComponent();
end;

method PrimeListPage.btnGenerate_Click(sender: System.Object; e: System.Windows.RoutedEventArgs);
var
  PrimeNumLst: PrimeNumberList;
  MinPrime, MaxPrime: UInt64;
begin
  PrimeNumLst := new PrimeNumberList;

  UInt64.TryParse(txtStartNum.Text, out MinPrime);
  UInt64.TryParse(txtEndNum.Text, out MaxPrime);

  PrimeNumLst.MinNumber := MinPrime;
  PrimeNumLst.MaxNumber := MaxPrime;
  PrimeNumLst.OnFoundPrime += @ListPrimeFound;
  PrimeNumLst.Generate;
end;

method PrimeListPage.ListPrimeFound(sender: Object; aEventArgs: EventArgs);
begin
  lstPrimes.Items.Add((sender as PrimeNumberList).Number);
end;

method PrimeListPage.txtStartNum_GotFocus(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  txtStartNum.SelectAll;
end;

method PrimeListPage.txtEndNum_GotFocus(sender: System.Object; e: System.Windows.RoutedEventArgs);
begin
  txtEndNum.SelectAll;
end;
  
end.
