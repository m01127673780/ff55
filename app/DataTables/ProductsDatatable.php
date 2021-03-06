<?php

namespace App\DataTables;

use App\Model\Product;
use Yajra\DataTables\Services\DataTable;

class ProductsDatatable extends DataTable
{
   /**
    * Build DataTable class.
    *
    * @param mixed $query Results from query() method.
    * @return \Yajra\DataTables\DataTableAbstract
    */
   public function dataTable($query)
   {
      return datatables($query)
         ->addColumn('checkbox', 'admin.products.btn.checkbox')
         ->addColumn('edit', 'admin.products.btn.edit')
         ->addColumn('delete', 'admin.products.btn.delete')
         ->rawColumns([
            'edit',
            'delete',
             'checkbox',
         ]);
   }

   /**
    * Get query source of dataTable.
    *
    * @param \App\User $model
    * @return \Illuminate\Database\Eloquent\Builder
    */
 
public function query() {
    return Product::query()->with('department_id')->select('products.*');
  }
   /**
    * Optional method if you want to use html builder.
    *
    * @return \Yajra\DataTables\Html\Builder
    */
   public function html()
   {
      return $this->builder()
         ->columns($this->getColumns())
         ->minifiedAjax()
         ->parameters([
            'dom'          => 'Blfrtip',
            'lengthMenu'   => [[1,5,10, 25, 50, 100], [1, 5, 10, 25, 50, trans('admin.all_record')]],
            'buttons'      => [
               [
                  'text' => '<i class="fa fa-plus"></i> ' . trans('admin.add'), 'className' => 'btn btn-info', "action" => "function(){

              window.location.href = '" . \URL::current() . "/create';
            }", ],

               ['extend' => 'print', 'className' => 'btn btn-primary', 'text' => '<i class="fa fa-print"></i>'],
               ['extend' => 'csv', 'className' => 'btn btn-success', 'text' => '<i class="fa fa-file"></i> ' . trans('admin.ex_csv')],
               // ['extend' => 'excel', 'className' => 'btn btn-success', 'text' => '<i class="fa fa-file"></i> ' . trans('admin.ex_excel')],
               ['extend' => 'reload', 'className' => 'btn btn-default', 'text' => '<i class="fa fa-refresh"></i>'],
               [
                  'text' => '<i class="fa fa-trash"></i>', 'className' => 'btn btn-danger delBtn marg-padd'],

            ],
            'initComplete' => " function () {
                this.api().columns([1,2,3,4,5,6]).every(function () {
                    var column = this;
                    var input = document.createElement(\"input\");
                    $(input).appendTo($(column.footer()).empty())
                    .on('keyup', function () {
                        column.search($(this).val(), false, false, true).draw();
                    });
                });
            }",

            'language'     => datatable_lang(),

         ]);
   }

   /**
    * Get columns.
    *
    * @return array
    */

   /*
    'product_name_ar',
      'product_name_en',
      'desc_ar',
      'desc_en',
      'photo',
       'price',
       'department_id',s
    
   */
       
 
   protected function getColumns()
   {
      return [
          [
            'name'       => 'checkbox',
            'data'       => 'checkbox',
            'title'      => '<input type="checkbox" class="check_all" onclick="check_all()" />',
            'exportable' => false,
            'printable'  => false,
            'orderable'  => false,
            'searchable' => false,
         ], [
            '<tr><th>name</th>'  => 'product_name_ar<tr>',
            'data'  => 'product_name_ar',
            'title' => trans('admin.product_name_ar'),
         ],[
            'name'  => 'desc_ar',
            'data'  => 'desc_ar',
            'title' => trans('admin.desc_ar'),
         ],[
            'name'  => 'price',
            'data'  => 'price',
            'title' => trans('admin.price'),
         ],[
            'name'  => 'nun_sms',
            'data'  => 'nun_sms',
            'title' => trans('admin.nun_sms'),
         ],[
            'name'  => 'department_id.dep_name_ar',
            'data'  => 'department_id.dep_name_ar',
            'title' => trans('admin.department_id'),
         ], [
            'name'  => 'date_month',
            'data'  => 'date_month',
            'title' => trans('admin.date_month'),
         ],[
            'name'  => 'updated_at',
            'data'  => 'updated_at',
            'title' => trans('admin.updated_at'),
         ], [
            'name'       => 'edit',
            'data'       => 'edit',
            'title'      => trans('admin.edit'),
            'exportable' => false,
            'printable'  => false,
            'orderable'  => false,
            'searchable' => false,
         ], [
            'name'       => 'delete',
            'data'       => 'delete',
            'title'      => trans('admin.delete'),
            'exportable' => false,
            'printable'  => false,
            'orderable'  => false,
            'searchable' => false,
         ],
        

      ];
   }

   /**
    * Get filename for export.
    *
    * @return string
    */
   protected function filename()
   {
      return 'products_' . date('YmdHis');
   }
}
