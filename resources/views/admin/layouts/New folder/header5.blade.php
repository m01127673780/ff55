<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>{{ !empty($title)?$title:trans('admin.adminpanel') }}</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.7 -->
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  @if(direction() == 'ltr')
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/AdminLTE.min.css">
  @else
<link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/rtl/rtl/AdminLTE-rtl.min.css">
 <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/rtl/rtl/bootstrap-rtl.min.css">
<link rel="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.1/css/all.min.css">
<link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/rtl/rtl/rtl.css">
<link rel="stylesheet" href="{{ url('/') }}/design/adminlte/jstree/themes/default/style.css">
<link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/tableRespons.css">
<script src="{{ url('/design/adminlte/dist/js/myfunctions.js') }}"></script>
<link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/style-custom.css">  
  <link href="https://fonts.googleapis.com/css?family=Cairo:300,400&amp;subset=arabic,latin-ext" rel="stylesheet">
  <style type="text/css">
    html,body ,h1,h2,h3,h4,h5,h6{
      font-family: 'Cairo', sans-serif;
    }
  </style>
  @endif
 
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/dist/css/skins/_all-skins.min.css">
  <link rel="stylesheet" href="{{ url('/') }}/design/adminlte/jstree/themes/default/style.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
  <script src="{{ url('/design/adminlte/dist/js/myfunctions.js') }}"></script>
  <!-- Google Font -->
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
