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
		dd( $admin );

		
		//return view('admin.admins.edit', compact('admin', 'title'));


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
				'icon'        => 'sometimes|nullable|'.v_image(),
  			], [], [
				'name'     => trans('admin.name'),
				'email'    => trans('admin.email'),
				'password' => trans('admin.password'),
				'icon' => trans('admin.icon'),
 			]);
 
		if (request()->hasFile('icon')) {
			$data['icon'] = up()->upload([
					'file'        => 'icon',
					'path'        => 'admins',
					'upload_type' => 'single',
					'delete_file' => '',
				]);
		}
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

	public function update_profile(Request $request)
	{
		//dd( $request->all() );
		$admin_info = auth('admin')->user();


		// $nicename = [
		// 	'name'     => trans('admin.name'),
		// 	'email'    => trans('admin.email'),
		// 	'password' => trans('admin.password'),
		// 	'icon' => trans('admin.icon'),
		// ];

		// $validatedData = $request->validate([
		// 	'name'      => 'required',
  //           'group_id'  => 'sometimes|nullable|',
		// 	'icon'      => 'required|image|max:1024|mimes:jpg,jpeg,png',
		// ], $nicename);




		if( $request->icon != null ) {

			$ext = $request->icon->getClientOriginalExtension();
	        $size = $request->icon->getSize();
	        $path = $request->icon->getRealPath();

	        $path = public_path('storage/admins/');
	        $imageName = 'admins/'.text_shuffle(15).'.'.$ext;

	        $request->icon->move($path, $imageName);

		}else {
			$imageName = $admin_info->icon;
		}


		if( $request->email != $admin_info->email ) {
			$validatedData = $request->validate([
				'email'    => 'required|email|unique:admins',
			], $nicename);

			$email = $request->email;
		}


		if ( $request->password == null ) {
			$password = $admin_info->password;
		}else {
			$validatedData = $request->validate([
				'password' => 'required|min:6',
			], $nicename);

			$password = bcrypt($request->password);

		}

		
 
		// if (request()->hasFile('icon')) {
		// 			'file'        => 'icon',
		// 			'path'        => 'admins',
		// 			'upload_type' => 'single',
		// 			'delete_file' => '',
		// 		]);
		// }



		// $data['password'] = bcrypt(request('password'));
		// Admin::create($data);
		// session()->flash('success', trans('admin.record_added'));
		// return redirect(aurl('admin'));
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
				'email'    => 'required|email|unique:admins',
				'password' => 'required|min:6',
                'group_id'         => 'sometimes|nullable|',
				'icon'        => 'sometimes|nullable|'.v_image(),
  			], [], [
				'name'     => trans('admin.name'),
				'email'    => trans('admin.email'),
				'password' => trans('admin.password'),
				'icon' => trans('admin.icon'),
 			]);
 
		if (request()->hasFile('icon')) {
			$data['icon'] = up()->upload([
					'file'        => 'icon',
					'path'        => 'admins',
					'upload_type' => 'single',
					'delete_file' => '',
				]);
		}
		$data['password'] = bcrypt(request('password'));
		Admin::create($data);
		session()->flash('success', trans('admin.record_added'));
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
 