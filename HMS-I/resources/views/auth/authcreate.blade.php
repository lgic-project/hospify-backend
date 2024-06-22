<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ __('Login') }}</title>
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">

</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">{{ __('Login') }}</div>

                    <div class="card-body">
                    <form method="post" action="{{route('authcreatea')}}" enctype="multipart/form-data">
                            @csrf
                            <div class="mb-3">

                        <label for="aname">First Name</label>
                        <input id="" class="block mt-1 w-full" type="text" name="fname" value="" >
                       </div>
                       <div class="mb-3">
                       <label for="fname">Last Name</label>
                           <input id="" class="block mt-1 w-full" type="text" name="lname" value="" >
                       </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">{{ __('Email Address') }}</label>
                                <input id="email" type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                @error('email')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>

                            <div class="mb-3">
                                <label for="password" class="form-label">{{ __('Password') }}</label>
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                            <div class="mb-3">
                <label for="password_confirmation" value="">Confirm Password</label>
                <input id="password_confirmation" class="block mt-1 w-full" type="password" name="password_confirmation" required autocomplete="password_confirmation" >
                <span>
                    
                        @error('password_confirmation') 
                        {{$message}}
                        @enderror
                    </span>
            </div>
            <div class="mb-3">
            <label for="role">Role</label>
            <select class="form-control" id="role" name="role" required>
                <option value="Doctor">Doctor</option>
               
                <option value="Patient">Patient</option>
            </select>
        </div>
                            
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary">{{ __('Login') }}</button>

                               
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
