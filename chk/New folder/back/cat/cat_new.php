 
<div class="modal-content">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		<h4 class="modal-title">NEW CATEGORY</h4>
	</div>
	<div class="modal-body"> 
        <div id="results"></div> 
        <div class="form-group">
            <label >Category Name</label>
            <input type="text" class="form-control" id="name" name="name" placeholder="Category" required />
        </div>
        <div class="form-group">
            <label >Category Description</label>
            <input type="text" class="form-control" id="desc" name="desc" placeholder="Description"/>
        </div>  
        <div class="form-group">
            <label >Category Code</label>
            <input type="text" class="form-control" id="cat_code" name="cat_code" placeholder="Category Code" required />
        </div>
    </div>
    <div class="modal-footer">
        <a class="btn btn-xs btn-danger" data-dismiss="modal">Close</a>
        <a id="new_cat" class="btn btn-xs btn-purple" onclick="new_cat();">Save</a>
    </div>
</div> 