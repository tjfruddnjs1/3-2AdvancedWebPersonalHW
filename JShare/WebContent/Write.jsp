<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
    <!DOCTYPE html>
    <html>

    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
        <title>�Խ���</title>

    </head>
    <style>
        body {
            padding: 0;
            margin: 0;
            background: rgba(0, 0, 0, 0);
        }
        
        .header {
            margin: 20px 0;
            text-align: center;
            position: relative;
        }
        
        .header a {}
        
        hr {
            margin-top: 30px;
        }
        
        .title {
            display: inline;
            margin-right: 100px;
        }
        
        .menu {
            text-decoration: none;
            margin-left: 30px;
            color: black;
        }
        
        .category a {
            text-decoration: none;
            padding: 0 10px;
            color: black;
            transition: 0.3s;
        }
        
        .category a:hover {
            color: white;
            background-color: #111010d1;
        }
        
        .search {
            width: 400px;
            border-radius: 10px;
            padding: 7px 3px;
        }
        
        .board {
            width: 60%;
            margin: auto;
            text-align: center;
        }
        
        #title {
            width: 60%;
        }
        
        i {
            font-size: 25px;
        }
        
        .fa-search {
            position: absolute;
            z-index: 1;
            top: 20px;
            right: 40.2%;
            font-size: 24px;
            color: black;
        }
        
        input.search:focus {
            outline: none;
        }
        
        table {
            width: 60%;
            margin: auto;
        }
    </style>

    <body>
        <header>ss
            <div class="header">
                <h1 class="title">JSharing</h1>
                <a href=""><i class="fas fa-search"></i></a> <input type="text" name="search" class="search"> <a href="./sharing" class="menu"><i class="far fa-handshake"></i> ��� �ϱ� </a> <a href="./board" class="menu"><i class="far fa-clipboard"></i> �Խ���</a>
                <hr>

                <ul class="category">
                    <a href="">���ڱ��</a>
                    <a href="">������</a>
                    <a href="">����</a>
                    <a href="">�м�/��ȭ</a>
                    <a href="">���</a>
                </ul>
            </div>
        </header>
        <hr>
        <table>
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr style="background: url('img/table_mid.gif') repeat-x; text-align: center;">
                            <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
                            <td>�۾���</td>
                            <td width="5"><img src="img/table_right.gif" width="5	" height="30" /></td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">����</td>
                            <td><input name="title" size="50" maxlength="100"></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">�з�</td>
                            <td><label><input type="radio" name="category" value="ElectricDevice">���ڱ��</label>
                                <label><input type="radio" name="category" value="Sports">������</label>
                                <label><input type="radio" name="category" value="furniture">����</label>
                                <label><input type="radio" name="category" value="fashion">�м�/��ȭ</label>
                                <label><input type="radio" name="category" value="hobby">���</label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">�������</td>
                            <td><input name="price" size="50" maxlength="50"></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">�뿩�Ⱓ</td>
                            <td><input name="period" size="50" maxlength="50"></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td align="center">����</td>
                            <td><textarea name="memo" cols="50" rows="13"></textarea></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr height="1" bgcolor="#dddddd">
                            <td colspan="4"></td>
                        </tr>
                        <tr height="1" bgcolor="#82B5DF">
                            <td colspan="4"></td>
                        </tr>
                        <tr align="center">
                            <td>&nbsp;</td>
                            <td colspan="2"><input type=button value="���"> <input type=button value="���">
                                <td>&nbsp;</td>
                        </tr>
                    </table>
                    </td>
            </tr>
        </table>
    </body>

    </html>