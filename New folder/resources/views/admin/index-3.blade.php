@include('admin.layouts.header')
@include('admin.layouts.navbar')

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style=" ">
    <!-- Content Header (Page header) -->
    <section class="content-header container">
      <h1 class="text-center">
        <span class="span">
        <span> <?php echo date("Y"); ?></span>

        <span>{{ trans('admin.Y') }}</span>
      </span>
      </h1>
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
   .content-wrapper{
    background-color: #000;
background-image: url(https://scontent-hbe1-1.xx.fbcdn.net/v/t1.0-9/59837262_1195845870584406_8167696975605530624_n.jpg?_nc_cat=109&_nc_ht=scontent-hbe1-1.xx&oh=99562e057daf6b4ab5e8e39c1f32c1ec&oe=5D6F824C);
background-repeat: no-repeat;
background-size: cover;
   }

   .content-header>.breadcrumb>li>a {
    color: #fff;
    text-decoration: none;
    display: inline-block;
}
.span{
  border-bottom: 1px solid #fff;
  padding: 3px 12px;
  line-height: 14;
}
.content-header>.breadcrumb {
     line-height: 7;
     background-color: transparent;
  }

</style>

@include('admin.layouts.footer')