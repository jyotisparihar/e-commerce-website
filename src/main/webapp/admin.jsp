<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user = (User)session.getAttribute("current-user");
    if(user==null){
        
        session.setAttribute("message","You are not logged in!! Please Login First");
        response.sendRedirect("login.jsp");
        return;
    }else{
        if(user.getUserType().equals("normal")){
            session.setAttribute("message","You are not admin !! Do not try to access this page");
            response.sendRedirect("Login.jsp");
            return;
    }
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp" %>
        
    </head>
    <body>
        
        <%@include file="components/navbar.jsp" %>
        
        <div class ="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
          
            <div class="row mt-3">
                
                <!--first column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            
                            <div class="container">
                                <img style="max-width: 130px" class = "img-fluid" src="img/users.png" alt="user_icon"/>  
                            </div>
                            
                            <h1>123</h1>
                            <h1  class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>
                    
                </div>
                
                <!--second column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style="max-width: 130px" class = "img-fluid" src="img/checklist.png" alt="user_icon"/>  
                            </div>
                            <h1>1234</h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                    
                </div>
                
                
                <!--third column-->
                <div class="col-md-4">
                    
                    <div class="card">
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style="max-width: 130px" class = "img-fluid" src="img/product.png" alt="user_icon"/>  
                            </div>
                            <h1>123</h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>
                    
                </div>
            </div>
            
            <!--second row-->
            <div class="row mt-3">
                
                <!--second row first column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style="max-width: 130px" class = "img-fluid" src="img/addinlist.png" alt="user_icon"/>  
                            </div>
                            <p class="mt-3">Click here to add Category</p>
                            <h1 class="text-uppercase text-muted">Add Category</h1>
                        </div>
                    </div>
                </div>
                
                <!--second row second column-->
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                            
                             <div class="container">
                                <img style="max-width: 130px" class = "img-fluid" src="img/addinlist.png" alt="user_icon"/>  
                            </div>
                            <p class="mt-3">Click here to add Product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
        
       <!--add category modal-->
       
       <!-- Modal -->
       <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog modal-lg" role="document">
               <div class="modal-content">
                   <div class="modal-header custom-bg text-white">
                       <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                       <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                       </button>
                   </div>
                   <div class="modal-body">
                       <form action="ProductOperationServlet" method="post">
                           
                           <input type="hidden" name="operation" value="addcategory">
                           
                           <div class="form-group">
                               <input type="text" class="form-control" name="catTitle" placeholder="Enter category Title" required />
                           </div>
                           
                           <div class="form-group">
                               <textarea style="height:200px" class="form-control" placeholder="Enter category Description" name="catDescription" required ></textarea>
                           </div> 
                           
                           <div class="container text-center">
                               <button class="btn btn-outline-success">Add Category</button>
                               <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                           </div>
                       </form>
                   </div>
               </div>
           </div>
       </div>
       
       <!--end add category modal-->
        
        <!--add product modal-->

        <!-- Modal -->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <!--form-->
                        
                        <form>
                            
                            <!--product title-->
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Enter title of Product" name="pName" required />
                            </div>
                            
                            <!--product description-->
                            <div class="form-group">
                                <textarea style="height:150px" class="form-control" placeholder="Enter Product description" name="pDesc"></textarea>
                            </div>
                            
                            <!--product price-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Price of Product" name="pPrice" required />
                            </div>
                            
                            <!--product discount-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Discount on Product" name="pDiscount" required />
                            </div>
                            
                            <!--product quantity-->
                            <div class="form-group">
                                <input type="number" class="form-control" placeholder="Enter Quantity of Products" name="pQuantity" required />
                            </div>
                            
                            <!--product category-->
                            
                            <% 
                             CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                             List<Category> list = cdao.getCategories();
                            %> 
                            
                            <div class="form-group">
                                <select name="catId" class="form-control" >
                                    <% for(Category c: list){ %>
                                    <option value="<%=c.getCategoryId() %>"><%= c.getCategoryTitle()%></option>
                                    <%} %>
                                    
                                </select>
                            </div>
                            
                            <!--product file-->
                            <div class="form-group">
                                <label for="pPic">Select Picture of Product</label>
                                <br>
                                <input type="file" id="pPic" name="pPic" required />
                            </div>
                            
                            <!--submit button-->
                            <div class="container text-center">
                                
                                <button class="btn btn-outline-success">Add Product</button>
                                
                            </div>
                          
                        </form>
                        
                        <!--form end-->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> 
                    </div>
                </div>
            </div>
        </div>

        
        <!--end add product modal-->
        
    </body>
</html>
 