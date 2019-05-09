<header class="main-header">
  <!-- Logo -->
  <a href="index2.html" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>A</b>LT</span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg">{{ trans('admin.fiftyfive') }}</span> </a>

  
  <!-- Header Navbar: style can be found in header.less -->
  <nav class="navbar navbar-static-top">
    <!-- Sidebar toggle button-->
    <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
      <span class="sr-only">Toggle navigation</span>
    </a>
    @include('admin.layouts.menu')
  </nav>
</header>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">
  <!-- sidebar: style can be found in sidebar.less -->
  <section class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel">
      <div class="pull-left image">
        <img src="{{ url('design/adminlte') }}/dist/img/logo.png" class="img-circle" alt="User Image">




      </div>
      <div class="pull-left info">
        <br>
         <a href="#"><i class="fa fa-circle text-success"></i>{{ trans('admin.Online') }} </a>
      </div>
    </div>
    <!-- search form -->
    <form action="#" method="get" class="sidebar-form">
      <div class="input-group">
        <input type="text" name="q" class="form-control" placeholder="Search...">
        <span class="input-group-btn">
          <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
          </button>
        </span>
      </div>
    </form>
    <!-- /.search form -->
    <!-- sidebar menu: : style can be found in sidebar.less -->
    <ul class="sidebar-menu" data-widget="tree">
      <li class="header"></li>

      <li class="treeview {{ active_menu('')[0] }}">
        <a href="#">
          <i class="fa fa-tachometer"></i> <span>{{ trans('admin.dashboard') }}</span>
          <span class="pull-right-container">
            
          </span>
        </a>
        <ul class="treeview-menu" style="{{ active_menu('admin')[1] }}">
          <li class=""><a href="#">
            <i class="fa fa-cog fa-spin"></i> <span>{{ trans('admin.dashboard') }}</span>
            <span class="pull-right-container">
            </span>
          </a>
        </li>
        <li class=""><a href="#">
          <i class="fa fa-cogs"></i> <span>{{ trans('admin.settings') }}</span>
          <span class="pull-right-container">
          </span>
        </a>
      </li>
    </ul>
  </li>
   @if(auth::guard('admin')->user()->group_id == 3)  

  <li class="treeview {{ active_menu('admin')[0] }}">
    <a href="#">
      <i class="fa fa-users"></i> <span>{{ trans('admin.admin') }}</span>
      <span class="pull-right-container">
        
      </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('admin')[1] }}">
      <li class=""><a href="{{ aurl('admin') }}"><i class="fa fa-users"></i> {{ trans('admin.admin') }}</a></li>
      <li class=""><a href="{{ aurl('departments/create') }}"><i class="fa fa-user-plus"></i> {{ trans('admin.add') }}</a></li>

    </ul>
  </li>
   @endif
  <li class="treeview {{ active_menu('users')[0] }}">
    <a href="#">
      <i class="fa fa-users"></i> <span>{{ trans('admin.users') }}</span>
      <span class="pull-right-container">
 
      </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('users')[1] }}">
      <li class=""><a href="{{ aurl('users') }}"><i class="fa fa-address-card
"></i> {{ trans('admin.users') }}</a></li>
      <li class=""><a href="{{ aurl('users') }}?level=user"><i class="fa fa-user-secret
"></i> {{ trans('admin.user') }}</a></li>
      <li class=""><a href="{{ aurl('users') }}?level=vendor"><i class="fa fa-shopping-cart"></i> {{ trans('admin.vendor') }}</a></li>
      <li class=""><a href="{{ aurl('users') }}?level=company"><i class="fa fa-ship"></i> {{ trans('admin.company') }}</a></li>
    </ul>
  </li>
 
 
  <li class="treeview {{ active_menu('departments')[0] }}">
    <a href="#">
      <i class="fa fa-signal "></i> <span>{{ trans('admin.departments') }}</span>
      <span class="pull-right-container">
        
      </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('departments')[1] }}">
      <li class=""><a href="{{ aurl('departments') }}"><i class="fa fa-th-large"></i> {{ trans('admin.departments') }}</a></li>
      <li class=""><a href="{{ aurl('departments/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>

  

   <li class="treeview {{ active_menu('manufacturers')[0] }}">
    <a href="#">
      <i class="fa fa-users"></i> <span>{{ trans('admin.manufacturers') }}</span>
      <span class="pull-right-container">
        
      </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('manufacturers')[1] }}">
      <li class=""><a href="{{ aurl('manufacturers') }}"><i class="fa fa-codepen"></i> {{ trans('admin.manufacturers') }}</a></li>
      <li class=""><a href="{{ aurl('manufacturers/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>
   
@if(auth::guard('admin')->user()->group_id == 3) 
 <li class="treeview {{ active_menu('products')[0] }}">
    <a href="#">
      <i class="fa fa-floppy-o"></i> <span>{{ trans('admin.products') }}</span>
      <span class="pull-right-container">
       </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('products')[1] }}">
      <li class=""><a href="{{ aurl('products') }}"><i class="fa  fa-floppy-o  "></i> {{ trans('admin.products') }}</a></li>
      <li class=""><a href="{{ aurl('products/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>
   <li class="treeview {{ active_menu('products')[0] }}">
    <a href="#">
      <i class="fa fa-floppy-o"></i> <span>{{ trans('admin.productsAdmin') }}</span>
      <span class="pull-right-container">
       </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('productsAdmin')[1] }}">
      <li class=""><a href="{{ aurl('productsAdmin') }}"><i class="fa  fa-floppy-o  "></i> {{ trans('admin.productsAdmin') }}</a></li>
      <li class=""><a href="{{ aurl('productsAdmin/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>
  @endif





@if(auth::guard('admin')->user()->group_id ==  1) 

   <li class="treeview {{ active_menu('products')[0] }}">
    <a href="#">
      <i class="fa fa-floppy-o"></i> <span>{{ trans('admin.products') }}</span>
      <span class="pull-right-container">
       </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('products')[1] }}">
      <li class=""><a href="{{ aurl('products') }}"><i class="fa  fa-floppy-o  "></i> {{ trans('admin.products') }}</a></li>
      <li class=""><a href="{{ aurl('products/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>
  @endif

 
@if(auth::guard('admin')->user()->group_id == 2) 

   <li class="treeview {{ active_menu('productsAdmin')[0] }}">
    <a href="#">
      <i class="fa fa-floppy-o"></i> <span>{{ trans('admin.productsAdmin') }}</span>
      <span class="pull-right-container">
       </span>
    </a>
    <ul class="treeview-menu" style="{{ active_menu('productsAdmin')[1] }}">
      <li class=""><a href="{{ aurl('productsAdmin') }}"><i class="fa  fa-floppy-o  "></i> {{ trans('admin.productsAdmin') }}</a></li>
      <li class=""><a href="{{ aurl('productsAdmin/create') }}"><i class="fa fa-plus"></i> {{ trans('admin.add') }}</a></li>
    </ul>
  </li>
  @endif

</ul>
</section>
<!-- /.sidebar -->
</aside>
