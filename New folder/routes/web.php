<?php
Route::group(['middleware' => 'admin'], function () {

		Route::get('/', function () {
				return view('admin.home');
			});
	});

Route::get('maintenance', function () {

		if (setting()->status == 'open') {
			return redirect('/');
		}

				return view('admin.home');
	});
Auth::routes();

				return view('admin.home');
