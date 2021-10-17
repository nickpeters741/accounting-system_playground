$(".selectpicker").select2();  
function showbtn(){ 
    var id=$('input:focus').attr('id'); 
    $(".btn-div").hide();
    $("."+id).show(); 
}
function disc_btn(){ 
    var id=$('input:focus').attr('id'); 
    $(".btn-disc").hide();
    $("."+id).show(); 
}
function price_btn(){ 
    var id=$('input:focus').attr('id'); 
    console.log(id);
    $(".btn-price").hide();
    $("."+id).show(); 
}
function updateprice(id) {  
    var price = $("#btnprice"+id).val();  
    $.ajax({
      url: 'update_price.php',
      type: 'POST',
      data: 'item_id='+id+'&price='+price,
      dataType: 'html'
    })
    .done(function(data){
    	load_total();
    	load_item_list();
    	$('#results').html('');
    	$('#results').html(data);
    })
    .fail(function(){
    	$('#results').html('');
    	$('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    });
}
function updateqty(id) {  
    var qty = $("#btn"+id).val();  
    $.ajax({
      url: 'update_qty.php',
      type: 'POST',
      data: 'id='+id+'&qty='+qty,
      dataType: 'html'
    })
    .done(function(data){
      load_total();
      load_item_list();
      $('#results').html(''); // blank before load.
      $('#results').html(data); // blank before load.;
      
    })
    .fail(function(){
      
      $('#results').html(''); // blank before load.
      $('#results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');

    });
}
function qty_adj(item_id){ 
    $.ajax({
    	url: '../gen/qty_adj.php',
    	typr: 'POST',
    	data: 'item_id='+item_id,
    	dataType: 'html'
    })
    .done(function(data){
    	$('#load').html(''); 
    	$('#load').html(data);
    })
    .fail(function(){
    	$('#dynamic-content1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    	$('#modal-loader').hide();
    }); 
}
function bar_adj(item_id){ 
    $.ajax({
    	url: '../../back/prods/bar_edit.php',
    	typr: 'POST',
    	data: 'item_id='+item_id+'&st=2',
    	dataType: 'html'
    })
    .done(function(data){
    	$('#load').html(''); 
    	$('#load').html(data);
    })
    .fail(function(){
    	$('#dynamic-content1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    	$('#modal-loader').hide();
    }); 
}
function price_adj(item_id){ 
    $.ajax({
      	url: '../gen/price_adj.php',
      	typr: 'POST',
      	data: 'item_id='+item_id,
      	dataType: 'html'
    })
    .done(function(data){
	    $('#load').html(''); // blank before load.
	    $('#load').html(data);
    })
    .fail(function(){
      	$('#dynamic-content1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      	$('#modal-loader').hide();
    }); 
}
function load_item_list(){ 
	$.ajax({
    url: 'lpo_list.php',
    type: 'POST',
    data: '',
    dataType: 'html'
  })
  .done(function(data){ 
    $('#d1').html(''); // blank before load.
    $('#d1').html(data); // blank before load.
  })
  .fail(function(){
    $('#d1').html(''); // blank before load.
    $('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function item_data(){
	var item_id = document.getElementById('item_id').value; 
  $.ajax({
    url: '../gen/item_data.php',
    type: 'GET',
    data: 'nm='+item_id,
    dataType: 'html'
  })
  .done(function(data){ 
    $('#d33').html(''); // blank before load.
    $('#d33').html(data); // blank before load.
  })
  .fail(function(){
    $('#d33').html(''); // blank before load.
    $('#d33').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
  });
}
function load_total(){ 
	$.ajax({
    url: 'total.php',
    type: 'POST',
    data: '',
    dataType: 'html'
	})
	.done(function(data){ 
    $('#samount').html(''); // blank before load.
    $('#samount').html(data); // blank before load.
	})
	.fail(function(){
    $('#samount').html(''); // blank before load.
    $('#samount').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	});
}
function del_this(id){
	$.ajax({
		url: 'del_item.php',
		type: 'POST',
		data: 'id='+id,
		dataType: 'html'
	})
	.done(function(data){
		console.log(data);
		load_item_list();
	})
	.fail(function(){
		$('#d1').html('');
		$('#d1').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	});
} 
function tax_perc(){
    var vat_type=$('input[name="tax"]:checked').val();
    var perc= $('#perc-input').val();
    var total =$('#ttt').html();
    var disc= 0;
    total=total-disc;
    var add=parseInt(100) + parseInt(perc);
    if (vat_type==1) {
      //inclusive 
      var multi=parseInt(perc)/add; 
      var vat=parseInt(total)*multi;
      var vatt=vat.toFixed(2);
      var vatable=total- vatt;
      var vatable=vatable.toFixed(2);
      var tt=total;
    } else if (vat_type==2){
      //exclusive 
      var multi=parseInt(add)/100;
      var vat= total *multi;
      var vatt=  vat - total ;
      var vatt=vatt.toFixed(2);
      var vatable= total ;
      var tt=vat.toFixed(2);
    }  
    $('#vatable').html(vatable); 
    $('#vatt').html(vatt);
    $('#tt').html(tt);  
  } 
  function clear_tax(){
    $("#none").click();
    var total =$('#ttt').html();
    var disc= $('#disc').val();
    total=total-disc;
    $('#tt').html(total);
  }
function SubmitForm() { 
	var bar = $("#bar").val();
	var qty = $("#qty").val();
	var price = $("#price").val();
	var item = $("#item_id").val();
	$.post("item_action.php", { item_id: item, qty: qty, price: price, bar:bar},
	function(data){
		$('#results').html(data);
		$("#items").val('');
		$("#item_id").val('') ;
		$("#qty").val('');
		$("#bar").val('');
		$("#price").val(''); 
		$('#modal').modal('hide');
		load_total(); 
		load_item_list(); 
	}) 
	$("#bar").focus();
}
// function beba_check(){
// 	$('#beba_sta').empty();
// 	var checkBox = document.getElementById("beba");
// 	if (checkBox.checked == true){ 
// 		$.fn.get_beba();
// 		document.getElementById("beba_row").style.display = 'flex';
// 		document.getElementById("beb").style.display = 'block';
// 		btnstatus(true)
// 	}else{
// 		var text = document.getElementById("beba_row");
// 		document.getElementById("beba_row").style.display = 'none';
// 		document.getElementById("beb").style.display = 'none';
// 		document.getElementById('deli').value = 0;
// 		document.getElementById('reg').value = ''; 
// 		btnstatus(false)
// 	}
// }
// function btnstatus(stat){
// 	var sale='<?php echo $sale_type; ?>';
// 	if (sale==1) { 
// 		$( "#cash_btn" ).prop( "disabled", true);
//   		//document.getElementById("cash_btn").disabled = stat;
// 	}else{
// 		$( "#credit-btn" ).prop( "disabled", true);
// 		//document.getElementById("credit-btn").disabled = stat;
// 	}
// }
// $.fn.get_beba = function(){ 
// 	$('#beba_sta').empty();
// 	$.ajax({
// 		type: "GET",
// 		url: '../gen/get_beba.php',
// 		data: { },
// 		success:  function(data) {
// 			$('#beba_sta').empty();
// 			$('#beba_sta').append(data);
// 		}
// 	});
// }
// function beba_select(){
// 	var beba = document.getElementById("beba_sta").value;
// 	if(beba == 0){
// 		document.getElementById("reg_div").style.display = "none";
// 		document.getElementById("amount_div").style.display = "none";
// 		document.getElementById("means_div").style.display = "none";
// 	}else {
// 		document.getElementById("means_div").style.display = "block";
// 	} 
// } 
// function means(){
// 	var means = document.getElementById("means").value;
// 	if(means == 1){
//   	document.getElementById("reg").value='';
//   	document.getElementById("reg_div").style.display = "none";
//   	document.getElementById("amount_div").style.display = "block";
// 	}else if (means == 2){
//   	document.getElementById("reg").value='';
//   	document.getElementById("reg_div").style.display = "none";
//   	document.getElementById("amount_div").style.display = "block";
// 	}else if (means == 3){
//   	document.getElementById("reg_div").style.display = "block";
//   	document.getElementById("amount_div").style.display = "none";
// 	}else if (means == 4){
//   	document.getElementById("reg_div").style.display = "block";
//   	document.getElementById("amount_div").style.display = "none";
// 	}
// }
// function reg_check(){  
// 	if (!document.getElementById("reg").value){  } else {
//   	document.getElementById("amount_div").style.display = "block";
//   }
// }
// function amount_check(){ 
// 	if (document.getElementById("deli").value>0){ 
// 		btnstatus(false)
//   } else {
//   	btnstatus(true);
//   }
// } 
$.fn.get_cat = function(){ 
  $('#cat_id').empty(); 
  $.ajax({
    type: "GET",
    url: '../../gen/get_cat.php', 
    data: { },
    success:  function(data) {  
      $('#cat_id').append(data);
    }
  });
}
$(document).ready(function(){ 
  load_item_list();
  $( "#bar" ).autocomplete({
    source: function( request, response ) {
    	$.ajax({
    		url: "../../gen/fetchItems.php",
    		type: 'post',
    		dataType: "json",
    		data: {
    			search: request.term
    		},
    		success: function( data ) { 
    			response(data);
    		}
    	});
    },
    select: function (event, ui) {
      $('#bar').val(ui.item.label); // display the selected text
      $('#item_id').val(ui.item.value); 
      item_data();
      $('#qty').focus();
      return false;
    }
	});   
	$(document).keydown(function(e){
   	var code = (e.keyCode ? e.keyCode : e.which);
    if(code==13){
      //$("#bar").focus();
    } else if(code==115) {
      $("#bar").focus();
    }else if(code==45) {
      $("#cash_btn").click();
    }else if(code==46) {
    	//DELETE BUTTON
      $("#cancel_btn").click();
    }else if(code==27) {
    	//ESC BUTTON
      $("#hold").click();
    }else if(code==36) {
      $("#suspend").click();
    } else if(code==115) {
      //115 is code for f4
      $("#bar").focus();
    } else if (code==107) {
	    	//107 is code for +
	    	SubmitForm();
		} else if(code==113) {
			//113 is code for F2
			$("#modal").modal('show');
			$.ajax({
		        url: '../gen/lookup.php',
		        type: 'POST',
		        data: '',
		        dataType: 'html'
	      	})
	      	.done(function(data){
		        load_total();
		        load_item_list();
		        $('#load').html('');
		        $('#load').html(data);
	      	})
	      	.fail(function(){
		        $('#load').html('');
		        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	      	});
	    } 
  	});
  	$('#bar').bind('keyup', function(e){
  		var code = (e.keyCode ? e.keyCode : e.which);
  		if(code==13){
	      SubmitForm()
	    }
  	});
  	$(document).on('click','#quick_item', function(e){  
    	$('#load2').html(''); 
    	$.ajax({
    		url: '../../back/prods/prods_new.php',
    		typr: 'POST',
    		data: '',
    		dataType: 'html'
    	})
	  	.done(function(data){ 
	    	$('#load').html(''); // blank before load.
	    	$('#load').html(data);
	    	$.fn.get_cat();
	  	})
	  	.fail(function(){
	    	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	    	$('#modal-loader').hide();
	  	});
	}); 
	$('input[name="tax-by"]').click(function() {
		var total =$('#ttt').html();  
	  if($(this).val() == '0') {
	    $('#div-tax').hide();  
	    $('#div-perc').hide();
	    $('#vat').val(0);
      $('#tt').html(total);
      $('#total').val(total); 
      $('#vatable').html(''); 
      $('#vatt').html('');
      $('#perc-input').val(0); 
      $('#vatable').html(0); 
      $('#vatt').html(0); 
	  }else if($(this).val() == '1') {
	    $('#div-tax').show();  
	    $('#div-perc').hide();
	    $('#vat').val(0);
      $('#tt').html(total);
      $('#total').val(total); 
      $('#vatable').html(''); 
      $('#vatt').html('');
      $('#perc-input').val(0); 
      $('#vatable').html(0); 
      $('#vatt').html(0); 
	  }else{ 
		load_item_list(); 
	    $('#div-tax').show();  
	    $('#div-perc').hide();
	  } 
	});
	$('input[name="tax"]').click(function() { 
    var total =$('#ttt').html();
    var vat=0;
    if($(this).val() == '1'){ 
      $('#div-perc').show();
      $('#others').prop("disabled", true);
      $('#vatable').html(0); 
      $('#vatt').html(0);
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();
    }else if($(this).val() == '2'){   
      $('#div-perc').show();
      $('#others').prop("disabled", true);
      $('#vatable').html(0); 
      $('#vatt').html(0); 
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();
    }
  });
  $('input[name="perc"]').click(function() {
    if($(this).val() == '1') {
      $('#others').prop("disabled", true);
      $('#perc-input').val(16);  
      $('#perc-input').prop("disabled", true);
      tax_perc();     
    }else{ 
      $('#vatable').html(0); 
      $('#vatt').html(0);
      $('#perc-input').val(0);
      $('#others').prop("disabled", false);
      $('#perc-input').prop("disabled", false);  
    }
  });
	$(document).on('click','#new-cust', function(e){  
  	$('#load2').html(''); 
  	$.ajax({
  		url: '../gen/quick_cust.php',
  		typr: 'POST',
  		data: '',
  		dataType: 'html'
  	})
  	.done(function(data){ 
    	$('#load2').html(''); // blank before load.
    	$('#load2').html(data);
  	})
  	.fail(function(){
    	$('#load2').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    	$('#modal-loader').hide();
  	});
	}); 
	$(document).on('click','#cust-change', function(e){  
		e.preventDefault(); 
		$.ajax({
	      	url: 'cust_change.php',
	      	typr: 'POST',
	      	data: '',
	      	dataType: 'html'
	    })
	    .done(function(data){ 
	      	$('#load').html(''); // blank before load.
	      	$('#load').html(data);
	    })
	    .fail(function(){
	      	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...'); 
	    });
	});

	$(document).on('click','#sale-day', function(e){
		e.preventDefault();  
		$.ajax({
  		url: 'sale_day.php',
  		typr: 'POST',
  		data: '',
  		dataType: 'html'
  	})
  	.done(function(data){ 
    	$('#load').html(''); // blank before load.
    	$('#load').html(data);
  	})
  	.fail(function(){
    	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
    	$('#modal-loader').hide();
  	});
	});
	$(document).on('click','#hold', function(e){
		e.preventDefault();   
		$.ajax({
			url: 'hold_modal.php',
			typr: 'POST',
			data: '',
			dataType: 'html'
		})
		.done(function(data){ 
			$('#load').html('');
			$('#load').html(data);
		})
		.fail(function(){
			$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
			$('#modal-loader').hide();
		});
	});
	// $(document).on('click','#sale-type', function(e){  
 //  	e.preventDefault();
 //  	$.ajax({
 //    	url: 'sale_type.php',
 //    	typr: 'POST',
 //    	data: '',
 //    	dataType: 'html'
 //    })
 //    .done(function(data){ 
 //    	$('#load').html(''); // blank before load.
 //    	$('#load').html(data);
 //    })
 //    .fail(function(){
 //    	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
 //    	$('#modal-loader').hide();
 //    });
	// });
	// $(document).on('click','#beba_staff', function(e){ 
	// 	e.preventDefault();  
 //  	$.ajax({
 //    	url: '../gen/beba_modal.php',
 //    	typr: 'POST',
 //    	data: '',
 //    	dataType: 'html'
 //    })
 //    .done(function(data){ 
 //    	$('#load').html(''); 
 //    	$('#load').html(data);
 //    })
 //    .fail(function(){
 //    	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
 //    	$('#modal-loader').hide();
 //    });
	// });
	// $(document).on('click','#beba_save', function(e){
	// 	e.preventDefault();  
 //    var  name = $('#beba_name').val();
 //    var phone = $('#phone').val(); 
 //    var loc = $('#loc').val(); 
 //    var nid = $('#nid').val();  
 //    $.ajax({
 //      	url: '../gen/beba_act.php',
 //      	typr: 'POST',
 //      	data: 'name='+name+'&phone='+phone+'&loc='+loc+'&nid='+nid,
 //      	dataType: 'html'
 //    })
 //    .done(function(data){
 //      	$('#beba_results').html(''); // blank before load.
 //      	$('#beba_results').html(data);
 //      	$.fn.get_beba();
 //    })
 //    .fail(function(){
 //      	$('#beba_results').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
 //    });
	// });
	// $(document).on('click','#cash_btn', function(e){ 
	// 	e.preventDefault();  
 //    var deli = $("#deli").val();
 //    var reg = $("#reg").val();
 //    var beba_sta = $('#beba_sta option:selected').val();
 //    var means = $('#means option:selected').val();
 //    var disc = $("#disc").val();
 //    $('#load').html(''); 
 //    load_total();
 //    var samount=document.getElementById("samount").innerHTML;   
 //    if (samount==0) {
 //      var hulla = new hullabaloo();
 //      hulla.send('Warning!!! Sale Cannot be Empty', "warning"); 
 //    } else {
	//     $.ajax({
	//       	url: 'check_out.php',
	//      	typr: 'POST',
	//       	data: 'deli='+deli+'&reg='+reg+'&beba_sta='+beba_sta+'&means='+means+'&disc='+disc,
	//       	dataType: 'html'
	//     })
	//     .done(function(data){ 
	//       	$('#load').html(''); 
	//       	$('#load').html(data);
	//     })
	//     .fail(function(){
	//       	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	//       	$('#modal-loader').hide();
	//     });
 //  	}
	// }); 
	$(document).on('click','#lpo-btn', function(e){ 
		e.preventDefault(); 
    var tt= $('#tt').html();
    if (tt==0) {
      var hulla = new hullabaloo();
      hulla.send('Warning!!! LPO Cannot be Empty OR ZERO', "warning");
      $('#modal').modal('toggle');
    }else{
	    var taxby= $('input[name="tax-by"]:checked').val(); 
	    var tax= $('input[name="tax"]:checked').val();
	    var vatable= $('#vatable').html(); 
	    var vatt= $('#vatt').html();
	    var perc= $('#perc-input').val(); 
	    var refno= $('#refno').val(); 
      $.ajax({
      	url: 'confirm_lpo.php',
        type: 'POST', 
        data: {vatable:vatable,vatt:vatt,tt:tt,perc:perc,taxby:taxby,tax:tax,refno:refno},  
        datatype: "html",   
      })
      .done(function(data){ 
        $('#load').html(data); // blank before load.
      })
      .fail(function(){ 
        $('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
      });
    }
	});
	// $(document).on('click','#broker', function(e){
	//   e.preventDefault(); 
	//    var item_id = $(this).data('id');
	//    $.ajax({
	//    	url: '../broker/broker.php',
	//    	typr: 'POST',
	//    	data: 'item_id='+item_id,
	//    	dataType: 'html'
	//   })
	//   .done(function(data){
	//   	$('#load').html('');
	//   	$('#load').html(data);
	//   	$.fn.get_sup(); 
	//   })
	//   .fail(function(){
	//   	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again loadig the sale script...'); 
	//   });
	// });
	$(document).on('click','#cancel_btn', function(e){     
	  	$.ajax({
	      	url: 'cancel_modal.php',
	      	typr: 'POST',
	      	data: '',
	      	dataType: 'html'
	  	})
	  	.done(function(data){ 
	    	$('#load').html(''); // blank before load.
	    	$('#load').html(data);
	  	})
	  	.fail(function(){
	    	$('#load').html('<i class="fa  fa-info-sign"></i> Something went wrong, Please try again...');
	    	$('#modal-loader').hide();
	  	});
	});
});  