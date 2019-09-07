<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="../static/js/jquery-3.3.1.min.js"></script>
<title>文件上传</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .upload{
        width:500px;
        height: 700px;
        margin: 50px auto;
    }
    .upload #file{
        height: auto;
        padding: 20px;
    }
</style>
<body>
 	<form class="upload" id="uploadform">
        <label>昵称</label>
        <input type="text" name="user_name" id="user_name">
        <!-- <label>选择文件</label> -->
        <input type="file" id="file" name="file">
        <input type="button" id="submit" value="formdata提交">
        <!-- test img显示 路径 upload/head -->
    </form>
    <img src="../upload/movies/demo.jpg" alt="this is a zimg"/>
 	<script>
       $('#submit').click(function(){
           var formData = new FormData();
           var user_name = $('#user_name').val();
           var file = $('#file')[0].files[0];
           //console.log(file.name);
           if(file != ""){
               formData.append("file",file);
           }
           formData.append("user_name",user_name);
          // console.log(user_name);
           //console.log(formData);
         //  console.log(formData.get("user_name"));
           $.ajax({
                type: "post",
                url: "http://localhost:8080/user/test",
                data: formData,
                processData: false,
                contentType: false,
                success: function(result){
                    console.log(result);
                    var obj = eval('(' + result + ')');
                    console.log(obj.file);
                }
           });
       })
    </script>
</body>
</html>