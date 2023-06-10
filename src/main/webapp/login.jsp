<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <link rel="stylesheet" href="css/taikhoan.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</head>
<body>
<input type="hidden" id="status"  value="<%= request.getAttribute("status")%>">
<div class="containTaikhoan" style="transform: scale(1);">
    <span class="close" onclick="window.location.href='index.jsp'">×</span>
    <div class="taikhoan">

        <ul class="tab-group">
            <li class="tab active"><a href="#login">Đăng nhập</a></li>
            <li class="tab "><a href="#signup">Đăng kí</a></li>
        </ul> <!-- /tab group -->

        <div class="tab-content">
            <div id="login" style="display: block;">
                <h1>Chào mừng bạn trở lại!</h1>

                <form method="post" action="login" class="register-form"
                      id="login-form">

                    <div class="field-wrap">

                        <input
                                type="text" name="username" id="username"
                                placeholder="Your Name" require="require"/>
                    </div> <!-- /user name -->

                    <div class="field-wrap">
                        <input
                                type="password" name="password" id="password"
                                placeholder="Password" require="require"/>

                    </div> <!-- pass -->

                    <p class="forgot"><a href="forgotPassword.jsp">Quên mật khẩu?</a></p>

                    <button type="submit" class="button button-block">Tiếp tục</button>

                </form> <!-- /form -->

            </div> <!-- /log in -->

            <div id="signup" style="display: none;">
                <h1>Đăng kí miễn phí</h1>

                <form method="post" action="register" class="register-form">

                    <div class="top-row">
                        <div class="field-wrap">

                            <input type="text" name="ho" id="ho" placeholder="Ho" required />
                        </div>

                        <div class="field-wrap">

                            <input type="text" name="ten" id="ten" placeholder="Ten" required />
                        </div>
                    </div> <!-- / ho ten -->

                    <div class="field-wrap">
                        <input
                                type="email" name="email" id="email" placeholder="Your Email" required   />
                    </div> <!-- /email -->

                    <div class="field-wrap">
                        <input type="text" name="newUser" id="newUser" placeholder="User Name" required />
                    </div> <!-- /user name -->

                    <div class="field-wrap">
                        <input name="password" type="password" placeholder="Password" required >
                    </div> <!-- /pass -->

                    <button type="submit" class="button button-block">Tạo tài khoản</button>

                </form> <!-- /form -->

            </div> <!-- /sign up -->
        </div><!-- tab-content -->

    </div> <!-- /taikhoan -->
</div>
</body>
</html>
<script type="text/javascript">
    var tab = document.getElementsByClassName('tab');
    for (var i = 0; i < tab.length; i++) {
        var a = tab[i].getElementsByTagName('a')[0];
        a.addEventListener('click', function (e) {
            e.preventDefault(); // tắt event mặc định

            // Thêm active(màu xanh lá) cho li chứa tag a này => ấn login thì login xanh, signup thì signup sẽ xanh
            this.parentElement.classList.add('active');

            // Sau khi active login thì phải tắt active sigup và ngược lại
            // Trường hợp a này thuộc login => <li>Login</li> sẽ có nextElement là <li>SignUp</li>
            if (this.parentElement.nextElementSibling) {
                this.parentElement.nextElementSibling.classList.remove('active');
            }
            // Trường hợp a này thuộc signup => <li>SignUp</li> sẽ có .previousElement là <li>Login</li>
            if (this.parentElement.previousElementSibling) {
                this.parentElement.previousElementSibling.classList.remove('active');
            }

            // Ẩn phần nhập của login nếu ấn signup và ngược lại
            // href của 2 tab signup và login là #signup và #login -> tiện cho việc getElement dưới đây
            var target = this.href.split('#')[1];
            document.getElementById(target).style.display = 'block';

            var hide = (target == 'login' ? 'signup' : 'login');
            document.getElementById(hide).style.display = 'none';
        })
    }

    var status =document.getElementById('status').value;
    if(status == "success"){
        swal({
            title: "Register success",
            text: "You clicked the button!",
            icon: "success",
        });
    } else if(status =="fail"){
        swal({
            title: "Register fail",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });

    } else if(status =="Username_invalid"){
        swal({
            title: "Invalid UserName",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    } else if(status =="Pwd_invalid"){
        swal({
            title: "Invalid Password",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    } else if(status =="passwordLength"){
        swal({
            title: "Password should be of 10 digit",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    } else if(status =="Email_invalid"){
        swal({
            title: "Invalid UserName",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    }
    if(status =="error"){
        swal({
            title: "Login Fail!",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });

    }
   else if(status =="invalidUname"){
        swal({
            title: "UserName no correct!",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    }
    else if(status=="invalidPwd"){
        swal({
            title: "Password no correct!",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    }
    else if(status=="account_exit"){
        swal({
            title: "Account exit !",
            text: "You clicked the button!",
            icon: "error",
            button: "Exit!",
        });
    }

</script>