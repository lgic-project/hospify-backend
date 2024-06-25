<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
   
    <link href="/assets/css/form.css" rel="stylesheet" />
    <link href="assets/css/table.css" rel="stylesheet" />

</head>

<body>
<nav class="navbar navbar-default">
    <!-- Your navigation links here -->
    <div><a href="{{ route('pa.home') }}"><button class="btn btn-primary"> Home</button></a></div>
   
</nav>
</nav>
    <form method="post" action="{{route('dc.update',['id' => $doctor->dc_id])}}" enctype="multipart/form-data">
        
    @csrf 
    <h1 >{{$title}} </h1>
    <div class="form-group">
    

    <div class="form-group" >
    <div class="fresh-table full-color-orange">
    <label for="fname">first-name 8000</label>
                <input id="" class="block mt-1 w-full" type="text" name="fname" value="{{old('fname', $doctor->fname)}}" >
            </div>
            <div class="form-group">
                <label for="lname">Last name</label>
                <input id="" class="block mt-1 w-full" type="text" name="lname" value="{{old('lname', $doctor->lname)}}" required autofocus autocomplete="lname" >
            </div>
            <div class="form-group">
                <label for="address" >Address</label>
                <input id="" class="block mt-1 w-full" type="text" name="address" value="{{old('address', $doctor->address)}}" required autofocus autocomplete="address" >
            </div>
            <div class="form-group">
                <label for="city" >City</label>
                <input id="" class="block mt-1 w-full" type="text" name="city" value="{{old('city', $doctor->city)}}" required autofocus autocomplete="address" >
            </div>
            <div class="form-group">
                <label for="pnm" >Phone number</label>
                <input id="" class="block mt-1 w-full" type="number" name="pnm" value="{{old('pnm', $doctor->pnm)}}" required autofocus autocomplete="pnm" >
            </div>
            <div class="form-group">
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
            <div class="form-group">
                <label for="age">Age</label>
                <input id="" class="block mt-1 w-full" type="number" name="age" value="{{old('age', $doctor->age)}}" required autofocus autocomplete="age">
            </div>

            <div class="form-group">
                <label for="email" >Email</label>
                <input id="email" class="block mt-1 w-full" type="email" name="email" value="{{old('email', $doctor->email)}}" required autocomplete="username" >
            </div>

            <div class="form-group">
                <label for="password" value="" >Password</label>
                <input id="password" class="block mt-1 w-full" type="password" name="password" required autocomplete="password">
                    <span class="text-danger">
                        @error('password')
                        {{$message}}
                        @enderror
                    </span>
            </div>

            <div class="form-group">
                <label for="password_confirmation" value="">Confirm Password</label>
                <input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="password_confirmation" >
                <span>
                    
                        @error('password_confirmation')
                        {{$message}}
                        @enderror
                    </span>
            </div>
            <div class="form-group">
    <label></label>
    <input type="file" name="img1"class="form-control">
</div>
   
<div>
    <button type="submit" name="submit" class="btn btn-primary">Update</button>
</div>
    </div>
    </div>
</form>
</body>
</html>
