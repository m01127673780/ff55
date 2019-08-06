<?php
namespace App\Http\Controllers\Admin;
use App\Admin;
use App\DataTables\AdminDatatable;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Storage;

class AdminController extends Controller {

	public function profile()
	{
		$admin = auth('admin')->user();
//		dd( $admin->email );

		//return view('', compact('admin'));
				return view('admin.admins.edit', compact('admin', 'title'));


	}


	/**
	 * Display a listing of the resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function index(AdminDatatable $admin) {
		
		$user_group_id = auth('admin')->user()->group_id;

		if( $user_group_id == 3 ) {

			Admin::all();
			return $admin->render('admin.admins.index', ['title' => 'Admin Control']);
		}else {
			return 'Not Found';		
			// return view('admin.admins.create', ['title' => trans('admin.create_admin')]);

		}

	}

	/**
	 * Show the form for creating a new resource.
	 *
	 * @return \Illuminate\Http\Response
	 */
	public function create() {

		return view('admin.admins.create', ['title' => trans('admin.create_admin')]);

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
				'name'     => 'required',
				'email'    => 'required|email|unique:admins',
				'password' => 'required|min:6',
                'group_id'         => 'sometimes|nullable|',
  			], [], [
				'name'     => trans('admin.name'),
				'email'    => trans('admin.email'),
				'password' => trans('admin.password'),
 			]);
 

		$data['password'] = bcrypt(request('password'));
		Admin::create($data);
		session()->flash('success', trans('admin.record_added'));
		return redirect(aurl('admin'));
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



	public function edit_profile()
	{
		$admin = auth('admin')->user();
		$title = trans('admin.profile');
	

		return view('admin.admins.profile', compact('admin', 'title'));
	}

	public function update_profile()
	{
		$data = $this->validate(request(),
		[
			'name'     => 'required',
			'email'    => 'required|email|unique:admins,email,'.auth('admin')->user()->id,
			'password' => 'sometimes|nullable|min:6',
			'group_id'         => 'sometimes|nullable|',

           
		], [], [
			'name'     => trans('admin.name'),
			'email'    => trans('admin.email'),
			'password' => trans('admin.password'),
			]);

    
      

		if (request()->has('password')) {
			$data['password'] = bcrypt(request('password'));
		}
		Admin::where('id', auth('admin')->user()->id)->update($data);
		return back()->with('success', 'Done Profile Update');
	}


	public function edit($id) {

		$user_group_id = auth('admin')->user()->group_id;

		if( $user_group_id == 3 )
		{
			$admin = Admin::where('id',$id);
				
			if( $admin->count() > 0 ){

				$title = trans('admin.edit');
				$admin = $admin->first();
				return view('admin.admins.edit', compact('admin', 'title'));
			}else {
				return view('admin.admins.edit', compact('admin', 'title'));
				// return 'Not found';
			}
		} // End If Check If Group id == 3
		else {
			return 'Not allow Or Not Found Page';
		}

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
				'name'     => 'required',
				'email'    => 'required|email|unique:admins,email,'.$id,
				'password' => 'sometimes|nullable|min:6',
				'group_id'         => 'sometimes|nullable|',

               
			], [], [
				'name'     => trans('admin.name'),
				'email'    => trans('admin.email'),
				'password' => trans('admin.password'),
 			]);

    
      

		if (request()->has('password')) {
			$data['password'] = bcrypt(request('password'));
		}
		Admin::where('id', $id)->update($data);
		session()->flash('success', trans('admin.updated_record'));
		return redirect(aurl('admin'));
	}

	/**
	 * Remove the specified resource from storage.
	 *
	 * @param  int  $id
	 * @return \Illuminate\Http\Response
	 */
	public function destroy($id) {
		Admin::find($id)->delete();
		session()->flash('success', trans('admin.deleted_record'));
		return redirect(aurl('admin'));
	}

	public function multi_delete() {
		if (is_array(request('item'))) {
			Admin::destroy(request('item'));
		} else {
			Admin::find(request('item'))->delete();
		}
		session()->flash('success', trans('admin.deleted_record'));
		return redirect(aurl('admin'));
	}
}
