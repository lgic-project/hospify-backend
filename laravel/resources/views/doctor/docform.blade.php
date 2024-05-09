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
        <button class="btn btn-primary"> patients</button>
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
</nav>
  
</nav>
</head>
<body>

    <form method="post" action="{{$url}}">
        
    @csrf 
    <h1 >{{$title}} </h1>
    <div class="form-group">
    

    <div class="form-grop">
       
    <label for="fname">First Name</label>
                <input id="" class="block mt-1 w-full" type="text" name="fname" value="{{old('fname', $doctor->fname)}}" >
            </div>
            <div>
                <label for="lname">Last Name</label>
                <input id="" class="block mt-1 w-full" type="text" name="lname" value="{{old('lname', $doctor->lname)}}" required autofocus autocomplete="lname" >
            </div>
            <div>
                <label for="address" >Address</label>
                <input id="" class="block mt-1 w-full" type="text" name="address" value="{{old('address', $doctor->address)}}" required autofocus autocomplete="address" >
            </div>
            <div>
                <label for="city" >City</label>
                <input id="" class="block mt-1 w-full" type="text" name="city" value="{{old('city', $doctor->city)}}" required autofocus autocomplete="address" >
            </div>
            <div>
                <label for="pnm" >Phone number</label>
                <input id="" class="block mt-1 w-full" type="number" name="pnm" value="{{old('pnm', $doctor->pnm)}}" required autofocus autocomplete="pnm" >
            </div>
            <div>
            <label>Gender:</label><br>
        <input type="radio" id="male" name="gender" value="M" 
        {{$doctor->gender=="M"? "checked":""}}>
        <label for="male">Male</label>

        <input type="radio" id="female" name="gender" value="F" 
        {{$doctor->gender=="F"? "checked":""}}>
        <label for="female">Female</label>

        <input type="radio" id="other" name="gender" value="O" 
        {{$doctor->gender=="O"? "checked":""}}>
        <label for="other">Other</label><br>
            </div>
            <div>
                <label for="age">Age</label>
                <input id="" class="block mt-1 w-full" type="number" name="age" value="{{old('age', $doctor->age)}}" required autofocus autocomplete="age">
            </div>

            <div class="mt-4">
                <label for="email" >Email</label>
                <input id="email" class="block mt-1 w-full" type="email" name="email" value="{{old('email', $doctor->email)}}" required autocomplete="username" >
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
    <button type="submit" name="submit" class="btn btn-primary">submit</button>
</div>
</form>
</body>
</html>
