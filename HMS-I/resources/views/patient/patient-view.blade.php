<!doctype html>
<html lang="en">
  <head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <nav class="navbar navbar-default navbar-">
      
    <nav class="navbar navbar-default navbar-">
    <!-- @if(session()->has('name'))
        {{session()->get('name')}}
    @else
    Guest
    @endif -->
  
   <div><a href="{{route('pa.home')}}">
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
        <button class="btn btn-primary">View Doc</button>
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
  <div>
  
  </div>
  </head>
  <body>
  <div ><a href="{{route('pa.add')}}">
        <button class="btn btn-primary"> Add Customers</button>
        </a></div>
    <div >
      <div class="container">
      <table class="table">
  <thead>
    <tr>
      <th>FName</th>
      <th>Lname</th>
      <th>address</th>
      
      <th>City</th>
      <th>Phone number</th>
      <th>Gender</th>
      <th>Age</th>
      <th>email</th>
      <th>Action</th>
      
    </tr>
  </thead>
  <tbody>
  @foreach($patient as $patients)
    <tr>
        <td>{{ $patients->fname }}</td>
        <td>{{ $patients->lname }}</td>
        <td>{{ $patients->address }}</td>
        <td>{{ $patients->city }}</td>
        <td>{{ $patients->pnm }}</td>
        <td>{{ $patients->gender }}</td>
        <td>{{ $patients->age }}</td>
        <td>{{ $patients->email }}</td>
        <td>
          <a href="{{url('/patient/delete/')}}/{{$patients->pa_id}} ">
          <button class="btn btn-danger">Delete</button>
        
          </a>
     
          <a href="{{url('/patient/edit/')}}/{{$patients->pa_id}}">
          <button class="btn btn-primary">Edit</button>
        </a>
        </td>
        
        
    </tr>
@endforeach

    </tbody>
  </table>

</div>
  </body>
</html>