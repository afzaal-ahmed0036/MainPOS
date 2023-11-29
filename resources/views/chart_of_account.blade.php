@extends('template.tmp')

@section('title', $pagetitle)
 

@section('content')

   <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid"><div class="row">

                      <div class="row"><div class="row">
  <div class="col-12">
  
  @if (session('error'))

 <div class="alert alert-{{ Session::get('class') }} p-1" id="success-alert">
                    
                   {{ Session::get('error') }}  
                </div>

@endif

 @if (count($errors) > 0)
                                 
                            <div >
                <div class="alert alert-danger p-1   border-3">
                   <p class="font-weight-bold"> There were some problems with your input.</p>
                    <ul>
                        
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>

                        @endforeach
                    </ul>
                </div>
                </div>
 
            @endif

  
 <div class="card shadow-sm">
    
  <div class="card-header">
        <h2>Chart of Account</h2>
  </div>
    
   <div class="row">
     <div class="col-md-6">  


    <!-- enctype="multipart/form-data" -->
    <form action="{{URL('/ChartOfAccountSave')}}" method="post">


     {{csrf_field()}} 


     <div class="card-body">
      <h5 class="mb-3">Level 2</h5>
      <input type="hidden" name="Level" value="2">
         <div class="col-md-12 col-sm-12">
               <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label fw-bold" for="first-name">Parent Head</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="ChartOfAccountID" id="ChartOfAccountID" class="form-select select2">
                        <option value="">Select</option>
                        <?php foreach ($chartofaccount_l1 as $key => $value): ?>
                          <option value="{{$value->ChartOfAccountID}}">{{$value->ChartOfAccountID}}-{{$value->ChartOfAccountName}}</option>
                        <?php endforeach ?>
                  
                      </select>
                  </div>
                </div>

                <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label fw-bold" for="first-name">Chart of Acc</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="text" id="first-name" class="form-control" name="ChartOfAccountName" >
                  </div>
                </div>

                

            
           

              
                


              </div>
               <div class="card-footer bg-transparent">
        
        <div><button type="submit" class="btn btn-success w-sm float-right">Save</button>
             <a href="{{URL('/Dashboard')}}" class="btn btn-secondary w-sm float-right">Cancel</a>
        
        
      </div>
  </div>
      </div></form>




    </div>
      <div class="col-md-6">  

        <!-- enctype="multipart/form-data" -->
        <form action="{{URL('/ChartOfAccountSaveL3')}}" method="post">
         {{csrf_field()}} 
             <input type="hidden" name="Level" value="3">

         <div class="card-body">
      <h5 class="mb-3">Level 3</h5>
     
         <div class="col-md-12 col-sm-12">
               <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label fw-bold" for="first-name">Parent Head</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="ChartOfAccountID" id="ChartOfAccountID" class="form-select select2">
                        <option value="">Select</option>
                        <?php foreach ($chartofaccount_l2 as $key => $value): ?>
                          <option value="{{$value->ChartOfAccountID}}">{{$value->ChartOfAccountID}}-{{$value->ChartOfAccountName}}</option>
                        <?php endforeach ?>
                  
                      </select>
                  </div>
                </div>

                <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label fw-bold" for="first-name">Chart of Acc</label>
                  </div>
                  <div class="col-sm-9">
                    <input type="text" id="first-name" class="form-control" name="ChartOfAccountName" >
                  </div>
                </div>

               
  <div class="mb-3 row">
                  <div class="col-sm-3">
                    <label class="col-form-label fw-bold" for="first-name">Type ( if Bank/Card)</label>
                  </div>
                  <div class="col-sm-9">
                    <select name="Category" id="Category" class="form-select">
                      <option value="0">Select </option>
                      <option value="BANK">BANK</option>
                      <option value="CARD">CARD</option>
                    </select>
                  </div>
                </div>

            
             

              
                


              </div>
               <div class="card-footer bg-transparent">
        
        <div><button type="submit" class="btn btn-success w-sm float-right">Save</button>
             <a href="{{URL('/Dashboard')}}" class="btn btn-secondary w-sm float-right">Cancel</a>
        
        
      </div>
  </div>
      </div>


    </form>


    </div>
   </div>
     
  
  </div>

  


 <div class="card shadow-sm">
    <div class="card-header">
      <h4>Chart of Accounts</h4>
    </div>
      <div class="card-body">
         @if(count($chartofaccount)>0)    
       <div class="table-responsive">
          <table class="table table-sm align-middle table-nowrap mb-0" id="student_table">
        <tbody><tr>
        <th class="col-md-1">S.No</th>
        <th class="col-md-1">Code</th>
        <th class="col-md-3">Chart of Account</th>
         <th class="col-md-1">L1</th>
        <th class="col-md-1">L2</th>
        <th class="col-md-1">L3</th>
        <th class="col-md-1">Action</th>
        </tr>
        </tbody>
        <tbody>
        @foreach ($chartofaccount as $key =>$value)
         <tr>
         <td class="col-md-1">{{$key+1}}</td>
         <td class="col-md-1">{{$value->ChartOfAccountID}}</td>
         <td class="col-md-4"><a  target="_blank" href="{{URL('/JournalEntries/'.$value->ChartOfAccountID.'/2020-01-01'.'/'.date('Y-m-d'))}}">{{$value->ChartOfAccountName}}</a></td>
          <td class="col-md-1">{{$value->L1}}</td>
         <td class="col-md-1">{{$value->L2}}</td>
         <td class="col-md-1">{{$value->L3}}</td>
         <td class="col-md-1"><a href="{{URL('/ChartOfAccountEdit/'.$value->ChartOfAccountID)}}"><i class="bx bx-pencil align-middle me-1"></i></a> <a href="#" onclick="delete_confirm2('ChartOfAccountDelete',{{$value->ChartOfAccountID}})"><i class="bx bx-trash  align-middle me-1"></i></a></td>
         </tr>
         @endforeach   
         </tbody>
         </table>
       </div>
         @else
           <p class=" text-danger">No data found</p>
         @endif   
      </div>
  </div>
  
  </div>
</div>

        </div>
      </div>
    </div>
    <!-- END: Content-->
@endsection

@push('after-scripts')
<script type="text/javascript">
$(document).ready(function() {
     $('#student_table').DataTable( );
});
</script>

 
  @endpush