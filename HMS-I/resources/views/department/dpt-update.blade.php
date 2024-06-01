<!DOCTYPE html>
<head><nav class="navbar navbar-default navbar-">
<nav class="navbar navbar-default navbar-">
    <!-- @if(session()->has('name'))
        {{session()->get('name')}}
    @else
    Guest
    @endif -->
    
    <div ><a href="{{route('pa.home')}}">
        <button class="btn btn-primary"> Home</button>
        </a></div>
    <div ><a href="{{route('pa.add')}}">
        <button class="btn btn-primary"> Add patients</button>
        </a></div>
    <div >
        <a href="{{route('pa.view')}}">
        <button class="btn btn-primary"> Patient View</button>
        </a>
    </div> 
    
    <div ><a href="{{route('dc.add')}}">
        <button class="btn btn-primary"> Add Doctor</button>
        </a></div>
    <div >
        <a href="{{route('dc.view')}}">
        <button class="btn btn-primary">view doc</button>
        </a>
    </div> 
    <div >
        <a href="{{route('nr.add')}}">
        <button class="btn btn-primary">Add Nurse</button>
        </a>
    </div> 
    <div > 
        <a href="{{route('nr.view')}}">
        <button class="btn btn-primary">View Nurse</button>
        </a>
    </div> 
</nav>
  
</nav>
</head>
<body>

    <form method="post" action="{{route('dt.update', ['id' => $dpt->dpt_id])}}" enctype="multipart/form-data">
        
    @csrf 
    <h1 >Department Update </h1>
    <div class="form-group">
    

    <div class="form-grop">
       
    <label for="dpt_name">Department Name</label>
                <input id="" class="block mt-1 w-full" type="text" name="dpt_name" value="{{old('dpt_name', $dpt->dpt_name)}}" >
            </div>
            <label for="dpt_des">Description</label>
                <input id="" class="block mt-1 w-full" type="text" name="dpt_des" value="{{old('dpt_des', $dpt->dpt_des)}}" >
            </div>
           
   
<div>
    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</body>
</html>
