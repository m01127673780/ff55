@extends('admin.index-3')
@section('content')
 


      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="container" style="margin-top: 5;">

        
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
                  <h3>{{  $Department = DB::table('departments')->count()  }}</h3>

              <p> {{ trans('admin.departments-one') }}</p>
            </div>
            <div class="icon">
              <i class="fa fa-signal "></i>
            </div>
            <a href="{{ aurl('departments') }}" class="small-box-footer">  {{ trans('admin.departments') }} <i class="fa fa-signal"></i></a>
          </div>
        </div>


        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
           <div class="small-box bg-green"> <!-- small box -->
              <div class="inner">
                  <h3>{{  $Product = DB::table('products')->count()  }}</h3>

                    <p>{{ trans('admin.products') }}</p>
                           </div>
                          <div class="icon">
                         <i class="fa fa-floppy-o"></i>
                      </div>
                    <a href="{{ aurl('products') }}" class="small-box-footer"> {{ trans('admin.products') }} <i class="fa fa-floppy-o "> </i>
                </a>
            </div>
        </div>
        <!-- ./col -->
                  

        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{{  $ProductAdmin = DB::table('productsAdmin')->count()  }}</h3>

              <p>{{ trans('admin.productsAdmin') }} </p>
            </div>
            <div class="icon">
              <i class="fa fa-print"></i>
            </div>
            <a href="{{ aurl('productsAdmin') }}" class="small-box-footer"> {{ trans('admin.productsAdmin') }} <i class="fa fa-fa-print"></i></a>
          </div>
        </div>

        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{{  $Admin = DB::table('admins')->count()  }}</h3>

              <p> 65</p>
            </div>
            <div class="icon">
              <i class="fa fa-users"></i>
            </div>
            <a href="{{ aurl('admin') }}" class="small-box-footer">{{ trans('admin.admin') }}<i class="fa fa-users"></i></a>
          </div>
        </div>
        <!-- ./col -->
</div></div>
      <!-- /.row -->
      <!-- Main row -->
     
      <!-- /.row (main row) -->

@endsection