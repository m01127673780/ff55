<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ trans('admin.forgot_password') }}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/dist/css/AdminLTE.min.css">
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/dist/css/custom-login.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="{{ url('design/adminlte') }}/plugins/iCheck/square/blue.css">
 
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

  <!-- Google Font -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>

<div class="bod"  >
    <div class="blur" id="particles-js"></div>
    <form method="post" >
        <img class='img-login' src="{{ url('design/adminlte') }}/dist/img/admin-img.jpg" class="img-circle" alt="User Image">
<!--         <img class='img-login' src="http://localhost/work-php/55/10/admin/images/login.jpg" class="img-circle" alt="User Image">
 -->      {!! csrf_field() !!}
        <h2 class="text-center heading-login" >{{ trans('admin.supervisor-name') }}</h2>
        <img src="">

  <!-- /.login-logo -->
   @if(session()->has('success'))
     <div class="alert alert-success">
       <h1>{{ session('success') }}</h1>
     </div>
    @endif

    @if($errors->all())
     <div class="alert alert-danger">
       @foreach($errors->all() as $error)
        <li>{{ $error }}</li>
       @endforeach
     </div>
    @endif

      <div class="form-group login-box-body">
 
 





  <form method="post">
        {!! csrf_field() !!}
       <aside style="background-color: #fff;">
      <div class="form-group has-feedback">
        <input type="email" name="email" value="{{ $data->email }}" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>


  
      <div class="form-group has-feedback">
        <input type="password" name="password" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

       <div class="form-group has-feedback">
        <input type="password" name="password_confirmation" class="form-control" placeholder="Enter Confirmation Password">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
</aside>
      <div class="row">

        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Reset</button>
        </div>
 
        <!-- /.col -->
      </div>
    </form>


    <!-- /.social-auth-links -->

    <a style="color:blue; position:  20px "href="{{ aurl('login') }}">Sign in</a><br>

  </div>
  <!-- /.login-box-body -->



<style type="text/css">
  
 .register-box-body {
    /* background: #8d8b42; */
    padding: 20px;
    border-top: 0;
    color: #fff;
}
.login-box-body, .register-box-body {
    background: #fff;
    padding: 20px;
    border-top: 0;
    color: #666;
}

.icheck>label, a {
    padding-left: 0;
       color:blue ;
     
}
</style>



















</div>
<div class='overlay'>
  <span id="load"></span>
</div>

<!--start login-->
<a id="dash" href="dashboard.html"></a>
    </section>
    <div id='overlay'>
    </div>
    <script src="template/js/jquery-3.2.1.min.js" ></script>
    
<style type="text/css">
  
.icheck>label ,a {
    padding-left: 0;
    color: #ff;
    color: #fff;
}

</style>
<!-- jQuery 3 -->
<script src="{{ url('design/adminlte') }}/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="{{ url('design/adminlte') }}/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="{{ url('design/adminlte') }}/plugins/iCheck/icheck.min.js"></script>
<script src="{{ url('design/adminlte') }}/dist/js/custom-login.js"></script>
<script src="{{ url('design/adminlte') }}/dist/js/piugins-login/particles.min.js"></script>
<script src="{{ url('design/adminlte') }}/dist/js/piugins-login/app.js"></script>

 
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' /* optional */
    });
  });





</script>
</body>
</html>
