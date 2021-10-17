<?php
require( '../../inc/connection.php' );
$table = 'kp_items';
$primaryKey = 'item_id';
$columns = array(
  array(
    'db' => 'item_id',
    'dt' => 'DT_RowClass',
    'formatter' => function( $d, $row ) {
      return "row".$d;
    }
  ),
  array( 'db' => 'barcode',     'dt' => 'bar' ),
  array( 'db' => 'item_id',     'dt' => 'id' ),
  array( 'db' => 'name',        'dt' => 'name' ),
  array( 'db' => 'sprice',      'dt' => 'sprice' ),
  array( 'db' => 'wprice',      'dt' => 'wprice' ),
  array( 'db' => 'dprice',      'dt' => 'dprice' ),
  array( 'db' => 'stock_code',  'dt' => 'stock_code' ),
  array( 'db' => 'cat_id',      'dt' => 'cat_id'),
  array( 'db' => 'sub_id',      'dt' => 'sub_id'),
  array( 'db' => 'bprice',      'dt' => 'bprice'),
  array( 'db' => 'base_price',  'dt' => 'base_price'),
  array( 'db' => 'qty',         'dt' => 'stock' ),
  array( 'db' => 'tax_id',      'dt' => 'tax' ),
  array( 'db' => 'uom',      'dt' => 'uom' ) ,
  array( 'db' => 'bulk',      'dt' => 'bulk' ) ,
  array( 'db' => 'pcs',      'dt' => 'pcs' ) ,
  array( 'db' => 'break_item',      'dt' => 'break_item' ) 
  
);

require( '../../assets/plugins/DataTables/ssp.class.php' );

echo json_encode(
    SSP::simple( $_GET, $sql_details, $table, $primaryKey, $columns )
);

