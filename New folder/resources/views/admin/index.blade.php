@include('admin.layouts.header')
@include('admin.layouts.navbar')


 <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
   
      <ul class="breadcrumb">
         <li class="active">  <a href="{{ aurl(' ') }}"><i class="fa fa-dashboard"> </i>{{ trans('admin.main') }}</a></li>
        <li class="active"><a href="{{ aurl('products') }}"> {{ trans('admin.sms') }}</a></li>

        @if(auth::guard('admin')->user()->group_id == 3) 
        <li class="active"><a href="{{ aurl('productsAdmin') }}"> {{ trans('admin.productsAdmin') }}</a></li>
        <li class="active"><a href="{{ aurl('admin') }}"> {{ trans('admin.admins-top') }}</a></li>
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
<style type="text/css">
.content {
    min-height: 250px;
    padding: 69px;
    margin-left: auto;
    margin-right: auto;
    padding-right: 15px;
    padding-left: 15px;
}  .content-header>.breadcrumb {
    /* float: left; */
    background: transparent;
    /* margin-top: 0; */
    /* margin-bottom: 17px; */
    /* font-size: 12px; */
 /*   padding: 7px 5px;
    position: inherit;*/
  }
  
</style>

@include('admin.layouts.footer')