<?php
include("../../inc/connection.php"); 
?>
<div class="modal-content">
	<div class="modal-header"> 
		<h4 class="modal-title">NEW SUB CATEGORY</h4>
	</div>
	<div class="modal-body"> 
    <div id="results"></div> 
    <div class="form-group">
      <label >Sub Category Name</label>
      <input type="text" class="form-control" id="name" name="name" placeholder="Sub Category" required />
    </div>
    <div class="form-group"> 
      <label class="">Main Category:</label>
      <select name="category" id="main-cat" class="form-control">
        <option value="0">---SELECT A CATEGORY----</option>
        <?php
        $categories = "SELECT * FROM kp_category";
        $categories_r = mysqli_query($connection,$categories) or die("Error getting categories");
        while ($cat = mysqli_fetch_assoc($categories_r)) {
          $category = $cat['name'];
          $cat_id = $cat['cat_id'];
          ?>
          <option value="<?php echo $cat_id; ?>"><?php echo $category; ?></option>
          <?php
        }
        ?>
      </select>
    </div>
    <div class="form-group">
      <label >Sub Category Description</label>
      <input type="text" class="form-control" id="desc" name="desc" placeholder="Description"/>
    </div> 
    <div class="form-group">
      <label >Sub Category Code</label>
      <input type="text" class="form-control" id="sub_code" name="sub_code" placeholder="Sub category code" required />
    </div>
  </div>
  <div class="modal-footer">
    <a class="btn btn-sm btn-danger" data-dismiss="modal">Close</a>
    <a class="btn btn-sm btn-success" onclick="new_sub();">Save</a>
  </div>
</div>  