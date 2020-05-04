<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs)

    End Sub

    Protected Sub Menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        MultiView1.ActiveViewIndex = Menu1.SelectedValue
        GridView1.DataBind()
        If Menu1.SelectedValue = 3 Then
            Session.RemoveAll()
            Server.Transfer("login.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        GridView2.DataBind()
        Dim count
        count = GridView2.Rows.Count
        If count < 1 Then
            Label1.Text = "你沒有這個名稱的老婆"
        Else
            Label1.Text = ""
        End If

    End Sub

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    你好肥宅
         
        <br />
        <br />
        <br />
        <br />
        <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" OnMenuItemClick="Menu1_MenuItemClick" BorderColor="Blue">
            <Items>
                <asp:MenuItem Text="新增老婆" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="管理老婆" Value="1"></asp:MenuItem>
                            <asp:MenuItem Text="搜尋老婆" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="登出" Value="3"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <br />
        <br />
        <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
        

                        新增老婆 
                        <br />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:add %>" DeleteCommand="DELETE FROM [wife] WHERE [名稱] = ?" InsertCommand="INSERT INTO [wife] ([帳號], [名稱], [種族], [年齡], [生日], [性別]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:add.ProviderName %>" SelectCommand="SELECT * FROM [wife]" UpdateCommand="UPDATE [wife] SET [帳號] = ?, [種族] = ?, [年齡] = ?, [生日] = ?, [性別] = ? WHERE [名稱] = ?">
                            <DeleteParameters>
                                <asp:Parameter Name="名稱" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="帳號" Type="String" />
                                <asp:Parameter Name="名稱" Type="String" />
                                <asp:Parameter Name="種族" Type="String" />
                                <asp:Parameter Name="年齡" Type="String" />
                                <asp:Parameter Name="生日" Type="String" />
                                <asp:Parameter Name="性別" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="帳號" Type="String" />
                                <asp:Parameter Name="種族" Type="String" />
                                <asp:Parameter Name="年齡" Type="String" />
                                <asp:Parameter Name="生日" Type="String" />
                                <asp:Parameter Name="性別" Type="String" />
                                <asp:Parameter Name="名稱" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="名稱" DataSourceID="SqlDataSource2" DefaultMode="Insert" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Width="125px">
                            <Fields>
                                <asp:BoundField DataField="帳號" HeaderText="帳號" SortExpression="帳號" />
                                <asp:BoundField DataField="名稱" HeaderText="名稱" ReadOnly="True" SortExpression="名稱" />
                                <asp:BoundField DataField="種族" HeaderText="種族" SortExpression="種族" />
                                <asp:BoundField DataField="年齡" HeaderText="年齡" SortExpression="年齡" />
                                <asp:BoundField DataField="生日" HeaderText="生日" SortExpression="生日" />
                                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                                <asp:CommandField ShowInsertButton="True" />
                            </Fields>
                        </asp:DetailsView>

                </asp:View>
                <asp:View ID="View2" runat="server">
                                               管理老婆
                         
                                               <br />
                                               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:control %>" DeleteCommand="DELETE FROM [wife] WHERE [名稱] = ?" InsertCommand="INSERT INTO [wife] ([帳號], [名稱], [種族], [年齡], [生日], [性別]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:control.ProviderName %>" SelectCommand="SELECT * FROM [wife] WHERE ([帳號] = ?)" UpdateCommand="UPDATE [wife] SET [帳號] = ?, [種族] = ?, [年齡] = ?, [生日] = ?, [性別] = ? WHERE [名稱] = ?">
                                                   <DeleteParameters>
                                                       <asp:Parameter Name="名稱" Type="String" />
                                                   </DeleteParameters>
                                                   <InsertParameters>
                                                       <asp:Parameter Name="帳號" Type="String" />
                                                       <asp:Parameter Name="名稱" Type="String" />
                                                       <asp:Parameter Name="種族" Type="String" />
                                                       <asp:Parameter Name="年齡" Type="String" />
                                                       <asp:Parameter Name="生日" Type="String" />
                                                       <asp:Parameter Name="性別" Type="String" />
                                                   </InsertParameters>
                                                   <SelectParameters>
                                                       <asp:SessionParameter Name="帳號" SessionField="username" Type="String" />
                                                   </SelectParameters>
                                                   <UpdateParameters>
                                                       <asp:Parameter Name="帳號" Type="String" />
                                                       <asp:Parameter Name="種族" Type="String" />
                                                       <asp:Parameter Name="年齡" Type="String" />
                                                       <asp:Parameter Name="生日" Type="String" />
                                                       <asp:Parameter Name="性別" Type="String" />
                                                       <asp:Parameter Name="名稱" Type="String" />
                                                   </UpdateParameters>
                                               </asp:SqlDataSource>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="名稱" DataSourceID="SqlDataSource3">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                                <asp:BoundField DataField="帳號" HeaderText="帳號" SortExpression="帳號" />
                                <asp:BoundField DataField="名稱" HeaderText="名稱" SortExpression="名稱" ReadOnly="True" />
                                <asp:BoundField DataField="種族" HeaderText="種族" SortExpression="種族" />
                                <asp:BoundField DataField="年齡" HeaderText="年齡" SortExpression="年齡" />
                                <asp:BoundField DataField="生日" HeaderText="生日" SortExpression="生日" />
                                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                            </Columns>
                        </asp:GridView>
                    </asp:View>

                <asp:View ID="View3" runat="server">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="查詢" OnClick="Button1_Click" />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:find %>" ProviderName="<%$ ConnectionStrings:find.ProviderName %>" SelectCommand="SELECT * FROM [wife] WHERE (([帳號] = ?) AND ([名稱] = ?))">
                        <SelectParameters>
                            <asp:SessionParameter Name="帳號" SessionField="username" Type="String" />
                            <asp:ControlParameter ControlID="TextBox1" Name="名稱" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <br />
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="名稱" DataSourceID="SqlDataSource1">
                        <Columns>
                            <asp:BoundField DataField="帳號" HeaderText="帳號" SortExpression="帳號" />
                            <asp:BoundField DataField="名稱" HeaderText="名稱" ReadOnly="True" SortExpression="名稱" />
                            <asp:BoundField DataField="種族" HeaderText="種族" SortExpression="種族" />
                            <asp:BoundField DataField="年齡" HeaderText="年齡" SortExpression="年齡" />
                            <asp:BoundField DataField="生日" HeaderText="生日" SortExpression="生日" />
                            <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                        </Columns>
                    </asp:GridView>
                     <asp:Label ID="Label1" runat="server" Text=" "></asp:Label>

                </asp:View>
               <asp:View ID="View4" runat="server"></asp:View>

        </asp:MultiView>

        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
