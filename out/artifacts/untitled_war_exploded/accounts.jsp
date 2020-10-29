<%@page import="myPackage.classes.User" %>
<%@page import="java.util.ArrayList" %>
<%@ page import="myPackage.DatabaseClass" %>
<jsp:useBean id="pDAO" class="myPackage.DatabaseClass" scope="page"/>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%

    User user=pDAO.getUserDetails(session.getAttribute("userId").toString());
    if(user.getType().endsWith("admin")){
%>
<!-- SIDEBAR -->
<%
    ArrayList<User> users;

    users = new DatabaseClass().getStudent();



    session.setAttribute("list",users);
%>
<link rel="stylesheet" href="Common/test/css/styleAccount.css">
<style>


    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 163px;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 50%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;

        font-size: 28px;
        float: right;
        font-weight: bold;
        position: relative;
        left: 688px;
        top: -10px;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<div class="sidebar" style="background-image: url(sidebar-1.jpg)">
    <div class="sidebar-background">
        <h2 class="logo-text">
            Online Examination System
        </h2>

        <div class="left-menu">
            <a href="adm-page.jsp?pgprt=0"><h2>Profile</h2></a>
            <a href="adm-page.jsp?pgprt=2"><h2>Courses</h2></a>
            <a href="adm-page.jsp?pgprt=3"><h2>Questions</h2></a>
            <a class="active" href="adm-page.jsp?pgprt=1"><h2>Accounts</h2></a>
        </div>
    </div>
</div>
<!-- CONTENT AREA -->
<div class="content-area">
    <div class="inner" style="margin-top: 50px;background-color: ghostwhite!important;width: 1078px">
        <div class="title" style="margin-top: -30px; height: 60px!important;">List of All Registered Persons</div>
        <br>
        <br>
        <br/>
        <a href="Register.jsp" class="button" style="text-decoration: none!important;"><span class="add-btn" style="margin-left: 80px;">Add New Person</span></a>
        <br>
        <table id="one-column-emphasis">
            <colgroup>
                <col class="oce-first"/>
            </colgroup>
            <thead>
            <tr>
                <th scope="col">User Name</th>

                <th scope="col">First Name</th>
                <th scope="col">Last Name</th>
                <th scope="col">Email</th>
                <th scope="col">Password</th>
                <th scope="col">Roles</th>

                <th scope="col">Update</th>
                <th scope="col">Delete</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach var="item" items="${sessionScope.list}">

                <tr>
                    <td style="padding: 12px 15px;">${item.userName}</td>
                    <td style="padding: 12px 15px;">${item.firstName}</td>
                    <td style="padding: 12px 15px;">${item.lastName}</td>
                    <td style="padding: 12px 15px;">${item.email}</td>

                    <td>
                        <div class="container">
                        <input style="width:70%;" id="user${item.password}"  type="password" value="${item.password}" disabled>
                        <i class="far fa-eye" id="user${item.password}" onClick="reply_click(this.id)"></i>

                        </div>
                    </td>

                    <td style="padding: 12px 15px;">${item.type}</td>

                    <td style="padding: 20px 15px;"> <button  type="submit" class="btn btn-primary" id="myBtn" ><i  aria-hidden="true"></i> Update</button> </td>
                    <td style="padding: 12px 15px;"> <button  type="submit" class="btn btn-danger"><i href="adm-page.jsp?pgprt=0&pedt=1" aria-hidden="true"></i> Delete</button> </td>
                </tr>
            </c:forEach>














            <div id="myModal" class="modal">

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <form action="code.php" method="POST">
                        <div class="modal-body">
                            <h2>Update Info</h2>
                            <input type="hidden" name="edit_id" id="edit_id">
                            <div class="form-group">
                                <label >First Name</label>
                                <input type="text" name="fname" id="edit_fname" class="form-control" placeholder="Enter First Name">
                            </div>
                            <div class="form-group">
                                <label >Last Name</label>
                                <input type="text" name="lname" id="edit_lname" class="form-control" placeholder="Enter Last Name">
                            </div>
                            <div class="form-group">
                                <label >Email</label>
                                <input type="text" name="class" id="edit_class" class="form-control" placeholder="Enter Email">
                            </div>
                            <div class="form-group">
                                <label >Pass</label>
                                <input type="text" name="section" id="edit_section" class="form-control" placeholder="Enter Pass">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closeForm()">Close</button>
                            <button type="submit" name="update_student" class="btn btn-primary">Update</button>
                        </div>
                    </form>
                </div>

            </div>





            <script>
                // Get the modal
                var modal = document.getElementById("myModal");

                // Get the button that opens the modal
                var btn = document.getElementById("myBtn");

                // Get the <span> element that closes the modal
                var span = document.getElementsByClassName("close")[0];

                // When the user clicks the button, open the modal
                btn.onclick = function() {
                    modal.style.display = "block";
                }

                // When the user clicks on <span> (x), close the modal
                span.onclick = function() {
                    modal.style.display = "none";
                }

                // When the user clicks anywhere outside of the modal, close it
                window.onclick = function(event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                function closeForm() {
                    modal.style.display = "none";
                }
            </script>


            <script src="Common/test/js/ShowpassAndHide.js"></script>



            <!-- and so on... -->
            </tbody>
        </table>

    </div>



    <%
        }

    %>

</div>
</div>