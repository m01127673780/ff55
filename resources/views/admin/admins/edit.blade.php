@extends('admin.index')
@section('content')


<div class="box">
  <div class="box-header">
    <h3 class="box-title">{{ $title }}</h3>
  </div>
  <!-- /.box-header -->
  <div class="box-body">
    {!! Form::open(['url'=>aurl('admin/'.$admin->id),'method'=>'put', 'fils'=>'true' ]) !!}
     <div class="form-group">
        {!! Form::label('name',trans('admin.name')) !!}
        {!! Form::text('name',$admin->name,['class'=>'form-control']) !!}
     </div>
     <div class="form-group">
        {!! Form::label('group_id',trans('admin.group_id')) !!}
        {!! Form::number('group_id',$admin->group_id,['class'=>'form-control']) !!}
     </div>

   
 
       <div class="form-group">
       
     </div>
     <div class="form-group">
        {!! Form::label('email',trans('admin.email')) !!}
        {!! Form::email('email',$admin->email,['class'=>'form-control']) !!}
     </div>
     <div class="form-group">
        {!! Form::label('password',trans('admin.password')) !!}
        {!! Form::password('password',['class'=>'form-control']) !!}
     </div>
          <div class="form-group">
        {!! Form::label('icon',trans('admin.icon')) !!}
        {!! Form::file('icon',['class'=>'form-control']) !!}



        @if(!empty($admin->icon) and Storage::has($admin->icon))
             <img src="{{ Storage::url($admin->icon) }}" style="width:100px;height: 100px;">
            @endif
     </div>
     


     {{--    <div class="form-group">
            {!! Form::label('icon',trans('admin.icon')) !!}
            {!! Form::file('icon',['class'=>'form-control']) !!}
            @if(!empty($admin->icon) and Storage::has($admin->icon))
             <img src="{{ Storage::url($admin->icon) }}" style="width:100px;height: 100px;">
            @endif
        </div> --}}
     {!! Form::submit(trans('admin.save'),['class'=>'btn btn-primary']) !!}
    {!! Form::close() !!}
  </div>
  <!-- /.box-body -->
</div>
<!-- /.box -->



@endsection