# Website_Shopping_Mobile 
+link web:  https://shopmobile.herokuapp.com/ (Có thể web này sẽ không chạy được do heroku hết hạn)
+ database online: ClearDB MySQL
+(Khi bạn muốn chạy website trên localhost bạn copy file Database nằm trong phần Webapp/Database) rồi paste vào mysql Workbech  ), tiếp đó chỉnh sửa đường dẫn của file cấu hình db nằm trong phần(src/main/collection/dbConnection.java)
 connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Shopping_Store?reconnect=true&useSSL=false",
                   "root","Password"
Trong đó 3306 là cổng của mysql, Shooping_Stote là tên database của bạn tiếp theo với  "root" và "Password" là tên username và pasword của mysql bạn thiết lập trước đó trên mysql workbech 

