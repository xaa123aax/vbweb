<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Page_Load(sender As Object, e As EventArgs)

    End Sub

    Protected Sub login_Click(sender As Object, e As EventArgs)
        GridView1.DataBind()
        If GridView1.Rows.Count < 1 Then
            message.Text = "帳號或密碼輸入錯誤，請重新輸入資料。"
        Else
            message.Text = "歡迎進入快樂國小!"
        End If
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
            text-align:center
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="width:20%;" border="1">
            <tr>
                <td  class="auto-style1">ADT105112學生資料管理系統</td>                
            </tr>
            <tr>
                <td class="auto-style1"></td>                
            </tr>
            <tr>
                <td class="auto-style1">帳號:<asp:TextBox ID="username" runat="server"></asp:TextBox>(1)</td>                
            </tr>
            <tr>
                <td class="auto-style1">密碼:<asp:TextBox ID="password" runat="server"></asp:TextBox>(123)</td>                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="login" runat="server" Text="確認" OnClick="login_Click" />
                </td>                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="message" runat="server" Text=""></asp:Label>

                </td>                
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [personal] WHERE (([學號] = ?) AND ([密碼] = ?))">
            <SelectParameters>
                <asp:ControlParameter ControlID="username" Name="學號" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="password" Name="密碼" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="學號" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="學號" HeaderText="學號" ReadOnly="True" SortExpression="學號" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性別" HeaderText="性別" SortExpression="性別" />
                <asp:BoundField DataField="電話" HeaderText="電話" SortExpression="電話" />
                <asp:BoundField DataField="地址" HeaderText="地址" SortExpression="地址" />
                <asp:BoundField DataField="電子郵件" HeaderText="電子郵件" SortExpression="電子郵件" />
                <asp:BoundField DataField="age" HeaderText="age" SortExpression="age" />
                <asp:BoundField DataField="密碼" HeaderText="密碼" SortExpression="密碼" />
            </Columns>
        </asp:GridView>
    </div>
    </form>
</body>
</html>
