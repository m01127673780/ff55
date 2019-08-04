@if(count($errors->all()) > 0)
 <div class="alert alert-danger">
 	<ul>
 		@foreach($errors->all() as $error)
 		 <li>{{ $error }}</li>
 		@endforeach
 	</ul>
 </div>
@endif

@if(session()->has('success'))
 <span class="alert alert-success">
 	<span>{{ session('success') }}</span>
 </span>
@endif

@if(session()->has('error'))
 <div class="alert alert-danger">
 	<h2>{{ session('error') }}</h2>
 </div>
@endif