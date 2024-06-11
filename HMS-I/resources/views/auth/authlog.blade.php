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

    <form method="post" action="{{route('authlogina')}}" enctype="multipart/form-data">
        
    @csrf 
    <h1 >Auth Login Page </h1>
    <div class="form-group">
    

    <div class="form-grop">
       
   

            <div class="mt-4">
                <label for="email" >Email</label>
                <input id="email" class="block mt-1 w-full" type="email" name="email" value="" required autocomplete="username" >
            </div>

            <div class="mt-4"> 
                <label for="password" >Password</label>
                <input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="password">
                    <span class="text-danger">
                        @error('password')
                        {{$message}}
                        @enderror
                    </span>
            </div>

          

   
<div>
    <button type="submit" name="submit" class="btn btn-primary">Login</button>
</div>
</form>
</body>
</html>
