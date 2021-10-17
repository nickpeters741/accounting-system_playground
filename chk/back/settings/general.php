<!-- begin panel -->
<div class="panel panel-inverse" data-sortable-id="form-validation-2"> 
   <!-- begin panel-body -->
    <div class="panel-body ">
      <form action="/" method="POST">
        <fieldset>
            <legend class="m-b-15">Company Details</legend>
            <div class="form-group row m-b-15">
                <div class="form-group col-md-8 ">
                    <label>Company Name</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="form-group col-md-4">
                    <div class="form-group">
                        <div class="img-preview" >
                            <img src="../../assets/img/logo/logo-b.png" alt="No Image"  id="img" class="rounded-circle" style="margin-bottom: 10px; width: 180px; height:auto;">
                        </div>
                        <div class="upload-msg"></div>
                        <input type="file" name="photo" id="photo">
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset>
            <legend class="m-b-15">Contact Details</legend>
            <div class="form-group row m-b-15">
               <div class="form-group col-md-6 ">
                    <label>Phone</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="form-group col-md-6">
                    <label>Phone 2</label>
                    <input type="text" class="form-control"/>
                </div>
                <div class="form-group col-md-6 ">
                    <label>Email address</label>
                    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Enter email" autofocus />
                </div>
                <div class="form-group col-md-6 ">
                    <label>Address</label>
                    <textarea class="form-control"> P.O BOX </textarea> 
                </div>
            </div> 
        </fieldset>
   
                          
    </div>
    <!-- end panel-body -->
    <!--start footer-->
    <div class="panel-footer">
        <button type="button" name="new_prod" id="new_prod" class=" btn btn-lime ">Save</button>
    </div> 
</form>
</div>
<!-- end panel --> 
