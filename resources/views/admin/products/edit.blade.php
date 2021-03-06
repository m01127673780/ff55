
       @extends('admin.index')
@section('content')
@push('js')

 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/dropzone/5.5.1/min/dropzone.min.js">
    
</script> 
 

 </script>


<script type="text/javascript">
$(document).ready(function(){

  $('#jstree').jstree({
    "core" : {
      'data' : {!! load_dep($product->department_id) !!},
      "themes" : {
        "variant" : "large"
      }
    },
    "checkbox" : {
      "keep_selected_style" : false
    },
    "plugins" : [ "wholerow" ]
  });

});

 $('#jstree').on('changed.jstree',function(e,data){
    var i , j , r = [];
    for(i=0,j = data.selected.length;i < j;i++)
    {
        r.push(data.instance.get_node(data.selected[i]).id);
    }
    $('.department_id_id').val(r.join(', '));
});

</script>
@endpush

<div class="box">
    <div class="box-header">
        <h3 class="box-title">{{ $title }}</h3>
    </div>
    <!-- /.box-header -->
    <!-- /. 
    'product_name_ar',
      'product_name_en',
      'desc_ar',
      'desc_en',
      'photo',
       'price',
       'department_id', -->
    <div class="box-body">
        {!! Form::open(['url'=>aurl('products'),'files'=>true]) !!}
        <div class="form-group">
            {!! Form::label('product_name_ar',trans('admin.product_name_ar')) !!}
            {!! Form::text('product_name_ar',$product->product_name_ar,['class'=>'form-control']) !!}
        </div>
     

         <div class="form-group">
            {!! Form::label('desc_ar',trans('admin.desc_ar')) !!}
            {!! Form::text('desc_ar',$product->desc_ar,['class'=>'form-control']) !!}
        </div>
<!-- 
         <div class="form-group">
            {!! Form::label('desc_en',trans('admin.desc_en')) !!}
            {!! Form::text('desc_en',$product->desc_en,['class'=>'form-control']) !!}
        </div> -->

         <div class="form-group">
            {!! Form::label('price',trans('admin.price')) !!}
            {!! Form::text('price',$product->price ,['class'=>'form-control','maxlength'=>"9"]) !!}
        </div>     
            <div class="form-group">
            {!! Form::label('nun_sms',trans('admin.nun_sms')) !!}
            {!! Form::text('nun_sms',$product->nun_sms ,['class'=>'form-control']) !!}
        </div>  
          <div class="form-group">
            {!! Form::label('num_member',trans('admin.num_member')) !!}
            {!! Form::text('num_member',$product->num_member ,['class'=>'form-control']) !!}
        </div> 
        <div class="form-group">
            {!! Form::label('date_month',trans('admin.date_month')) !!}
            {!! Form::text('date_month',$product->date_month ,['class'=>'form-control']) !!}
        </div>
 

        <div class="clearfix"></div>
        <div id="jstree"></div>
        <input type="hidden" name="department_id" class="department_id_id" value="{{ old('department_id') }}">
        <div class="clearfix"></div>
        
        
      
        {!! Form::submit(trans('admin.add'),['class'=>'btn btn-primary']) !!}
        {!! Form::close() !!}
    </div>
    <!-- /.box-body -->
</div>
<!-- /.box -->


@endsection