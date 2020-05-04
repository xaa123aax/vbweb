<%@ Page Language="VB" %>

<!DOCTYPE html>

<script runat="server">

    Protected Sub Button5_Click(sender As Object, e As EventArgs)
        Dim a = Val(TextBox4.Text)
        Dim b = Val(TextBox5.Text)

        Dim i, j

        For i = 1 To a
            Dim myRow As New TableRow()
            Table5.Rows.Add(myRow)
            For j = 1 To b
                Dim myCell As New TableCell()
                myCell.Text = i & "*" & j & "=" & i * j & " "
                myRow.Cells.Add(myCell)



            Next j


        Next i


    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs)

        Dim i, j

        For i = 1 To 9
            Dim myRow As New TableRow()
            Table1.Rows.Add(myRow)
            For j = 1 To 9
                Dim myCell As New TableCell()
                myCell.Text = i & "*" & j & "=" & i * j & " "
                myRow.Cells.Add(myCell)



            Next j


        Next i


    End Sub




    Protected Sub calculate_Click(sender As Object, e As EventArgs)
        total.Text = Val(chi.Text) + Val(eng.Text) + Val(math.Text)
        avg.Text = (Val(chi.Text) + Val(eng.Text) + Val(math.Text)) / 3
    End Sub


    Protected Sub menu1_MenuItemClick(sender As Object, e As MenuEventArgs)
        Multiview1.activeviewindex = menu1.SelectedValue
    End Sub

    Protected Sub Question_Click(sender As Object, e As EventArgs)
        Dim generator As New Random
        Dim randomValue1 As Integer
        Dim randomValue2 As Integer
        randomValue1 = generator.Next(Val(range1.Text), Val(range2.Text) + 1)
        randomValue2 = generator.Next(Val(range1.Text), Val(range2.Text) + 1)
        a.Text = randomValue1
        b.Text = randomValue2
        message.Text = ""
        answer.Text = ""
    End Sub

    Protected Sub TextBox1_TextChanged(sender As Object, e As EventArgs)

    End Sub

    Protected Sub check_Click(sender As Object, e As EventArgs)
        If String.IsNullOrEmpty(answer.Text) Then
            message.Text = "你還沒有作答 ! "

        ElseIf Val(answer.Text) = (Val(a.Text) + Val(b.Text)) Then
            message.Text = "完全正確 ! "
        Else
            message.Text = "再想想看吧 ! "

        End If

    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>



<body>
    <form id="form1" runat="server">

        <div>

            <asp:Menu runat="server" ID="menu1" OnMenuItemClick="menu1_MenuItemClick" Orientation="Horizontal" BackColor="#66CCFF" BorderColor="#66FF33" BorderStyle="Solid">
                <Items>

                    <asp:MenuItem Text="萬年曆" Value="0"></asp:MenuItem>
                    <asp:MenuItem Text="成績計算系統" Value="1"></asp:MenuItem>
                    <asp:MenuItem Text="自訂加法練習" Value="2"></asp:MenuItem>
                    <asp:MenuItem Text="九九乘法表" Value="3"></asp:MenuItem>
                    <asp:MenuItem Text="自訂九九乘法表" Value="4"></asp:MenuItem>
                </Items>
            </asp:Menu>
            <asp:MultiView ID="Multiview1" runat="server">
                <asp:View ID="View1" runat="server">
                    <asp:Calendar ID="Calendar1" runat="server">
                        <DayHeaderStyle ForeColor="#FF0000" />
                    </asp:Calendar>
                </asp:View>
                <asp:View ID="View2" runat="server">

                    <div>
                        <p>成績計算處理系統</p>
                        國文：<asp:TextBox ID="chi" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        英文：<asp:TextBox ID="eng" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        數學：<asp:TextBox ID="math" runat="server"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <asp:Button ID="calculate" runat="server" Text="計算成績" OnClick="calculate_Click" />
                        <hr />

                        總分：<asp:Label ID="total" runat="server" ></asp:Label>
                        <br />
                        平均：<asp:Label ID="avg" runat="server" ></asp:Label>

                    </div>

                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div>
                        <h2>數學加法練習系統</h2>
                        <asp:Button ID="Question" runat="server" Text="請出題" OnClick="Question_Click" />
                        <br />
                        <br />
                        測驗範圍 從 
        <asp:TextBox ID="range1" runat="server" OnTextChanged="TextBox1_TextChanged" Width="50px"></asp:TextBox>
                        &nbsp;到 
        <asp:TextBox ID="range2" runat="server" Width="50px"></asp:TextBox>
                        <br />
                        <br />
                        <br />
                        <hr />
                        <asp:Label ID="a" runat="server" Text="被加數"></asp:Label>
                        &nbsp;+
        <asp:Label ID="b" runat="server" Text="加數"></asp:Label>



                        &nbsp;=&nbsp;
        <asp:TextBox ID="answer" runat="server" Width="100px"></asp:TextBox>



                        &nbsp;
        <asp:Button ID="check" runat="server" Text="核對答案" OnClick="check_Click" />



                        <br />
                        <br />
                        <br />
                        <asp:Label ID="message" runat="server" Text=""></asp:Label>



                        <br />


                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                      
                    <div>
                        <h2>99乘法表產生系統</h2>
                        <br>
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="點我產生99乘法表" />
                        <asp:Table ID="Table1" runat="server" BorderStyle="Solid" BorderColor="#FF6699" CellSpacing="0" GridLines="Both">
                        </asp:Table>
                    </div>
                </asp:View>
                <asp:View ID="View5" runat="server">

                    <div>
                        <h2>99乘法表產生系統。改</h2>
                        <br>
                        請輸入<asp:TextBox ID="TextBox4" runat="server" Width="55px"></asp:TextBox>列 與
        <asp:TextBox ID="TextBox5" runat="server" Width="55px"></asp:TextBox>行
        <br>
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="點我產生99乘法表。改" />

                        <asp:Table ID="Table5" runat="server" BorderStyle="Solid" BorderColor="#FF6699" CellSpacing="0" GridLines="Both">
                        </asp:Table>
                    </div>



                </asp:View>
            </asp:MultiView>






        </div>
    </form>
</body>
</html>
