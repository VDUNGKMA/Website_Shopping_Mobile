<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    <style>
        img{
            width: 200px;
            height: 120px;
        }
    </style>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-6">
                    <h2>Edit <b>Product</b></h2>
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </div>
    </div>
    <div id="editEmployeeModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="edit-product" method="post" onsubmit="updateDescriptionData()">
                    <div class="modal-header">
                        <h4 class="modal-title">Add Product</h4>
                        <a href="manager" target="_blank">X</a>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>ID</label>
                            <input value="${detail.getId() }" name="id" type="text" class="form-control" readonly required>
                        </div>
                        <div class="form-group">
                            <label>Name</label>
                            <input value="${detail.getName()}" name="name" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Image</label>
                            <input value="${detail.getImage()}" name="image" type="text" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>Price</label>
                            <input value="${detail.getPrice()}" name="price" type="text" class="form-control" required>
                        </div>


                        <div class="form-group">
                            <label>Category</label>
                            <select name="category" class="form-select" aria-label="Default select example">
                                <c:forEach items="${listCategory}" var="o">
                                    <option   value="${o.getId()}">${o.getCategoryName()}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea name="description" id="description" class="form-control" required>${detail.getDiscripsion()}</textarea>
                        </div>


                    </div>
                    <!-- Trường ẩn để lưu giá trị của trình soạn thảo CKEditor -->
                    <input type="hidden" name="descriptionData" id="descriptionData" />
                    <div class="modal-footer">
                        <input type="submit" id="edit" class="btn btn-success" value="Edit">
                    </div>
                </form>
            </div>
        </div>
    </div>

</div>


<script src="js/manager.js" type="text/javascript"></script>
<script src="//cdn.ckeditor.com/4.21.0/full/ckeditor.js"></script>
<script>
    CKEDITOR.replace('description');
    // Hàm để cập nhật giá trị của trường ẩn "descriptionData" với nội dung CKEditor
    function updateDescriptionData() {
        var editorData = CKEDITOR.instances.description.getData();
        document.getElementById('descriptionData').value = editorData;
    }

    // Gọi hàm updateDescriptionData() khi submit form
    document.getElementById('edit').addEventListener('click', updateDescriptionData);

</script>
</body>
</html>