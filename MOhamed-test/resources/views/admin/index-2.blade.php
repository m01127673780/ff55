@include('admin.layouts.header')
@include('admin.layouts.navbar')


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1 class="text-left">
        
        <span> <?php echo date("Y"); ?>
</span>
        <span>{{ trans('admin.Y') }}</span>
      </h1>
      <ul class="breadcrumb">
         <li class="active">  <a href="{{ aurl(' ') }}"><i class="fa fa-dashboard"> </i>{{ trans('admin.main') }}</a></li>
        <li class="active"><a href="{{ aurl('products') }}"> {{ trans('admin.sms') }}</a></li>

        @if(auth::guard('admin')->user()->group_id == 3) 
        <li class="active"><a href="{{ aurl('productsAdmin') }}"> {{ trans('admin.productsAdmin') }}</a></li>
        @endif

 
        <li class="active"><a href="{{ aurl('products') }}"> {{ trans('admin.departments') }}</a></li>

         <a href="{{ url()->current() }}" class="dt-button buttons-reload btn btn-default"><span><i class="fa fa-refresh"></i></span></a>
      </ul>
    </section>
     <!-- Main content -->
    <section class="content">
    	@include('admin.layouts.message')
    	@yield('content')
     </section>
    <!-- /.content -->
  </div>


@include('admin.layouts.footer')