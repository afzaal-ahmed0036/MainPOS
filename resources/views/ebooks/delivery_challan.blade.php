@extends('template.tmp')
@section('title', $pagetitle)

@section('content')

<div class="main-content">
  <div class="page-content">
    <div class="container-fluid">
      <!-- start page title -->
      <div class="row">
        <div class="col-12">
          <div class="page-title-box d-sm-flex align-items-center justify-content-between">
            <h4 class="mb-sm-0 font-size-18">All Delivery Challans</h4>
            <div class="page-title-right ">
              
              <div class="btn-group  shadow-sm dropstart">
                 <a href="{{URL('/DeliveryChallanCreate')}}" class="btn btn-primary"> + New </a>
                
              </div>
            </div>
            
            
            
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-12">
          
          @if (session('error'))
          <div class="alert alert-{{ Session::get('class') }} p-1" id="success-alert">
            
            {{ Session::get('error') }}
          </div>
          @endif
          @if (count($errors) > 0)
          
          <div >
            <div class="alert alert-danger pt-3 pl-0   border-3">
              <p class="font-weight-bold"> There were some problems with your input.</p>
              <ul>
                
                @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
                @endforeach
              </ul>
            </div>
          </div>
          
          @endif
          
          <div class="card">
            
            <div class="card-body">
              <table id="student_table" class="table table-striped table-sm " style="width:100%">
                <thead>
                  <tr>
                    <th>Date</th>
                    <th>DELIVERY CHALLAN#</th>
                    <th>Reference</th>
                    <th>CUSTOMER NAME</th>
                    <th>Amount</th>
                     
                    <th>Action</th>
                  </tr>
                </thead>
              </table>
            </div>
          </div>
          
        </div>
      </div>
    </div>
  </div>
</div>
@endsection
<!-- END: Content-->
@push('after-scripts')
<script type="text/javascript">
$(document).ready(function() {
$('#student_table').DataTable({
"processing": true,
"serverSide": true,
"ajax": "{{ url('ajax_deliverychallan') }}",
"columns":[
{ "data": "ChallanDate" },
{ "data": "ChallanNo" },
{ "data": "ReferenceNo" },
{ "data": "PartyName" },

{ "data": "Total" },


{ "data": "action" },
]
});
});
</script>

@endpush

