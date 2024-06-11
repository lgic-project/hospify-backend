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

    <form method="post" action="{{route('authcreatea')}}" enctype="multipart/form-data">
        
    @csrf 
    <h1 >Registration Form </h1>
    <div class="form-group">
    

    <div class="form-grop">
       
    <label for="name">Name</label>
                <input id="" class="block mt-1 w-full" type="text" name="name" value="" >
            </div>
            
<div class="mt-4">
                <label for="email" >Email</label>
                <input id="email" class="block mt-1 w-full" type="email" name="email" value="" required autocomplete="username" >
            </div>

            <div class="mt-4"> 
                <label for="password" value="" >Password</label>
                <input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="password">
                    <span class="text-danger">
                        @error('password')
                        {{$message}}
                        @enderror
                    </span>
            </div>

            <div class="mt-4">
                <label for="password_confirmation" value="">Confirm Password</label>
                <input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="password_confirmation" >
                <span>
                    
                        @error('password_confirmation') 
                        {{$message}}
                        @enderror
                    </span>
            </div>
<div>   
<div class="form-group">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="Doctor">Doctor</option>
                <option value="Nurse">Nurse</option>
                <option value="Patient">Patient</option>
            </select>
        </div>
   
<div>
    <button type="submit" name="submit" class="btn btn-primary">Submit</button>
</div>
</form>
</body>
</html>
