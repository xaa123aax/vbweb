<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">
    Sub page_load()
        question_total.Text = 10
        studentNo.Text = Session("username")
        If Button2.Enabled = True Then
            Start_div.Visible = True
        Else
            Start_div.Visible = False
            Over_div.Visible = True
        End If

    End Sub
    Sub ran()
        Dim generator As New Random
        add1.Text = generator.Next(1, 10)
        add2.Text = generator.Next(1, 10)
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Start_div.Visible = True
        Pre_div.Visible = False

        Button2.Enabled = True
        ran()
        No.Text = CInt(1)
        total.Text = CInt(0)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        If Val(answer.Text) = CInt(add1.Text) + CInt(add2.Text) Then
            total.Text = CInt(total.Text) + 10
        End If
        answer.Text = ""
        ran()
        No.Text = CInt(No.Text) + 1
        If CInt(No.Text) > CInt(question_total.Text) Then
            Start_div.Visible = False
            Over_div.Visible = True
            message.Text = "測驗結束，測驗成績：" & total.Text
            Button1.Enabled = False
            Button2.Enabled = False
            No.Text = ""
            add1.Text = "被加數"
            add2.Text = "加數"
            go_back.Visible = True
        End If
    End Sub

    Sub WriteToTest()
        'Dim test_id As String = Session("userid")
        Dim test_id As String = Session("username")
        Dim test_subject As String = "數學"
        '將日期傳成字串
        Dim test_date As String = Now
        Dim test_score As Integer = CInt(total.Text)

        Dim insert_data As String
        insert_data = "INSERT INTO score (學號, 測驗學科, 測驗日期, 測驗成績) VALUES ( '" & test_id & "',' " & test_subject & "', '" & test_date & "'," & test_score & ")"
        SqlDataSource1.InsertCommand = insert_data
        SqlDataSource1.Insert()
    End Sub

    Protected Sub go_back_Click(sender As Object, e As EventArgs)
        WriteToTest()
        Server.Transfer("login.aspx")
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

        線上測驗</div>

        <div ID="Pre_div" runat="server">
        <asp:Label ID="studentNo" runat="server" Text=""></asp:Label>
        號同學 你好：<br />
        本測驗總共10題，每題10分，總計100分<br />
        準備好了嗎?
        <asp:Button ID="Button1" runat="server" Text="開始測驗" OnClick="Button1_Click" />
        <br />
            </div>
        <br />

        <div ID="Start_div" runat="server">
        
        第<asp:Label ID="No" runat="server" Text=""></asp:Label>
        &nbsp;/
        <asp:Label ID="question_total" runat="server" Text=""></asp:Label>
        題：<asp:Label ID="add1" runat="server" Text="被加數"></asp:Label>
    &nbsp;+
        <asp:Label ID="add2" runat="server" Text="加數"></asp:Label>
    &nbsp;=&nbsp;&nbsp;
        <asp:TextBox ID="answer" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="Button2" runat="server" Text="確認" OnClick="Button2_Click" Enabled="False" />
        <br />
            </div>

        <div ID="Over_div" runat="server">
        <asp:Label ID="message" runat="server" Text=""></asp:Label>
        <br />
            
        <br />
        <asp:Button ID="go_back" runat="server" Text="結束測驗" OnClick="go_back_Click" Visible="False" />
        <br />
        <br />
            
            </div>            
        妳的得分：<asp:Label ID="total" runat="server" Text=""></asp:Label>

            
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:teset %>" ProviderName="<%$ ConnectionStrings:teset.ProviderName %>" SelectCommand="SELECT * FROM [score]">
        </asp:SqlDataSource>
        <br />
     
    </form>
</body>
</html>
