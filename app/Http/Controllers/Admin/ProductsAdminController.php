<?php
namespace App\Http\Controllers\Admin;
use App\DataTables\ProductsAdminDatatable;

use App\Http\Controllers\Controller;

use App\Model\ProductAdmin;
use Illuminate\Http\Request;
 use Storage;

class ProductsAdminController extends Controller {
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(ProductsAdminDatatable $productAdmin) {
        return $productAdmin->render('admin.productsAdmin.index', ['title' => trans('admin.productsAdmin')]);
    }


    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create() {
        return view('admin.productsAdmin.create', ['title' => trans('admin.create_productsAdmin')]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store() {

        $data = $this->validate(request(),
            [
                'product_name_ar' => 'required',
                // 'product_name_en' => 'required',
                'desc_ar'         => 'sometimes|nullable|',
                // 'desc_en'         => 'required',
                'price'           => 'required',
                'nun_sms'           => 'required',
                'num_member'           => 'required',
                'date_month'           => 'required',
                'department_id'            => 'required',
            ], [], [
                'product_name_ar'           => trans('admin.product_name_ar'),
                // 'product_name_en'           => trans('admin.product_name_en'),
                'desc_ar'                   => trans('admin.desc_ar'),
                // 'desc_en'                => trans('admin.desc_en'),
                'price'                     => trans('admin.price'),
                'nun_sms'                   => trans('admin.nun_sms'),
                'num_member'                    => trans('admin.num_member'),
                'date_month  '                  => trans('admin.date_month  '),
                'department_id'             => trans('admin.department_id'),
            ]);
        if (request()->hasFile('logo')) {
            $data['logo'] = up()->upload([
                    'file'        => 'logo',
                    'path'        => 'productsAdmin',
                    'upload_type' => 'single',
                    'delete_file' => '',
                ]);
        }

        ProductAdmin::create($data);
        session()->flash('success', trans('admin.record_added'));
        return redirect(aurl('productsAdmin'));
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id) {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id) {
        $productAdmin = ProductAdmin::find($id);
        $title   = trans('admin.edit');
        return view('admin.productsAdmin.edit', compact('productAdmin', 'title'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $r, $id) {

        
            $data = $this->validate(request(),
            [
                'product_name_ar' => 'required',
                // 'product_name_en' => 'required',
                'desc_ar'         => 'sometimes|nullable|',
                'desc_en'         => 'required',
                'price'           => 'required',
                'nun_sms'           => 'required',
                'num_member'           => 'required',
                'date_month'           => 'required',
                'department_id'            => 'required',
            ], [], [
                'product_name_ar'           => trans('admin.product_name_ar'),
                // 'product_name_en'           => trans('admin.product_name_en'),
                'desc_ar'                   => trans('admin.desc_ar'),
                // 'desc_en'                => trans('admin.desc_en'),
                'price'                     => trans('admin.price'),
                'nun_sms'                       => trans('admin.price'),
                'num_member'                        => trans('admin.price'),
                'date_month  '                      => trans('admin.date_month'),
                'department_id'             => trans('admin.department_id'),
            ]);

        if (request()->hasFile('logo')) {
            $data['logo'] = up()->upload([
                    'file'        => 'logo',
                    'path'        => 'productsAdmin',
                    'upload_type' => 'single',
                    'delete_file' => ProductAdmin::find($id)->logo,
                ]);
        }

        ProductAdmin::where('id', $id)->update($data);
        session()->flash('success', trans('admin.updated_record'));
        return redirect(aurl('productsAdmin'));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id) {
        $productsAdmin = ProductAdmin::find($id);
        Storage::delete($productsAdmin->logo);
        $productsAdmin->delete();
        session()->flash('success', trans('admin.deleted_record'));
        return redirect(aurl('productsAdmin'));
    }

    public function multi_delete() {
        if (is_array(request('item'))) {
            foreach (request('item') as $id) {
                $productsAdmin = ProductAdmin::find($id);
                Storage::delete($productsAdmin->logo);
                $productsAdmin->delete();
            }
        } else {
            $productsAdmin = ProductAdmin::find(request('item'));
            Storage::delete($productsAdmin->logo);
            $productsAdmin->delete();
        }
        session()->flash('success', trans('admin.deleted_record'));
        return redirect(aurl('productsAdmin'));
    }
}
